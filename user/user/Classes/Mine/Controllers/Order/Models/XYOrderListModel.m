//
//  XYOrderListModel.m
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderListModel.h"


@implementation XYOrderModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"orderList":@"XYOrderListModel",
             };
}

@end

@implementation XYOrderListModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"items":@"XYOrderListGoodsListModel",
             };
}

@end

@implementation XYOrderListBuyerInfoModel


@end

@implementation XYOrderListGoodsListModel

@end


@implementation XYOrderListProcessStateInfoModel

@end







