//
//  XYEWalletCommon.h
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYEWalletCommon : NSObject

///** cell 状态 */
//typedef NS_ENUM(NSInteger, XYEWalletDetailType) {
//    
//    //ewallet_list_chong
//    //ewallet_list_mai
//    //ewallet_list_tui
//    
//    XYEWalletDetailType_recharge = 1,           //余额充值
//    XYEWalletDetailType_shopping = 2,           //购物消费
//    XYEWalletDetailType_refund = 3,             //订单退款
//};

extern NSString * const transationType_cashback; //预存款到账
extern NSString * const transationType_order; //购物消费
extern NSString * const transationType_recharge; //余额充值
extern NSString * const transationType_order_rollpay; //订单退款



@end
