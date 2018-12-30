//
//  DJCompanyChatViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJCompanyChatViewModel : NSObject
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
//获取我创建或参与公司
- (void)getMyGroupsDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
