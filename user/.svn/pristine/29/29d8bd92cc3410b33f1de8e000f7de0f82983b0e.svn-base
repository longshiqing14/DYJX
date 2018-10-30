//
//  XYOrderFromDetailModel.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderFromDetailModel.h"

@implementation XYOrderFromDetailModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"ocs" : @"XYOrderFromDetailocsModel",
             };
}

@end


/** 发票 信息 */
@implementation XYOrderFromDetailInvoiceInfoModel

+ (NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"invoice_id":@"id",
             };
}

@end


/** ocs */
@implementation JXIntegralTitleModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"desc" : [NSString class]};
}

@end


/** ocs */
@implementation JXIntegralModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"integralDesc" : @"JXIntegralTitleModel"};
}

@end


/** ocs */
@implementation XYOrderFromDetailocsModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"availableDeliveryRuleResults" : @"XYOrderFromDetailAvailableDeliveryRuleResultsModel",
             @"buyItems" : @"XYOrderDetailGoodsListModel",
             @"paymentList" : @"XYOrderFromDetailPaymentListModel",
             };
}


@end




@implementation XYOrderFromDetailAvailableDeliveryRuleResultsModel

+ (NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"deliveryRule_id":@"id"
             };
}

@end


@implementation XYOrderFromDetailPaymentListModel

+ (NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"pay_id":@"id",
             };
}

@end

@implementation XYOrderFromDetailDeliveryPointInfoModel


+ (NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"delivery_id":@"id",
             };
}


@end


