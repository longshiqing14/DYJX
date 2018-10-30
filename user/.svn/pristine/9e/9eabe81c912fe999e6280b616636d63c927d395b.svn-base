//
//  JXMyRefundAfterSaleModel.m
//  user
//
//  Created by liu_yakai on 2018/4/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyRefundAfterSaleModel.h"

@implementation JXMyRefundAfterSaleModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"orderRefundList" : [JXMyRefundAfterSaleOrderRefundListModel class]};
}

@end

@implementation JXMyRefundAfterSaleOrderRefundListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : [NSString class],@"pics":[NSString class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             
             };
}
@end

@implementation JXMyRefundAfterSaleReasonModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             
             };
}

@end
