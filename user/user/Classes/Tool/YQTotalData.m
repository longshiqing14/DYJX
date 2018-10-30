//
//  YQTotalData.m
//  51统计
//
//  Created by Device on 17/6/21.
//  Copyright © 2017年 YQ. All rights reserved.
//

#import "YQTotalData.h"

@implementation YQTotalData
+ (NSArray *)IncomingOptReturnsTheArray:(NSString *)str{
    NSDictionary *dic = @{@"04":@[@"激活数",@"04",@"activeNum"],
                          @"05":@[@"注册数",@"05",@"register"],
                          @"06":@[@"活跃数",@"06",@"activeUserNum"],
                          @"07":@[@"购彩人数",@"07",@"buyNum"],
                          @"17":@[@"新增购彩人数",@"17",@"newBuyNum"]
                          };
    NSDictionary *dic1 = @{@"08":@[@"冲值金额",@"08",@"recharge"],
                           @"09":@[@"活动彩金",@"09",@"hdHandsel"],
                           @"10":@[@"自购中奖金额",@"10",@"winMoney"],
                           @"11":@[@"合买中奖金额",@"11",@"winMoney1"],
                           @"12":@[@"自购金额",@"12",@"Money"],
                           @"13":@[@"合买金额",@"13",@"Money1"],
                           @"14":@[@"消费金额",@"14",@"consumptions"],
                           @"15":@[@"消费彩金",@"15",@"handsel"],
                           @"16":@[@"提现金额",@"16",@"distills"],
                           @"17,18":@[@"新增购彩金额",@"17,18",@"newBuyMoney"],
                           @"17,18,19":@[@"新增购彩apru",@"17,18,19",@"APRU1"]
                           };
    
    
    if ([str isEqualToString:@"04"] ||
        [str isEqualToString:@"05"] ||
        [str isEqualToString:@"06"] ||
        [str isEqualToString:@"07"] ||
        [str isEqualToString:@"17"] )
    {
        NSMutableDictionary *dicData = [[NSMutableDictionary alloc] initWithDictionary:dic];
        [dicData removeObjectForKey:str];
        
        NSMutableArray *arr = [NSMutableArray array];
        [dicData enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [arr addObject:obj];
        }];
        
        return arr;
    }else{
        NSMutableDictionary *dicData = [[NSMutableDictionary alloc] initWithDictionary:dic1];
        [dicData removeObjectForKey:str];
        
        NSMutableArray *arr = [NSMutableArray array];
        [dicData enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [arr addObject:obj];
        }];
        return arr;
    }
    
    
}


@end
