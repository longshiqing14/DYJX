//
//  DYJXContactDetailsViewModel.h
//  user
//
//  Created by YP on 2019/5/13.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXContactDetailsTopView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXContactDetailsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *dataArray;
@property (nonatomic, strong) DYJXUserInfoModel *personInfoModel;
- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

//获取联系人信息GetUserById
- (void)getGetUserWithById:(NSString*)byId Success:(void(^)(DYJXUserInfoModel *response))success failed:(void(^)(NSString *errorMsg))fail;

// 提交数据
- (void)uploadUserWithContactType:(ContactType)type success:(void (^)(id responseObject))success failed:(void (^)(NSString *errMsg))fail;

@end


NS_ASSUME_NONNULL_END
