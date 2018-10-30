//
//  DYJXLoginViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/10/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLoginViewModel.h"
#import "DYJXUserModel.h"

@interface DYJXLoginViewModel()

@end

@implementation DYJXLoginViewModel

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

- (void)loginWithPhoneNumber:(NSString*)phoneNumber
                    Password:(NSString*)password
                     Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    [self.requestDic setObject:phoneNumber forKey:@"LoginId"];
    [self.requestDic setObject:[password md5String] forKey:@"Password"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"CertificateId"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"ClientId"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"UserID"];

    
    [XYNetWorking XYPOST:kDYJXAPI_user_Login params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                DYJXUserModel *model = [[DYJXUserModel alloc]init];
//                [model setValuesForKeysWithDictionary:responseObject];
                model.ClientId = [responseObject objectForKey:@"ClientId"];
                model.UserID = [responseObject objectForKey:@"UserID"];
                model.ObjResult = [responseObject objectForKey:@"ObjResult"];
                model.Device = [responseObject objectForKey:@"Device"];
                //用户登录信息保存
                [XYUserDefaults writeUserDefaultsLoginedInfoModel:model];
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