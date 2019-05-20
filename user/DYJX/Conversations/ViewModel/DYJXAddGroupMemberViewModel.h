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

@property (nonatomic, strong) NSMutableArray<DYJXAddGroupMemberModel *> *dataArray;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *searchDataArray;

@property (nonatomic, strong) NSMutableArray<DYJXXYResult *> *resultArray;

@property (nonatomic, strong) NSMutableArray<DYXJResult *> *searchResultArray;

@property (nonatomic, strong) NSMutableDictionary *requestDic;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

// 获取公司成员信息
- (void)getMyEnterprisesWithSuccess:(void(^)(id response))success failed:(void(^)(NSString *errorMsg))fail;

//搜索成员信息
- (void)getSearchUserWithKeyword:(NSString*)Keyword Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;

@end

NS_ASSUME_NONNULL_END
