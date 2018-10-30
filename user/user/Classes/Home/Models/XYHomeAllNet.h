//
//  XYHomeAllNet.h
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYBestAllNet.h"

@interface XYHomeAllNet : XYBestAllNet

/**
 *  获取小区列表
 *  lat 纬度   目前未使用
 *  lng  经度  目前未使用
 */
+ (void)netCommuityListWithLat:(NSString*)lat
                           lng:(NSString*)lng
                         block:(infoBlockNet)block;


/**
 *  获取选择 城市
 *  cityId  城市 id
 */
+ (void)netSelectCommuityWithCityId:(NSString*)cityId
                      theMerchantId:(NSString*)theMerchantId
                              block:(infoBlockNet)block;


/**
 *  获取热销商品列表
 */
+ (void)netHotGoodsListblock:(infoBlockNet)block;

/**
 * 获取未读信息数量
 */
+(void)netMessageUnreadBlock:(infoBlockNet)block;

@end
