//
//  JXNotUsedViewModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXCouponDetailModel.h"
@interface JXNotUsedViewModel : NSObject
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
- (void)exchangeCouponWithCode:(NSString*)code Success:(void(^)(BOOL isLastPage,NSString* desc))success failed:(void(^)(NSString *errorMsg))fail;
@end
