//
//  DYJXAddressModel.m
//  user
//
//  Created by YP on 2019/4/29.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddressModel.h"

@implementation DYJXAddressModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Provinces" : [DYJXProvinceAddressModel class]
             };
}

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"Provinces":@[@"Provinces",@"Citys",@"Districts"]};
}

@end

@implementation DYJXProvinceAddressModel

@end

@implementation DYJXAreaAddressModel

@end

