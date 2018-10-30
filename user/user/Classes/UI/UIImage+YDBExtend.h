//
//  UIImage+YDBExtend.h
//  YWD_baseFramework
//
//  Created by liruiqin on 15/8/26.
//  Copyright (c) 2015年 liruiqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YDBExtend)

-(UIImage *)scaleWithFactor:(CGFloat)factor; // 缩放, 0.5 == 一半 , 2 == 翻倍

+(UIImage *)imageWithSmallPlaceholder;

@end
