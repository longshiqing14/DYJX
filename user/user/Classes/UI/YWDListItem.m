//
//  YWDListItem.m
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/16.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDListItem.h"

@implementation YWDListItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _uuid = arc4random();
    }
    return self;
}

+(YWDListItem *)itemWithText:(NSString *)text commonId:(NSString *)cId entity:(id)entity
{
    YWDListItem *item = [[YWDListItem alloc] init];
    item.text = text;
    item.commonId = cId;
    item.entity = entity;
    return item;
}

+(NSArray *)itemsFromConverter:(void(^)(NSUInteger index,YWDListItem *item))itemConverter forCount:(NSUInteger)count;
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:count];
    for (int idx = 0; idx < count; idx++) {
        YWDListItem *item = [[YWDListItem alloc] init];
        if (itemConverter) {
            itemConverter(idx,item);
        }
        [items addObject:item];
    }
    return items;
}

@end
