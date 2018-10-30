//
//  JXShareManager.m
//  user
//
//  Created by 岩  熊 on 2017/12/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShareManager.h"
#import "JXBaseModel.h"
#import "JXShareModel.h"

@implementation JXShareManager
+ (void)getShareInfoFromSeveiceSuccess:( void(^)(JXShareModel *))success fail:( void(^)())fail
{
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_GetShare request_data:[NSMutableDictionary dictionary]];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        JXBaseModel *baseModel=[JXBaseModel modelWithJSON:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYProgressHUD svHUDDismiss];

            JXShareModel *model = [JXShareModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
            success(model);
        }else{
            [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
    
}

+ (void)getShotScreenInfoFromSeveiceSuccess:( void(^)(JXShareModel*))success fail:( void(^)())fail {
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_shareGetPrintscreen request_data:[NSMutableDictionary dictionary]];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        JXBaseModel *baseModel=[JXBaseModel modelWithJSON:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYProgressHUD svHUDDismiss];

            JXShareModel *model = [JXShareModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
            success(model);
        }else{
            [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}
//首页 商品详情 活动 分享
+ (void)getShareInfoFromSeveiceParam:(NSDictionary *)param Success:( void(^)(JXShareModel *))success fail:( void(^)())fail{
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_shareCustomSharing request_data:param];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        JXBaseModel *baseModel=[JXBaseModel modelWithJSON:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYProgressHUD svHUDDismiss];

            JXShareModel *model = [JXShareModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
            success(model);
        }else{
            [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}
@end
