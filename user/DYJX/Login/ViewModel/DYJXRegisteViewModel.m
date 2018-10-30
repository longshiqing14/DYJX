//
//  DYJXGetAuthorizationCodeViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/10/28.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXRegisteViewModel.h"

@implementation DYJXRegisteViewModel

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (void)getAuthorizationCodeWithPhoneNumber:(NSString*)phoneNumber Success:(void(^)(NSString *randCode))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    [self.requestDic setObject:phoneNumber forKey:@"Cellphone"];

    
    [XYNetWorking XYPOST:kDYJXAPI_user_GetRegisterAuthorizationCode params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                success([responseObject objectForKey:@"RndCode"]);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}

- (void)registeWithPhoneNumber:(NSString*)phoneNumber AuthorizationCode:(NSString*)code ranCode:(NSString*)ranCode password:(NSString*)password  Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    [self.requestDic setObject:phoneNumber forKey:@"Cellphone"];
    [self.requestDic setObject:code forKey:@"AuthorizationCode"];
    [self.requestDic setObject:[password md5String] forKey:@"Password"];
    [self.requestDic setObject:@"3" forKey:@"RegisterFromType"];
    [self.requestDic setObject:ranCode forKey:@"RndCode"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"ClientId"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"CertificateId"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_Register params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                success();
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}
@end
