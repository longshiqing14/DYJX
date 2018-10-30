//
//  XYPersonInfoNet.h
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYBestAllNet.h"
@interface XYPersonInfoNet :XYBestAllNet

/** 
 * 修改个人信息
 */
+(void)netUpdatePersonInfoWithDic:(NSMutableDictionary *)dic resultBlock:(infoBlockNet)block;

/**
 * 调用修改支付密码时  获取的验证码
 */
+(void)netGetVeriCodeWithDic:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

/**
 * 修改支付密码
 */
+(void)netChangePayWithDic:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;


/**
 * 退出登录
 */
+(void)netSignOutResultBlock:(infoBlockNet)block;
@end
