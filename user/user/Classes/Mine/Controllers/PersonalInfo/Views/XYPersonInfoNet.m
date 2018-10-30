//
//  XYPersonInfoNet.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPersonInfoNet.h"

@implementation XYPersonInfoNet
/**
 * 修改个人信息
 */
+(void)netUpdatePersonInfoWithDic:(NSMutableDictionary *)dic resultBlock:(infoBlockNet)block
{


    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userUpdate request_data:dic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
//                 [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];


}


/**
 * 调用修改支付密码时  获取的验证码
 */
+(void)netGetVeriCodeWithDic:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block
{

    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_smsVcode request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];

}


/**
 * 修改支付密码
 */
+(void)netChangePayWithDic:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block
{
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userSetPayPassword request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];


}
/**
 * 退出登录
 */
+(void)netSignOutResultBlock:(infoBlockNet)block
{

    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userLogout request_data:[NSMutableDictionary dictionary]];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];

}
@end
