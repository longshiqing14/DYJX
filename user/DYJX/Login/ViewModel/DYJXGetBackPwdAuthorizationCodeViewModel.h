//
//  DYJXGetBackPwdAuthorizationCodeViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXGetBackPwdAuthorizationCodeViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (void)getBackPwdAuthorizationCodeWithPhoneNumber:(NSString*)phoneNumber Success:(void(^)(NSString *randCode))success failed:(void(^)(NSString *errorMsg))fail;
- (void)resetPwdWithPhoneNumber:(NSString*)phoneNumber AuthorizationCode:(NSString*)code ranCode:(NSString*)ranCode password:(NSString*)password  Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
