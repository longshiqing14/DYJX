//
//  UIImage+fixOrientation.h
//  user
//
//  Created by longshiqing on 2018/12/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (fixOrientation)

 - (UIImage *)fixOrientation;

+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
