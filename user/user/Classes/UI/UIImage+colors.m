//
//  UIImage+colors.m
//  HouseRent
//
//  Created by liruiqin on 14-4-1.
//  Copyright (c) 2014年 ganji.com. All rights reserved.
//

#import "UIImage+colors.h"
#import "POGeometry.h"

#define APPFRAME_HEIGHT         ([UIScreen mainScreen].applicationFrame.size.height)
#define APPFRAME_HEIGHT_ORI     (APPFRAME_HEIGHT - ([UIApplication sharedApplication].statusBarHidden ? 20 : 0))
#define APPFRAME_WIDTH          ([UIScreen mainScreen].applicationFrame.size.width)
#define IPHONE5_ABOVE           (APPFRAME_HEIGHT > 480)
@implementation UIImage (colors)

+(UIImage *)imageNamedAdaptationHD:(NSString *)name
{
    if (IPHONE5_ABOVE) {
    static NSString *hdSuffix = @"-568h";
    NSArray *suffixs = @[@".jpg",@".JPG",@".png",@".PNG"];
    NSString *nameWithoutSuffix = name;
    NSString *suf = @"";
    for (NSString *ss in suffixs) {
        if ([nameWithoutSuffix hasSuffix:ss]) {
            suf = ss;
            nameWithoutSuffix = [nameWithoutSuffix stringByReplacingOccurrencesOfString:ss withString:@""];
            break;
        }
    }
        nameWithoutSuffix = [[nameWithoutSuffix stringByAppendingString:hdSuffix] stringByAppendingString:suf];
        return [self imageNamed:nameWithoutSuffix];
    }
    else {
        return [self imageNamed:name];
    }
}

+(UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color imageSize:CGSizeMake(2, 2)];
}

+(UIImage *)imageWithColor:(UIColor *)color imageSize:(CGSize)imageSize
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 1.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithColor:(UIColor *)color
                 imageSize:(CGSize)imageSize
               borderColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
{
//    CGSize bgSize = CGSizeMake(imageSize.width -= borderWidth * 2, imageSize.height -= borderWidth * 2);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 1.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, borderColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, imageSize.width, imageSize.height));
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectInset(CGRectMake(0, 0, imageSize.width, imageSize.height), borderWidth,borderWidth));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageNamed:(NSString *)name withPadding:(UIEdgeInsets)edgeInsets
{
    UIImage *image = [self imageNamed:name];
    if (!image) {
        return nil;
    }
    return [self image:image withPadding:edgeInsets];
}

+(UIImage *)imageNamed:(NSString *)name withSize:(CGSize)newSize
{
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        return nil;
    }
    CGFloat yOffset = -( newSize.height - image.size.height ) / 2.0 ;
    CGFloat xOffset =  -( newSize.width - image.size.width ) / 2.0;
    return [self image:image withPadding:UIEdgeInsetsMake(yOffset, xOffset, yOffset, xOffset)];
}

+(UIImage *)image:(UIImage *)image withPadding:(UIEdgeInsets)edgeInsets
{
    CGSize fullSize = POEdgeInsetsInsetSize(image.size, edgeInsets);
    CGRect newFrame = PORectFromSize(fullSize.width, fullSize.height);
    UIGraphicsBeginImageContextWithOptions(fullSize, NO, 2.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, newFrame);
    CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
    CGContextFillRect(ctx, newFrame);
    CGPoint center = CGPointMake(( fullSize.width - image.size.width ) / 2.0,( fullSize.height - image.size.height ) / 2.0);
    [image drawAtPoint:center];
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)imageWithRenderColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage *)imageWithSize:(CGSize)imageSize backgroundColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    [color setFill];
    CGContextFillRect(context, rect);
    [self drawAtPoint:CGPointMake(imageSize.width / 2.0 - self.size.width / 2.0, imageSize.height / 2.0 - self.size.height / 2.0)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
