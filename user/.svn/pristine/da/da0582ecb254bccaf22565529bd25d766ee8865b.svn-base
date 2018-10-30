//
//  XYClassificationNet.m
//  user
//
//  Created by xingyun on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationNet.h"

@implementation XYClassificationNet



/**
 *  所有分类
 */
+ (void)netCategoryListBlock:(infoBlockNet)block
{
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    //    urlDict[@"lat"] = lat;
    //    urlDict[@"lng"] = lng;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_categoryListall request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
            }else{
                 [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
         [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
}


@end
