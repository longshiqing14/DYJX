//
//  XYCycleScrollViewNet.m
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYCycleScrollViewNet.h"

@implementation XYCycleScrollViewNet

/**
 *  获取首页Banner列表
 */
+ (void)netHomeBannerListblock:(infoBlockNet)block
{
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];

    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_bannerList request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
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
