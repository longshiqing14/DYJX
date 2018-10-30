//
//  JXBaseGoodsModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXBaseGoodsModel.h"

@implementation JXBaseGoodsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"memberPrice":@"memberPrice",
             @"title":@"title",
             @"logo":@"logo",
             @"productID":@"id"
             };
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"lable":[NSString class],
             };
}

@end
