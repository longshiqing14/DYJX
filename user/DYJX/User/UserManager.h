//
//  UserManager.h
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJJXResponModel.h"
#import "DYJXUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserManager : NSObject

+ (UserManager *)shared;

// 身份切换的所有信息
@property (nonatomic, strong)DJJXResponModel *myEnterprises;

// 登录信息
@property (nonatomic, strong)DYJXUserModel *login;

@end

NS_ASSUME_NONNULL_END
