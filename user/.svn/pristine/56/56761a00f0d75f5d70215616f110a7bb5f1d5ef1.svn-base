//
//  UIImage+YDBExtend.m
//  YWD_baseFramework
//
//  Created by liruiqin on 15/8/26.
//  Copyright (c) 2015年 liruiqin. All rights reserved.
//

#import "UIImage+YDBExtend.h"
#import "UIViewAdditions.h"

@implementation UIImage (YDBExtend)

-(UIImage *)scaleWithFactor:(CGFloat)factor
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.size = CGSizeMake(imageView.frame.size.width * factor, imageView.size.height * factor);
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, imageView.opaque, 0.0);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+(UIImage *)imageWithSmallPlaceholder
{
    return [UIImage imageNamed:@"common_default_icon_70"];
}

@end
