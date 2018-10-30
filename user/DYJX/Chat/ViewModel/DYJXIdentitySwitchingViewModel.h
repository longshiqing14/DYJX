//
//  DYJXIdentitySwitchingViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXIdentitySwitchingViewModel : NSObject

@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (NSInteger)numberOfCell;
- (NSString *)listShowTile;
- (NSString *)goodsName:(NSIndexPath *)indexPath;
- (NSString *)goodsPrice:(NSIndexPath *)indexPath;
- (NSString *)sellingPointText:(NSIndexPath *)indexPath;
- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed;
- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed ;
@end
