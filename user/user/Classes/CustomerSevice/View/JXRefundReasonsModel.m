//
//  JXRefundReasonsModel.m
//  user
//
//  Created by 岩  熊 on 2018/4/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundReasonsModel.h"

@implementation JXRefundReasonsModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"reasonList":[JXRefundReasonsDeatailModel class],
             };
}
@end

@implementation JXRefundReasonsDeatailModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}
@end

