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
- (NSInteger)numberOfSection;
//- (NSInteger)numberOfCell:(NSInteger )section;
- (NSInteger)numberOfCell;
- (NSString *)GroupName:(NSIndexPath *)indexPath;
- (NSString *)GroupNumberString:(NSIndexPath *)indexPath;
- (NSString *)iconImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;

- (NSString *)sectionHeaderGroupName:(NSInteger )section;
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section;
- (NSString *)sectionHeadericonImageUrl:(NSInteger )section;
//获取子公司、参与公司 信息
- (void)getMyEnterprisesSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

//获取用户信息
- (void)getUserInfoSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

//退出登录
- (void)logoutSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

//- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed;
//- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed ;
@end
