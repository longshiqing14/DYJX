//
//  DJGroupChatWildGroupsViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJGroupChatWildGroupsViewModel : NSObject
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
- (void)getMyWildGroupsDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
