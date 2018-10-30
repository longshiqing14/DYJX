//
//  XYOrderAllNet.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYBestAllNet.h"

@interface XYOrderAllNet : XYBestAllNet

+ (void)netActivityCartBuyNowWithProductId:(NSString*)productId PartnerId:(NSString *)partnerId
                                     Block:(infoBlockNet)block;

/**
 *  预提交订单的信息
 */
+ (void)netOrderFormBlock:(NSString *)integralShow netBlock:(infoBlockNet)block;

/**
 *  确认收货
 *  orderId  订单 id
 */
+ (void)ConfirmationReceiptOder:(NSString*)orderId
                      Block:(infoBlockNet)block;

/**
 *  提交订单 支付
 *  depositPay  支付金额
 *  depositPayPwd 支付密码
 *  memo   备注
 */
+ (void)netOrderSubmitPay:(NSString*)depositPay IphoneNumber:(NSString *)iphoneNumber
                       depositPayPwd:(NSString*)depositPayPwd
                                memo:(NSString*)memo
                               Block:(infoBlockNet)block;

+ (void)netOrderSubmitWithDepositPay:(NSString*)depositPay
                       depositPayPwd:(NSString*)depositPayPwd
                                memo:(NSString*)memo
                               Block:(infoBlockNet)block;

/**
 *  立即购买
 *  productId  立即 购买商品 id
 */
+ (void)netCartBuyNowWithProductId:(NSString*)productId
                             Block:(infoBlockNet)block;

/**
 *  订单  列表  数量
 */
+ (void)netOrderCountWithBlock:(infoBlockNet)block;


/**
 *  检查用户是否有设置支付密码
 */
+ (void)netOrderUserPaywdCheckBlock:(infoBlockNet)block;


/**
 *  订单  列表
 *  processState  订单类型
 */
+ (void)netOrderListWithProcessState:(NSDictionary *)processState
                               block:(infoBlockNet)block;


/**
 *  订单 详情
 *  orderId  订单 id
 */
+ (void)netOrderDetailWithOrderid:(NSString*)orderId
                            Block:(infoBlockNet)block;

/**
 *  订单 详情 状态
 *  orderId  订单 id
 */
+ (void)netOrderTrackWithOrderid:(NSString*)orderId
                           Block:(infoBlockNet)block;

/**
 *  订单  取消订单
 *  orderId  订单 id
 */
+ (void)netOrderCancelWithOrderid:(NSString*)orderId
                            Block:(infoBlockNet)block;

/************* 套餐订单 *************/


/**
 *  订单 套餐 列表
 *  isProductList  Y:套餐商品列表,N:预存款充值列表
 */
+ (void)netOrderPromotionsWithIsProductList:(NSString*)isProductList
                                      Block:(infoBlockNet)block;

/**
 *  套餐订单 创建
 *  amount 数量
 *  payId 支付方式id
 *  productId 商品id
 *  skuId  。。。。
 */
+ (void)netOrderDirectWithAmount:(NSString*)amount
                           payId:(NSString*)payId
                       productId:(NSString*)productId
                           skuId:(NSString*)skuId
                           Block:(infoBlockNet)block;

/**
 *  套餐订单 支付  pay 测试用
 *  orderId 数量
 *  payId 支付方式id
 */
+ (void)netOrderXPPAYWithOrderId:(NSString*)orderId
                            payId:(NSString*)payId
                            Block:(infoBlockNet)block;

@end
