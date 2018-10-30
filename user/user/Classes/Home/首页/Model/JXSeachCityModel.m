//
//  JXSeachCityModel.m
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSeachCityModel.h"

@implementation JXSeachCityModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"communityList" : [JXListModel class]};
}
@end
@implementation JXListModel

@end
