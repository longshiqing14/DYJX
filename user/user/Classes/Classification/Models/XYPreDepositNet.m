//
//  XYPreDepositNet.m
//  user
//
//  Created by xingyun on 2017/10/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositNet.h"

@implementation XYPreDepositNet
/**
 *  获取预存款成功返回的字段。
 * orderId 订单ID
 */

+(void)netGetWarnInfo:(NSString *)orderId Block:(infoBlockNet)block
{

//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"orderId"] = orderId;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderRechargeDetail request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                //                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                [XYProgressHUD svHUDDismiss];

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



@end
