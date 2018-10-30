//
//  YWDListItem.h
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/16.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWDListItem<EntityType : id> : NSObject

@property(nonatomic,copy) NSString *text;
@property(nonatomic,readonly) NSInteger uuid;
@property(nonatomic,copy) NSString *commonId;
@property(nonatomic,strong) EntityType entity;
@property(nonatomic,weak) YWDListItem<EntityType> *superItem;
@property(nonatomic,weak) YWDListItem<EntityType> *selectedItem;
@property(nonatomic,copy) NSArray<YWDListItem *> *subItems;
@property(nonatomic) BOOL selected;

+(YWDListItem *)itemWithText:(NSString *)text commonId:(NSString *)cId entity:(EntityType)entity;
+(NSArray<EntityType> *)itemsFromConverter:(void(^)(NSUInteger index,YWDListItem *item))itemConverter forCount:(NSUInteger)count;

@end
