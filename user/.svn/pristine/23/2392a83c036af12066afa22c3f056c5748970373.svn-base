//
//  JXFullReduceGoodsViewmodel.h
//  user
//
//  Created by 岩  熊 on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYBestAllNet.h"

@interface JXFullReduceGoodsViewmodel : XYBestAllNet

@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (NSInteger)numberOfCell;
- (NSString *)listShowTile;
- (NSString *)goodsName:(NSIndexPath *)indexPath;
- (NSString *)goodsPrice:(NSIndexPath *)indexPath;
- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed;
- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed ;
@end


