//
//  YQTotalData.h
//  51统计
//
//  Created by Device on 17/6/21.
//  Copyright © 2017年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQTotalData : NSObject
/**
 传入一个opt返回对应类型的数组（人数或金钱）
 */
+ (NSArray *)IncomingOptReturnsTheArray:(NSString *)str;
@end
