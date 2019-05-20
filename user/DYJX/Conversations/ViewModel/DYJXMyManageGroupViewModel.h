//
//  DYJXMyManageGroupViewModel.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXXYResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXMyManageGroupViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<DYJXXYResult *> *resultArray;

@property (nonatomic, strong) NSMutableArray<LPXNewCustomerCellModel *> *dataArray;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

// 邀请进我管理的群
- (void)getInviteIntoMyManageGroupSuccess:(void(^)(id response))success failed:(void(^)(NSString *errorMsg))fail;

// 提交数据
- (void)uploadUserWithSuccess:(void (^)(id responseObject))success failed:(void (^)(NSString *errMsg))fail;

@end

NS_ASSUME_NONNULL_END
