//
//  JXDeliverWayViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/3/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXDeliverWayViewModel.h"

@implementation JXDeliverWayViewModel
- (void)uploadAdressIDSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_warehouseGetList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];
                
                success(nil,nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
            fail(error.localizedDescription);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        fail(error.localizedDescription);
    }];
    
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}
@end
