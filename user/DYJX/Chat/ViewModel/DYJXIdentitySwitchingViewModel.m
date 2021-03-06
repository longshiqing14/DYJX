//
//  DYJXIdentitySwitchingViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingViewModel.h"
#import "DYJXUserInfoModel.h"
#import "DJJXResponModel.h"
#import "DJJSGetUserModel.h"
#import "AppDelegate.h"
#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DYJXIdentitySwitchingViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) DYJXUserInfoModel *resultUserInfoModel;
@property (nonatomic, strong) DYJXIdentitySwitchingModel *resultModel;
@end
@implementation DYJXIdentitySwitchingViewModel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (DYJXIdentitySwitchingModel *)resultModel{
    if (!_resultModel) {
        _resultModel = [[DYJXIdentitySwitchingModel alloc]init];
    }
    return _resultModel;
}

- (DYJXUserInfoModel *)resultUserInfoModel{
    if (!_resultUserInfoModel) {
        _resultUserInfoModel = [[DYJXUserInfoModel alloc]init];
    }
    return _resultUserInfoModel;
}

- (NSMutableArray<DYJXIdentitySwitchingModel *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (DYJXIdentitySwitchingModel*)IdentityAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.row];
}

- (NSString *)GroupName:(NSIndexPath *)indexPath
{
    
    return self.dataArray[indexPath.row].GroupName;
}

- (NSString *)GroupNumberString:(NSIndexPath *)indexPath
{
    
    return self.dataArray[indexPath.row].NumberString;
}

- (NSString *)iconImageUrl:(NSIndexPath *)indexPath
{
    return self.dataArray[indexPath.row].GroupHeadImg;
}

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

//- (NSInteger)numberOfCell:(NSInteger)section{
//    return self.dataArray[section].Children.count;
//}

- (NSInteger)numberOfCell{
    return self.dataArray.count;
}

- (NSString *)sectionHeaderGroupName:(NSInteger )section{
   return self.dataArray[section].GroupName;
}
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section{
    return self.dataArray[section].NumberString;
}
- (NSString *)sectionHeadericonImageUrl:(NSInteger )section{
    return self.dataArray[section].GroupHeadImg;
}

//获取子公司、参与公司 信息
- (void)getMyEnterprisesSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_MyEnterprises params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            DJJXResponModel *responseModel = [DJJXResponModel mj_objectWithKeyValues:responseObject];
            responseModel.Result = [NSArray modelArrayWithClass:[DJJXResult class] json:responseModel.Result];
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                    NSArray *resultArray = [NSArray modelArrayWithClass:[DYJXIdentitySwitchingModel class] json:[responseObject objectForKey:@"Result"]];

                [resultArray enumerateObjectsUsingBlock:^(DYJXIdentitySwitchingModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.dataArray addObject:obj];
                    if (obj.Children.count > 0) {
                        [weakSelf.dataArray addObjectsFromArray:obj.Children];
                    }
                    
                }];

                [UserManager shared].dataArray = self.dataArray;

                success();
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
                
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                fail(error.localizedDescription);
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

//获取用户信息
- (void)getUserInfoSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
        [reqDict setObject:userModel.UserID forKey:@"Data"];
        [reqDict setObject:userModel.UserID forKey:@"UserID"];
        [reqDict setObject:@"iOS" forKey:@"Device"];
        [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
        [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
//        [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];

    [XYNetWorking XYPOST:kDYJXAPI_user_GetUserById params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            [weakSelf.dataArray removeAllObjects];
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [UserManager shared].getUserModel = [DJJSGetUserModel mj_objectWithKeyValues:responseObject];
                [UserManager shared].getUserModel.Result = [DJJSResult mj_objectWithKeyValues:responseObject[@"Result"]];
                weakSelf.resultUserInfoModel = [DYJXUserInfoModel modelWithJSON:[responseObject objectForKey:@"Result"]];
                userModel.MemberID = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"MemberID"]];
                [UserManager shared].login.MemberID = userModel.MemberID;
                [XYUserDefaults writeUserDefaultsLoginedInfoModel:userModel];

                DYJXIdentitySwitchingModel *identitySwitchingModel = [[DYJXIdentitySwitchingModel alloc]init];
                identitySwitchingModel.NumberString = weakSelf.resultUserInfoModel.NumberString;
                identitySwitchingModel.GroupName = weakSelf.resultUserInfoModel.Business.IMInfo.NickName;
                identitySwitchingModel.GroupHeadImg = weakSelf.resultUserInfoModel.Business.IMInfo.HeadImgUrl;
                identitySwitchingModel.Id = userModel.UserID;
                [weakSelf.dataArray addObject:identitySwitchingModel];
                AppDelegate *appD = (AppDelegate *)[UIApplication sharedApplication].delegate;
                if (appD) {
                    [appD IMInit];
                }
                success();
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
                fail([responseObject objectForKey:@"Message"]);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            fail([responseObject objectForKey:@"Message"]);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        fail(@"连接异常");
    }];
}


//退出登录
- (void)logoutSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
//    [reqDict setObject:userModel.CertificateId forKey:@"CertificateId"];
//    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
//    [reqDict setObject:userModel.DeviceToken forKey:@"DeviceToken"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_Logout params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [[RCIMClient sharedRCIMClient]
                 logout]; // 退出连接
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
