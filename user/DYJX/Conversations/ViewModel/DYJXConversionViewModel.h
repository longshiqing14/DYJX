//
//  DYJXConversionViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXConversionViewModel : NSObject
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
- (void)getMyConversionDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

@end
