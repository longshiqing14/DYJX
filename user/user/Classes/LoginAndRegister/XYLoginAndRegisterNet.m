//
//  XYLoginAndRegisterNet.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYLoginAndRegisterNet.h"


#import "XYUserDefaults.h"

#import "JPUSHService.h"            // 极光推送


@implementation XYLoginAndRegisterNet


/**
 *  获取 验证码
 *  mobile 电话
 */
+ (void)netGetVcodeWithMobile:(NSString*)mobile
                        block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"phone"] = mobile;
    urlDict[@"type"]=@"1";
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_smsVcode request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
                block(nil,error);
            }
            
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
        
    }];
}


/**
 *  登陆
 *  mobile 电话
 *  vcode  验证码
 */
+ (void)netUserLoginByCodeWithMobile:(NSString*)mobile
                               vcode:(NSString*)vcode
                               block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"登录中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"mobile"] = mobile;
    urlDict[@"vcode"] = vcode;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userLogin request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
                block(nil,error);
            }
            
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
[YDBAlertView showToast:@"连接异常" dismissDelay:1.0];        block(nil,error);
        
    }];
}

/**
 *  获取  SessionId
 */
+ (void)netGetSessionIdWithForce:(NSString*)force WithBlock:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"登录中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    if (force != nil) {
        [urlDict setObject:force forKey:@"force"];
    }
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_sessionGet request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                NSDictionary * dict = [XYCommon removeNull:[responseObject objectForKey:RETURN_DATA]];
                [XYUserDefaults writeUserDefaultsSessionIdDict:dict];
                
                block(dict,nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
                block(nil,error);
            }
            
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100001 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

        block(nil,error);
        
    }];
}


/**
 *  获取 个人信息
 */
+ (void)netGetUserInfoListBlock:(infoBlockNet)block
{
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userInfo request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            NSError * error = [NSError errorWithDomain:@"格式不对" code:10000 userInfo:nil];
            block(nil,error);
        }
        
        if (![[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
            NSError * error = [NSError errorWithDomain:[responseObject objectForKey:RETURN_DESC] code:10000 userInfo:nil];
            block(nil,error);
        }
        
        if ([responseObject objectForKey:RETURN_DATA] == nil) {
            NSError * error = [NSError errorWithDomain:[responseObject objectForKey:RETURN_DESC] code:10000 userInfo:nil];
            block(nil,error);
        }
        
        if([[responseObject objectForKey:RETURN_DATA] isKindOfClass:[NSDictionary class]]){
            
            NSDictionary * dict = [XYCommon removeNull:[[responseObject objectForKey:RETURN_DATA] objectForKey:@"user"]];
            [XYUserDefaults writeUserDefaultsInfoDict:dict];
            block(dict,nil);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
    
}

/**
 *  绑定 极光 cid
 */
+ (void)netUpdateCIDBindBlock:(infoBlockNet)block
{
    
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    if ([JPUSHService registrationID] == nil) {
        return;
    }
    
    urlDict[@"cid"] =  [JPUSHService registrationID];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCidBind request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [XYProgressHUD svHUDDismiss];
        if([[responseObject objectForKey:RETURN_DATA] isKindOfClass:[NSDictionary class]]){
            
            block([responseObject objectForKey:RETURN_DATA],nil);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {

        block(nil,error);
    }];
    
}





@end
