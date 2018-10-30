//
//  XYMineAllNet.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineAllNet.h"

@implementation XYMineAllNet

/** 获取客服电话 */
+(void)netMineFindCustomerServiceResultBlock:(infoBlockNet)block
{

    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_csPhone request_data:[NSMutableDictionary dictionary]];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
  
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
