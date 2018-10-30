//
//  JXCityListModel.m
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCityListModel.h"


@implementation JXCityListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"communityList" : [JXValueModel class],@"alphaList":[NSString class]};
}

@end



@implementation JXValueModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"value" : [JXCommunityListModel class]};
}
@end
@implementation JXCommunityListModel

@end
