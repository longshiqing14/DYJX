//
//  JXClassificationViewModel.h
//  user
//
//  Created by 岩  熊 on 2017/12/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JXClassificationSecondTitleListModel;

@interface JXClassificationViewModel : NSObject

@property (nonatomic,strong) NSMutableDictionary *requestDic;

- (NSInteger)numberSectionOfTableCell;
- (NSInteger)numberRowsOfTableSection:(NSInteger)section;
- (NSString *)titleName:(NSInteger )section;
- (NSString *)ChildrentitleName:(NSIndexPath *)indexPath;

- (NSArray<JXClassificationSecondTitleListModel*> *)JXClassificationTitleList;
- (NSInteger)numberOfCell;
- (NSString *)listShowTile;
- (NSString *)goodsName:(NSIndexPath *)indexPath;
- (NSString *)goodsPrice:(NSIndexPath *)indexPath;
- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (void)getClassificationTitleListDataFromSeviceSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed;
- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed ;
@end
