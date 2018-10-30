//
//  JXAlreadyUsedViewModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kStartPageIndex 1
#define kRequestPageNumber @"pageNum"
#import "JXCouponBaseModel.h"
#import "JXCouponDetailModel.h"

@interface JXAlreadyUsedViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (NSInteger)numberOfCell;
- (NSMutableArray<JXCouponDetailModel*>*)getJXCouponDataLiat;
- (NSString *)productName:(NSIndexPath *)indexPath;
- (NSString *)productPrice:(NSIndexPath *)indexPath;
- (NSString *)productImageUrl:(NSIndexPath *)indexPath;
- (NSString *)productStatus:(NSIndexPath *)indexPath;
- (NSString *)productTime:(NSIndexPath *)indexPath;
- (NSString *)productOrderNum:(NSIndexPath *)indexPath;
- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL isHaveData))success failed:(void(^)(NSString *errorMsg))failed;
- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL isHaveData))success failed:(void(^)(NSString *errorMsg))failed;
@end
