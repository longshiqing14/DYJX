//
//  XYOrderCommentNet.m
//  user
//
//  Created by xingyun on 2017/9/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentNet.h"

@implementation XYOrderCommentNet

+(void)netGetCommentListWithParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productWaitforcomments request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                //                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                [XYProgressHUD svHUDDismiss];

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






/** 增加评论 */
+(void)netUploadCommentWithParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block
{
    [XYProgressHUD show];
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中" dismissTimeInterval:1.0];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productCommentAdd request_data:param];
    
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


//product.comment.detail



/** 单个商品评论详情 */
+(void)netOneProductCommentDetail:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block
{
    [XYProgressHUD show];
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中" dismissTimeInterval:1.0];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productCommentDetail request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                //                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                [XYProgressHUD svHUDDismiss];

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
