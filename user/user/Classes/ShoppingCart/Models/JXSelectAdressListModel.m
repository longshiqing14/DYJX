//
//  JXSelectAdressListModel.m
//  user
//
//  Created by 岩  熊 on 2018/3/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXSelectAdressListModel.h"

@implementation JXSelectAdressListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"totalRecords":@"totalRecords"
             
             };
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"warehouseList":[JXAdressModel class],
             };
}
@end

@implementation JXAdressModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}

@end
