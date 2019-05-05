//
//  DYJXGroupViewModel.h
//  user
//
//  Created by 岩  熊 on 2019/5/5.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYJXGroupViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;

- (NSInteger)numberOfCell;
- (NSString *)GroupName:(NSIndexPath *)indexPath;
- (NSString *)GroupNumberString:(NSIndexPath *)indexPath;
- (NSString *)iconImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (NSString *)sectionHeaderGroupNumber:(NSIndexPath *)indexPath;

- (NSString *)sectionHeaderGroupName:(NSInteger )section;
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section;
- (NSString *)sectionHeadericonImageUrl:(NSInteger )section;
//- (NSString *)sectionHeaderGroupNumber:(NSInteger )section;
//获取我创建或参与公司

- (void)getMyWildGroupsDataWithPageNumer:(NSInteger)pageNumber Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
- (void)loadMoreDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))failed;
- (void)refreshDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))failed ;
@end

NS_ASSUME_NONNULL_END
