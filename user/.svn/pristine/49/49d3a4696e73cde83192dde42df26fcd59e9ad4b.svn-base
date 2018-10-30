//
//  XYNoticePush.h
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYNoticePushModel;

@interface XYNoticePush : NSObject


/** 
 * 网页    data 返回 url
 */
extern NSString * const NOTICE_TYPE_H5;
/** 
 * 订单发货,订单退款通知，跳转订单详情  data 返回 orderId
 */
extern NSString * const NOTICE_TYPE_ORDERD_ETAILS;
/** 
 *  订单评价通知，跳转未评论列表  data 返回 “”
 */
extern NSString * const NOTICE_TYPE_ORDERD_COMMENT;
/**
 *  评论审核未通过，跳转已评论列表  data 返回 “”
 */
extern NSString * const NOTICE_TYPE_COMMENT_AUDIT_FAILED;
/**
 *  商品到货通知，跳转商品详情页面  data 返回 productId
 */
extern NSString * const NOTICE_TYPE_PRODUCT_ARRIVAL;
/**
 *  购物车降价通知，跳转购物车页面  data 返回 mobile   vcode
 */
extern NSString * const NOTICE_TYPE_PRODUCT_PRICE_REDUCTION;
/**
 *  秒杀到点提醒通知，跳转我的提醒页面
 */
extern NSString * const NOTICE_TYPE_SPIKE_POINT_REMIND;
/**
 *  优惠券到期提醒通知，跳转优惠券列表
 */
extern NSString * const NOTICE_TYPE_COUPON_EXPIRES;


//H5：{“url":"httpS://ww.baidu.com"}
//    ORDERD_ETAILS：{"orderId":"2017090912175363004"}
//    ORDERD_COMMENT{不用传}
//    COMMENT_AUDIT_FAILED{不用传}
//    PRODUCT_ARRIVAL{"productId":"p_60001"}
//    PRODUCT_PRICE_REDUCTION{"mobile":"p_60001","vcode":"p_60001"}
//    SPIKE_POINT_REMIND{功能未做待定}
//    COUPON_EXPIRES{功能未做待定}



/** 判断推送消息 */
+ (void)noticePushWithNoticeModel:(XYNoticePushModel*)model PushNavi:(UIViewController *)pushNaviContorller;





@end
