//
//  DYJXIdentitySwitchingModel.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingModel.h"

@implementation DYJXIdentitySwitchingModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"AdminUserIds" : [NSString class],
             @"MemberIds" : [NSString class],
             @"AllMemberIds" : [NSString class],
             @"Children" : [DYJXIdentitySwitchingModel class],
             };
}
@end

@implementation DYJXIdentitySwitchingEnterpriseInfoModel

@end

@implementation DYJXIdentitySwitchingCreatorModel

@end

@implementation DYJXIdentitySwitchingCreatorBusinessModel

@end

@implementation DYJXIdentitySwitchingCreatorBusinessIMInfoModel
//+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
//    return @{
//             @"Images":[PersonZhiZhaoModel class],
//             };
//}
@end

@implementation PersonZhiZhaoModel

@end
//@implementation DYJXIdentitySwitchingChildrenModel
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"AdminUserIds" : [NSString class],
//             @"MemberIds" : [NSString class],
//             @"AllMemberIds" : [NSString class],
//             @"Children" : [DYJXIdentitySwitchingChildrenModel class]
//             };
//}
//@end

