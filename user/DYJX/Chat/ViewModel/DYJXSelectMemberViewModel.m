//
//  DYJXAddMemberViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXSelectMemberViewModel.h"

@interface DYJXSelectMemberViewModel()
@property (nonatomic, strong)XYDYJXResult *result;
@end
@implementation DYJXSelectMemberViewModel
- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSInteger)numberOfCell{
    return self.dataArray.count;
}

//- (NSString *)selectIcon:(NSIndexPath *)indexPath{
//    return self.dataArray[indexPath.row].IMUser.Business.IMInfo.HeadImgUrl;
//}
- (NSString *)userIcon:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.row].IMUser.Business.IMInfo.HeadImgUrl;
}
- (NSString *)userName:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.row].IMUser.DisplayName;
}

//获取子公司信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_SearchContact params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //            [weakSelf.dataArray removeAllObjects];
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [weakSelf.dataArray removeAllObjects];
                weakSelf.dataArray = [[NSArray modelArrayWithClass:[XYDYJXResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
               
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

- (NSMutableArray<XYDYJXResult*>*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (XYDYJXResult *)result{
    if (!_result) {
        _result = [[XYDYJXResult alloc]init];
    }
    return _result;
}
@end
