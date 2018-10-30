//
//  JXHotSearchListModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHotSearchListModel.h"

@implementation JXHotSearchListModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"hotKeyword":[JXHotSearchModel class],
             };
}
@end
