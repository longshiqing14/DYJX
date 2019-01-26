//
//  DYJXLoginViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXLoginViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (void)loginWithPhoneNumber:(NSString*)phoneNumber
                    Password:(NSString*)password
                     Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
- (void)loginCodeWithPhoneNumber:(NSString*)phoneNumber
                        Password:(NSString*)password
                         rndCode:(NSString*)rndCode
                         Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
- (void)getAuthorizationCodeWithPhoneNumber:(NSString*)phoneNumber Success:(void(^)(NSString *randCode))success failed:(void(^)(NSString *errorMsg))fail;
@end
