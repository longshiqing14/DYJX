//
//  UIImage+Tool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/28.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UIImage+Tool.h"


@implementation UIImage (Tool)
/**
 *  图片裁剪
 *
 *  @param rect  裁剪的大小是根据像素来的
 *
 *  @return 返回裁剪后的图片
 */
- (UIImage *)cutImageWithRect:(CGRect )rect
{
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage * img = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return img;
}

//-(UIImage *)cutmage{
//    //    CGSize size = img.size;
//    ////    CGSize viewsize = {300 ,300};
//    //    CGSize viewsize = CGSizeMake(kScreenWidth, kScreenHeight);
//    //    CGFloat scalex = viewsize.width / size.width;
//    //    CGFloat scaley = viewsize.height / size.height;
//    //    CGFloat scale = MAX(scalex, scaley);
//    //
//    //    UIGraphicsBeginImageContext(viewsize);
//    //
//    //    CGFloat width = size.width * scale;
//    //    CGFloat height = size.height * scale;
//    //
//    //    float dwidth = ((viewsize.width - width)/2.0f);
//    //    float dheight = ((viewsize.height - height)/2.0f);
//    //
//    //    CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
//    //    [img drawInRect:rect];
//    //
//    //    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    //    UIGraphicsEndImageContext();
//}


//
/**
 *  压缩图片
 *
 *  @param size 压缩的大小
 *
 *  @return 返回压缩后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size{
    
    // 设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)GIFName:(NSString *)name scale:(NSUInteger)scale
{
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%zdx", name, scale] ofType:@"gif"];
    
    if (!imagePath) {
        
        (scale + 1 > 3) ? (scale -= 1) : (scale += 1);
        imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%zdx", name, scale] ofType:@"gif"];
    }
    
    if (imagePath) {
        
        // 传入图片名(不包含@Nx)
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
        return [UIImage imageWithGIFData:imageData];
        
    } else {
        
        imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        if (imagePath) {
            
            // 传入的图片名已包含@Nx or 传入图片只有一张 不分@Nx
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            return [UIImage imageWithGIFData:imageData];
        } else {
            
            // 不是一张GIF图片(后缀不是gif)
            return [UIImage imageNamed:name];
        }
    }
}

+ (UIImage *)imageWithGIFNamed:(NSString *)name
{
    NSUInteger scale = (NSUInteger)[UIScreen mainScreen].scale;
    return [self GIFName:name scale:scale];
}



+ (UIImage *)imageWithGIFData:(NSData *)data
{
    if (!data) return nil;
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    size_t count = CGImageSourceGetCount(source);
    
    UIImage *animatedImage;
    
    if (count <= 1) {
        animatedImage = [[UIImage alloc] initWithData:data];
    } else {
        
        NSMutableArray *images = [NSMutableArray array];
        NSTimeInterval duration = 0.0f;
        
        for (size_t i = 0; i < count; i++) {
            
            // 拿出了Gif的每一帧图片
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            
            //Learning... 设置动画时长 算出每一帧显示的时长（帧时长）
            NSTimeInterval frameDuration = [UIImage sd_frameDurationAtIndex:i source:source];
            duration += frameDuration;
            
            // 将每帧图片添加到数组中
            [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            
            // 释放真图片对象
            CFRelease(image);
        }
        
        // 设置动画时长
        if (!duration) {
            duration = (1.0f / 10.0f) * count;
        }
        
        animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    }
    // 释放源Gif图片
    CFRelease(source);
    
    return animatedImage;
}



#pragma mark - <关于GIF图片帧时长(Learning...)>

+ (float)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
    
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp) {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (frameDuration < 0.011f) {
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}
@end
