//
//  DYJXAddMemberViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYDYJXResult.h"

@interface DYJXSelectMemberViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property(nonatomic, strong) NSMutableArray<XYDYJXResult*> *dataArray;
- (NSInteger)numberOfSection;
- (NSString *)selectIcon:(NSIndexPath *)indexPath;
- (NSString *)userIcon:(NSIndexPath *)indexPath;
- (NSString *)userName:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCell;
//获取用户信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
