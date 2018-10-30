//
//  XYBoardBandNet.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBoardBandNet.h"

@implementation XYBoardBandNet

/** 我的宽带信息 */
+(void)netMyBoardBandWithParam:(NSMutableDictionary *)param block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCkList request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

//                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                

                if (![[responseObject objectForKey:RETURN_CODE] isEqualToString:@"E1070002"]&&! [[responseObject objectForKey:RETURN_CODE] isEqualToString:@"E1070010"]) {
                           [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                }
                
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
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

/** 我的续约列表*/
+(void)netBoardBandRenewalWithParam:(NSMutableDictionary *)param block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCkRenewlist request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                //                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
            [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
//                [XYProgressHUD svHUDDismiss];
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
/** 我的续约详情*/
+(void)netBoardBandRenewalDetailWithParam:(NSMutableDictionary *)param block:(infoBlockNet)block;
{
    [XYProgressHUD show];
    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCkRenewDetail request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                //                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
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
/** 补充宽带安装信息 */
+(void)netSupplyBoardbandInfo:(NSMutableDictionary *)param block:(infoBlockNet)block
{

//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCkBook request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
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



/** 绑定宽带账号 */
+(void)netBindingBoardbandParam:(NSMutableDictionary *)param block:(infoBlockNet)block
{
    
    
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userCkBind request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
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
