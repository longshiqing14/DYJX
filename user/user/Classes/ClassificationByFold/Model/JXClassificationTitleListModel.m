//
//  JXClassificationTitleListModel.m
//  user
//
//  Created by 岩  熊 on 2017/12/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXClassificationTitleListModel.h"

@implementation JXClassificationTitleListModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"RETURN_DATA":[JXClassificationSecondTitleListModel class],
             };
}
@end

@implementation JXClassificationSecondTitleListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             
             };
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"children":[JXClassificationSecondTitleItemModel class],
             };
}
@end

@implementation JXClassificationSecondTitleItemModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             };
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"children":[JXClassificationSecondTitleItemModel class],
             };
}
@end
