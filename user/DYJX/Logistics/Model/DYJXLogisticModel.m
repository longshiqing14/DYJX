//
//  DYJXLogisticModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLogisticModel.h"

@implementation DYJXLogisticModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"resultArray" : [DYJXLogisticDetailModel class],
            
             };
}
@end

@implementation DYJXLogisticDetailModel

@end

