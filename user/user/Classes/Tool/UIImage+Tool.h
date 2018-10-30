//
//  UIImage+Tool.h
//  JLYP
//
//  Created by liu_yakai on 17/6/28.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)
/**
 *  图片裁剪
 *
 *  @param rect  裁剪的大小是根据像素来的
 *
 *  @return 返回裁剪后的图片
 */
- (UIImage *)cutImageWithRect:(CGRect )rect;
/**
 *  压缩图片
 *
 *  @param size 压缩的大小
 *
 *  @return 返回压缩后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

+ (UIImage *)imageWithGIFNamed:(NSString *)name;
@end
