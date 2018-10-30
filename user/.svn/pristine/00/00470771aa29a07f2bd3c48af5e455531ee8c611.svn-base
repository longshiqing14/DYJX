//
//  XYEWalletAllNet.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletAllNet.h"

@implementation XYEWalletAllNet


/**
 *  余额 列表
 *  limit  每个分页条数   默认 10
 *  start  页码         默认 1
 */
+ (void)netPredepositListLimit:(NSString*)limit
                        logType:(NSString *)type
                     startTime:(NSString *)startTime
                       endTime:(NSString *)endTime
                         start:(NSString*)start AfterAmount:(NSString *)afterAmount
                         block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"limit"] = (limit == nil || [limit isEqualToString:@""]) ? @"10" : limit;
    urlDict[@"start"] = (start == nil || [start isEqualToString:@""]) ? @"1" : start;
    urlDict[@"endTime"] = endTime;
    urlDict[@"logType"] = type;
    urlDict[@"accountType"] = afterAmount;
    urlDict[@"startTime"] = startTime;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userPredepositLogs request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
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
 *  余额详情
 *  balance_id  详情 id
 */
+ (void)netdepositDetailWithid:(NSString*)balance_id
                         block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"id"] = balance_id;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userDepositLogDetail request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
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
 *  预存款分期返现 列表
 */
+ (void)netPredepositbackListWithBlock:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
//    urlDict[@"limit"] = (limit == nil || [limit isEqualToString:@""]) ? @"10" : limit;
//    urlDict[@"start"] = (start == nil || [start isEqualToString:@""]) ? @"1" : start;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userPredepositBackList request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
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
 *  预存款分期返现 - 单次详情
 *  cashbackId     id
 */
+ (void)netdepositDetailWithCashbackId:(NSString*)cashbackId
                         block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cashbackId"] = cashbackId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userPredepositBackDetail request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
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
