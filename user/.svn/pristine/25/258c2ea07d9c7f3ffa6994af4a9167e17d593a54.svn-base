//
//  XYNoticePush.m
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYNoticePush.h"

#import "XYNoticePushModel.h"
#import "JXMyCouponsViewController.h"


#import "XYBestWebVC.h" // 网页

#import "XYLoginVC.h" //登录界面
//#import "XYOrderDetailSubClassOrderDetailVC.h" //  订单详情
#import "JXMyOrderDetailsViewController.h"
#import "XYMineOrderListVCViewController.h"  //评论
#import "XYGoodsDetailVC.h"     //商品详情

@implementation XYNoticePush

/**
 * 活动通知，跳转H5页面    data 返回 url
 */
NSString * const NOTICE_TYPE_H5 = @"H5";
/**
 * 订单发货,订单退款通知，跳转订单详情 data 返回 orderId
 */
NSString * const NOTICE_TYPE_ORDERD_ETAILS = @"ORDERD_ETAILS";
/**
 *  订单评价通知，跳转未评论列表  data 返回 “”
 */
NSString * const NOTICE_TYPE_ORDERD_COMMENT = @"ORDERD_COMMENT";
/**
 *  评论审核未通过，跳转已评论列表  data 返回 “”
 */
NSString * const NOTICE_TYPE_COMMENT_AUDIT_FAILED = @"COMMENT_AUDIT_FAILED";
/**
 *  商品到货通知，跳转商品详情页面   data 返回 productId
 */
NSString * const NOTICE_TYPE_PRODUCT_ARRIVAL = @"PRODUCT_ARRIVAL";
/**
 *  购物车降价通知，跳转购物车页面  data 返回 mobile   vcode
 */
NSString * const NOTICE_TYPE_PRODUCT_PRICE_REDUCTION = @"PRODUCT_PRICE_REDUCTION";
/**
 *  秒杀到点提醒通知，跳转我的提醒页面
 */
NSString * const NOTICE_TYPE_SPIKE_POINT_REMIND = @"SPIKE_POINT_REMIND";
/**
 *  优惠券到期提醒通知，跳转优惠券列表
 */
NSString * const NOTICE_TYPE_COUPON_EXPIRES = @"COUPON_EXPIRES";



+ (void)noticePushWithNoticeModel:(XYNoticePushModel*)model PushNavi:(UIViewController *)pushNaviContorller
{
    if (model == nil) {
        return;
    }
    if (model.msgType == nil) {
        return;
    }
    
    if ([model.msgType isEqualToString:NOTICE_TYPE_H5]) {
        NSDictionary * dict = [XYCommon dataFromJsonString:model.data];
        if (dict[@"url"] == nil) {
            return;
        }
        XYBestWebVC * webVC = [[XYBestWebVC alloc]init];
        webVC.webURLstr = dict[@"url"];
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:webVC animated:YES];
            });
        }
        
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_ORDERD_ETAILS]){
        NSDictionary * dict = [XYCommon dataFromJsonString:model.data];
        if (dict[@"orderId"] == nil) {
            return;
        }
        NSString * orderid ;
        if ([dict[@"orderId"] isKindOfClass:[NSString class]]) {
            orderid = dict[@"orderId"];
        }else if ([dict[@"orderId"] isKindOfClass:[NSNumber class]]){
            orderid = [NSString stringWithFormat:@"%d",[dict[@"orderId"] intValue]];
        }
//        XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//        orderDetailVC.order_ID = orderid;
        JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
        myOrderDetailsViewController.orderID = orderid;
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:myOrderDetailsViewController animated:YES];
            });
        }
        
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_ORDERD_COMMENT]){

        XYMineOrderListVCViewController * orderListVC = [[XYMineOrderListVCViewController alloc]init];
        orderListVC.selectIndex = 4;
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:orderListVC animated:YES];
            });
        }
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_COMMENT_AUDIT_FAILED]){
        
        XYMineOrderListVCViewController * orderListVC = [[XYMineOrderListVCViewController alloc]init];
        orderListVC.selectIndex = 4;
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:orderListVC animated:YES];
            });
        }
        
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_PRODUCT_ARRIVAL]){

        NSDictionary * dict = [XYCommon dataFromJsonString:model.data];
        if (dict[@"productId"] == nil) {
            return;
        }
        NSString * productId ;
        if ([dict[@"productId"] isKindOfClass:[NSString class]]) {
            productId = dict[@"productId"];
        }else if ([dict[@"productId"] isKindOfClass:[NSNumber class]]){
            productId = [NSString stringWithFormat:@"%d",[dict[@"productId"] intValue]];
        }
        
        XYGoodsDetailVC * goodsDetailVC = [[XYGoodsDetailVC alloc]init];
        goodsDetailVC.productId = productId;
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:goodsDetailVC animated:YES];
            });
        }
        
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_PRODUCT_PRICE_REDUCTION]){

        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            nowVC.tabBarController.selectedIndex = 0;
        }
        
    }else if ([model.msgType isEqualToString:NOTICE_TYPE_SPIKE_POINT_REMIND]){

    }else if ([model.msgType isEqualToString:NOTICE_TYPE_COUPON_EXPIRES]){
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //这个字符串是你要跳转面板的名字
        JXMyCouponsViewController *myCouponsViewController =[board instantiateViewControllerWithIdentifier:@"JXMyCouponsID"];
        UIViewController * nowVC = [XYCommon getCurrentVC];
        if (![nowVC isKindOfClass:[XYLoginVC class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [nowVC.navigationController pushViewController:myCouponsViewController animated:YES];
            });
        }
        
    }
    
    
    
}
























@end
