//
//  UserManager.h
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJJXResponModel.h"
#import "DJJLLoginResponse.h"
#import "DJJSGetUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserManager : NSObject

+ (UserManager *)shared;

// 身份切换的所有信息
@property (nonatomic, strong)DJJXResponModel *myEnterprises;

// 登录信息
@property (nonatomic, strong)DJJLLoginResponse *login;

// 获取当前用户信息 rongTaken等
@property (nonatomic, strong)DJJSGetUserModel *getUserModel;

// 本人详情: 1 子公司详情: 2  公司详情: 3
@property (nonatomic, assign)NSInteger isCompany;

// 选择身份的model
@property (nonatomic, strong)DYJXIdentitySwitchingModel *swichModel;

@end

NS_ASSUME_NONNULL_END
