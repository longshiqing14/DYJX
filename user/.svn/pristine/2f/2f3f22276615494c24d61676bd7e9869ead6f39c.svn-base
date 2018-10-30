//
//  JXSelectDeliverToShopViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JXAdressModel;
@interface JXSelectDeliverToShopViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (NSInteger)numberOfCell;
- (NSString *)listShowTile;
- (NSString *)goodsName:(NSIndexPath *)indexPath;
- (NSString *)goodsPrice:(NSIndexPath *)indexPath;
- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))fail;
- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))failed;
- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))failed ;
@end
