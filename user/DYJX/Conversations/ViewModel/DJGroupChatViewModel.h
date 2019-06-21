//
//  DJGroupChatViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXXYResult.h"
@interface DJGroupChatViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> *innerGroupdataArray;
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> *wildGroupdataArray;
- (NSInteger)numberOfSection;
//- (NSInteger)numberOfCell:(NSInteger )section;
- (NSInteger)numberOfCell:(NSInteger)section;
- (NSString *)GroupName:(NSIndexPath *)indexPath;
- (NSString *)GroupNumberString:(NSIndexPath *)indexPath;
- (NSString *)iconImageUrl:(NSIndexPath *)indexPath;
- (NSArray *)goodsLable:(NSIndexPath *)indexPath;
- (NSString *)productID:(NSIndexPath *)indexPath;
- (NSString *)GroupId:(NSIndexPath *)indexPath;

- (NSString *)sectionHeaderGroupName:(NSInteger )section;
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section;
- (NSString *)sectionHeadericonImageUrl:(NSInteger )section;
//获取我创建或参与公司
- (void)getMyCompanyAndGroupDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
