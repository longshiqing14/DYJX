//
//  JXPiontsRuleViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/2/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXPiontsRuleViewModel.h"

@interface JXPiontsRuleViewModel()
@property (nonatomic, strong)JXPiontsRuleModel *model;
@end
@implementation JXPiontsRuleViewModel

- (void)getPointsRulesInfoFromSeveiceSuccess:( void(^)(JXPiontsRuleModel*))success fail:( void(^)())fail {
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_pointsDescription request_data:[NSMutableDictionary dictionary]];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        JXBaseModel *baseModel=[JXBaseModel modelWithJSON:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYProgressHUD svHUDDismiss];

            JXPiontsRuleModel *model = [JXPiontsRuleModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
            success(model);
        }else{
            [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
            
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}
@end
