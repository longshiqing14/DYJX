//
//  XYAddressNet.h
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestAllNet.h"

@interface XYAddressNet : XYBestAllNet
/**
 *  地址列表
 */

+(void)netGetAddressListResultBlock:(infoBlockNet)block;


/** 
 * 删除地址
 */
+(void)netDeleteAddressParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;


/**
 * 设为默认
 */

+(void)netSetDefaultAddress:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

/**
 * 添加或者修改地址
 */
+(void)netAddAddress:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;
/**
 * 获取市区
 */
+(void)netGetCityZone:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

/**
 * 设为收货地址
 */
+(void)netSetDeliveryAddressWithParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

@end
