//
//  UserManager.m
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (UserManager *)shared{
    static UserManager *singler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (singler == NULL) {
            singler = [[UserManager alloc] init];
        }
    });
    return singler;
}

-(DJJLLoginResponse *)login {
    if (!_login) {
        _login = [XYUserDefaults readLoginedModel];
        if (!_login) { // 能取则取存储
            _login = [[DJJLLoginResponse alloc] init];
        }
    }
    return _login;
}

@end
