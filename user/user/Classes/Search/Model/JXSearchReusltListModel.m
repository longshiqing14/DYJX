//
//  JXSearchReusltListModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchReusltListModel.h"

@implementation JXSearchReusltListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"total":@"total"
            
             };
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"products":[JXBaseGoodsModel class],
             @"activeCard":[JXActiveCardModel class],
             @"activeShow":[JXActiveShowModel class]
             };
}

@end


@implementation JXActiveCardModel

@end

@implementation JXActiveShowModel

@end


