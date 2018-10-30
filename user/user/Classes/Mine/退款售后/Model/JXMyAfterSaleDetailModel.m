//
//  JXMyAfterSaleDetailModel.m
//  user
//
//  Created by liu_yakai on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailModel.h"

@implementation JXMyAfterSaleDetailModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"processFlow" : [JXMyAfterSaleDetailProcessFlowModel class],@"payRecsList":[JXMyAfterSaleDetailPayRecsListModel   class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             
             };
}
@end

@implementation JXMyAfterSaleDetailPayRecsListModel

@end


@implementation JXMyAfterSaleDetailProcessFlowModel

@end


@implementation JXMyAfterSaleDetailDutyModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID":@"id",
             
             };
}
@end


