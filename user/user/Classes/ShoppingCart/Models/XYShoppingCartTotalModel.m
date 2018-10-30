//
//  XYShoppingCartTotalModel.m
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYShoppingCartTotalModel.h"

@implementation XYShoppingCartTotalModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"orderRuleTargets":@"XYShopTargetsModel",
             };
}

@end

@implementation XYShopTargetsModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"buyItems":@"XYShopingCartListModel",
             };
}


@end
