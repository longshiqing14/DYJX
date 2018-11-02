//
//  DYJXLogisticViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLogisticViewModel.h"
#import "DYJXLogisticModel.h"

@interface DYJXLogisticViewModel()
@property (nonatomic, strong)NSMutableArray<DYJXLogisticDetailModel*> *resultArray;
@end

@implementation DYJXLogisticViewModel

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (NSMutableArray<DYJXLogisticDetailModel *> *)resultArray{
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (NSString*)itemName:(NSIndexPath*)indexpath{
    return self.resultArray[indexpath.row].Name;
}

- (NSInteger)numberOfSection{
    if (self.resultArray.count>1) {
            return 2;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfCellectionItem{
    return self.resultArray.count;
}

//获取用户信息
- (void)getMyAppsSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_MyApps params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
              self.resultArray = [NSMutableArray arrayWithArray:[NSArray modelArrayWithClass:[DYJXLogisticDetailModel class] json:[responseObject objectForKey:@"Result"]]];
                [self.resultArray enumerateObjectsUsingBlock:^(DYJXLogisticDetailModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj.Name isEqualToString:@"xttlc"]) {
                        [weakSelf.resultArray removeObject:obj];
                    }
                }];
                success();
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}

@end
