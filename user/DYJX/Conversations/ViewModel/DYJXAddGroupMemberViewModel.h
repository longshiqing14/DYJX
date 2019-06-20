//
//  DYJXAddGroupMemberViewModel.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXAddGroupMemberModel.h"
#import "DYJXXYResult.h"
#import "DYXJResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberViewModel : NSObject

@property (nonatomic, assign) BOOL isSearchUser;

@property (nonatomic, strong)NSMutableArray<NSString *> *MemberIds;

@property (nonatomic, strong) NSMutableArray<DYJXAddGroupMemberModel *> *dataArray;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *searchDataArray;

@property (nonatomic, strong) NSMutableArray<DYJXXYResult *> *resultArray;

@property (nonatomic, strong) NSMutableArray<DJJXMembers *> *searchResultArray;

//@property (nonatomic, strong) NSMutableArray<DYJXAddGroupMemberModel *> *selectResultArray;
//
//@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *selectSearchResultArray;

@property (nonatomic, strong) NSMutableArray<NSMutableArray<DJJXMembers *> *> *selectResultArray;

@property (nonatomic, strong) NSMutableArray<DJJXMembers *> *selectSearchResultArray;

@property (nonatomic, strong) NSMutableDictionary *requestDic;

@property (nonatomic, strong) NSMutableArray<NSMutableArray<DJJXMembers *> *> *selectDataArray;
@property (nonatomic, strong) NSMutableArray<DJJXMembers *> *selectSearchDataArray;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

// 导入和删除
- (void)importOrDeleteWithIndexPath:(NSIndexPath *)indexPath isSection:(BOOL)isSection isDelete:(BOOL)isDelete;

// 获取公司成员信息
- (void)getMyEnterprisesWithSuccess:(void(^)(id response))success failed:(void(^)(NSString *errorMsg))fail;

//搜索成员信息
- (void)getSearchUserWithKeyword:(NSString*)Keyword Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

- (NSArray<DJJXMembers *> *)getSelectEnterprises;

@end

NS_ASSUME_NONNULL_END
