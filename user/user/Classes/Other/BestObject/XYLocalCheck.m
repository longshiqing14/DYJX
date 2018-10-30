//
//  XYLocalCheck.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYLocalCheck.h"

@implementation XYLocalCheck

#pragma mark - 电话号码验证

/** 电话 号码验证 */
+ (BOOL)ismobile:(NSString*)mobile
{
    if (mobile.length == 11) {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        } else {
            return NO;
        }
    }else{
        return NO;
    }
}


/**
 * 非零的正整数
 */
+ (BOOL)isNonzeroPositiveInteger:(NSString*)str
{
    
    if (str.length != 0) {
        /**
         * 非零的正整数
         */
        NSString * NUM = @"^[1-9]\\d*$";
        
        NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUM];
        BOOL isMatch = [pred evaluateWithObject:str];
        if (isMatch) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }

}

/**
 * 正整数
 */
+ (BOOL)isPositiveInteger:(NSString*)str
{
    
    if (str.length != 0) {
        /**
         * 正整数
         */
        NSString * NUM = @"^[0-9]\\d*$";
        
        NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUM];
        BOOL isMatch = [pred evaluateWithObject:str];
        if (isMatch) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
    
}


@end
