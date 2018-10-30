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
             @"AllMemberIds" : [NSString class]
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

@end

@implementation DYJXIdentitySwitchingChildrenModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"AdminUserIds" : [NSString class],
             @"MemberIds" : [NSString class],
             @"AllMemberIds" : [NSString class]
             };
}
@end

