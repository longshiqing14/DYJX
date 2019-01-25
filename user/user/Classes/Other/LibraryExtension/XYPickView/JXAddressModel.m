//
//  JXAddressModel.m
//  user
//
//  Created by 岩  熊 on 2018/1/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXAddressModel.h"

@implementation JXAddressModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"list":[JXAddressDetailModel class],
             };
}
@end

@implementation JXAddressDetailModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             
             };
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"children":[JXAddressDetailModel class],
             };
}
@end

