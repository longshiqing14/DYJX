//
//  XYOrderDetailModel.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailModel.h"

@implementation XYOrderDetailAndPaymentModel
+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"paymentArr":@"NSString",
         
             };
}
@end

@implementation XYOrderDetailModel


+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"items":@"XYOrderDetailItemListModel",
             @"payRecs":@"XYOrderDetailPayRecsModel",
             };
}

+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"descriptionCount":@"description",
             };
}

@end


@implementation XYOrderDetailBuyerInfoModel

@end


@implementation XYOrderDetailInvoiceInfoModel

@end


@implementation XYOrderDetailItemListModel
+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"commodityId":@"id",
             };
}
@end

@implementation XYOrderDetailPayRecsModel

+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"payRecs_id":@"id",
             };
}

@end


@implementation XYOrderDetailDeliveryPointInfoModel

@end


@implementation XYOrderDetailSellerInfoModel

@end

@implementation XYOrderDetailProcessStateInfoModel

@end




