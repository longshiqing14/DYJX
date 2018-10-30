//
//  XYEWalletAllNet.h
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYBestAllNet.h"

@interface XYEWalletAllNet : XYBestAllNet


/**
 *  余额 列表
 *  limit  每个分页条数   默认 10
 *  start  页码         默认 1
 */
+ (void)netPredepositListLimit:(NSString*)limit
                       logType:(NSString *)type
                     startTime:(NSString *)startTime
                       endTime:(NSString *)endTime
                         start:(NSString*)start AfterAmount:(NSString *)afterAmount
                         block:(infoBlockNet)block;

/**
 *  余额详情
 *  balance_id  详情 id
 */
+ (void)netdepositDetailWithid:(NSString*)balance_id
                         block:(infoBlockNet)block;


/**
 *  预存款分期返现 列表
 */
+ (void)netPredepositbackListWithBlock:(infoBlockNet)block;

/**
 *  预存款分期返现 - 单次详情
 *  cashbackId     id
 */
+ (void)netdepositDetailWithCashbackId:(NSString*)cashbackId
                                 block:(infoBlockNet)block;


@end
