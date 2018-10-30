//
//  JXSearchReusltListModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXBaseGoodsModel.h"
@class JXActiveCardModel;
@class JXActiveShowModel;
@interface JXSearchReusltListModel : JXBaseGoodsModel
@property (nonatomic, assign) NSInteger  total;
@property (nonatomic, strong) NSArray <JXBaseGoodsModel*> *products;
@property (nonatomic, strong) NSArray <JXActiveCardModel*> *activeCard;
@property (nonatomic, strong) NSArray <JXActiveShowModel*> *activeShow;
@end

@interface JXActiveCardModel : NSObject
@property (nonatomic, copy) NSString  *amount;
@property (nonatomic, copy) NSString  *range;
@property (nonatomic, copy) NSString  *threshold;
@property (nonatomic, copy) NSString  *activeId;
@property (nonatomic, copy) NSString  *statu;
@property (nonatomic, copy) NSString  *listShowTile;
@end

@interface JXActiveShowModel : NSObject
@property (nonatomic, copy) NSString  *activeImg;
@property (nonatomic, copy) NSString  *activeDateStart;
@property (nonatomic, copy) NSString  *name;
@property (nonatomic, copy) NSString  *activeDateEnd;
@end

