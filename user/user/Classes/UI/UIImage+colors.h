//
//  UIImage+colors.h
//  HouseRent
//
//  Created by liruiqin on 14-4-1.
//  Copyright (c) 2014年 ganji.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (colors)

+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color imageSize:(CGSize)imageSize;

+(UIImage *)imageNamed:(NSString *)name withPadding:(UIEdgeInsets)edgeInsets;
+(UIImage *)imageNamed:(NSString *)name withSize:(CGSize)newSize;

+(UIImage *)imageNamedAdaptationHD:(NSString *)name;

/**
 *  有时候需要一些简单的带有border的图片，可以用这个方法，更灵活，而且不需要ui的切图，减少包的体积，效率上也不错
 *
 *  @param color       主要填充色
 *  @param imageSize   图片的尺寸，需要大于4*4
 *  @param borderColor border的颜色
 *  @param borderWidth border的宽度，小于imageSize宽高的一半
 *
 *  @return 有直角border效果的image
 */
+(UIImage *)imageWithColor:(UIColor *)color
                 imageSize:(CGSize)imageSize
               borderColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth;

-(UIImage *)imageWithRenderColor:(UIColor *)color;
-(UIImage *)imageWithSize:(CGSize)imageSize backgroundColor:(UIColor *)color; //重绘一张图，把图片放在中间，填充背景色

@end
