//
//  XYLocalCheck.h
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLocalCheck : NSObject

/** 电话 号码验证 */
+ (BOOL)ismobile:(NSString*)mobile;

/**
 * 非零的正整数 验证
 */
+ (BOOL)isNonzeroPositiveInteger:(NSString*)str;

/**
 * 正整数
 */
+ (BOOL)isPositiveInteger:(NSString*)str;

@end
