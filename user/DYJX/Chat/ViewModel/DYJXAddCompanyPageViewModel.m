//
//  DYJXAddCompanyPageViewModel.m
//  user
//
//  Created by YP on 2019/4/26.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageViewModel.h"
#import "GroupDetailModel.h"

@implementation DYJXAddCompanyPageViewModel

- (instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType {
    self = [super init];
    if (self) {
        self.companyType = companyType;
    }
    return self;
}

-(NSInteger)numberOfSections {
    return self.dataArray.count;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (NSDictionary *)getUpDataParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:[self getDataParameters] forKey:@"Data"];
    [parameters setObject:self.requestDic[@"CertificateId"] forKey:@"CertificateId"];
    [parameters setObject:self.requestDic[@"ClientId"] forKey:@"ClientId"];
    [parameters setObject:self.requestDic[@"Device"] forKey:@"Device"];
    [parameters setObject:self.requestDic[@"DeviceToken"] forKey:@"DeviceToken"];
    [parameters setObject:self.requestDic[@"MemberID"] forKey:@"MemberID"];
    [parameters setObject:self.requestDic[@"UserID"] forKey:@"UserID"];
    return parameters.copy;
}

- (NSDictionary *)getDataParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:((self.result.AdminUserIds != nil) ? self.result.AdminUserIds.copy : @[self.requestDic[@"CertificateId"]].copy) forKey:@"AdminUserIds"];
    [parameters setObject:[self getEnterpriseInfoParameters] forKey:@"EnterpriseInfo"];
    [parameters setObject:@"" forKey:@"GroupInfo"];

    [parameters setObject:self.result.GroupName? self.result.GroupName : @"" forKey:@"GroupName"];
    [parameters setObject:self.result.GroupNumber? self.result.GroupNumber : @"" forKey:@"GroupNumber"];
    [parameters setObject:@(self.result.GroupType ? self.result.GroupType : 1) forKey:@"GroupType"];
    [parameters setObject:@[self.result.MemberIds] ? @[self.result.MemberIds.firstObject] : @"" forKey:@"MemberIds"];
    [parameters setObject:self.result.SilenceUserIds ? self.result.SilenceUserIds : @"" forKey:@"SilenceUserIds"];
    [parameters setObject:@(false) forKey:@"showChild"];
    [parameters setObject:@"" forKey:@"header"];
    [parameters setObject:@(false) forKey:@"isHeader"];
    if (self.companyType == DYJXAddCompanyType_Sub ||
        self.companyType == DYJXAddCompanyType_SubDetails) {
        [parameters setObject:@(self.result.IsPart) forKey:@"IsPart"];
        [parameters setObject:self.result.GroupNumber ?: @"" forKey:@"ParentEnterpriseId"];
        [parameters setObject:@(self.result.PartType) forKey:@"PartType"];
    }
    return parameters.copy;
}

- (NSMutableDictionary *)getEnterpriseInfoParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:self.dataArray[0][1].text ?: @"" forKey:@"CompanyName"];
    [parameters setObject:self.dataArray[0][2].text ?: @""  forKey:@"CompanyInfo"];
    [parameters setObject:self.dataArray[0][3].text ?: @"" forKey:@"CompanyShortName"];
    [parameters setObject:@(self.dataArray[0][5].isSelected) forKey:@"AdminSay"];
    [parameters setObject:@(self.dataArray[0].lastObject.isSelected) forKey:@"CanNotSearch"];
    
    [parameters setObject:self.dataArray[1][0].text ?: @"" forKey:@"SociologyCredit"];
    [parameters setObject:self.dataArray[1][1].text ?: @"" forKey:@"Address"];
    [parameters setObject:self.dataArray[1].lastObject.text ?: @"" forKey:@"CompanyTel"];
    
    [parameters setObject:self.dataArray[2][0].text ?: @"" forKey:@"CompanyLinkMan"];
    [parameters setObject:self.dataArray[2][1].text ?: @"" forKey:@"CompanyLinkManCellphone"];
    [parameters setObject:self.dataArray[2][2].text ?: @"" forKey:@"CompanyLinkManQQ"];
    [parameters setObject:self.dataArray[2][3].text ?: @"" forKey:@"CompanyLinkManWeiXin"];
    [parameters setObject:self.dataArray[2][4].text ?: @"" forKey:@"WebSite"];
    [parameters setObject:self.dataArray[2][5].text ?: @"" forKey:@"CompanyEmail"];
    
    [parameters setObject:self.dataArray[3][0].text ?: @"" forKey:@"CompanyWeiXin"];
    [parameters setObject:self.dataArray[3][1].text ?: @"" forKey:@"CompanyAlipay"];
    [parameters setObject:self.dataArray[3][2].text ?: @"" forKey:@"CompanyBankCardNO"];
    [parameters setObject:self.dataArray[3][3].text ?: @"" forKey:@"CompanyBankName"];
    [parameters setObject:self.dataArray[3][4].text ?: @"" forKey:@"CompanyBank"];
    
    [parameters setObject:self.dataArray.lastObject.lastObject.spareArray.copy ?: @[] forKey:@"Images"];
    return parameters.copy;
}

//获取公司信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
        [reqDict setObject:userModel.CertificateId forKey:@"CertificateId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_GetGroupById params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                DYJXXYGroupByIdResponse *groupByIdModel = [DYJXXYGroupByIdResponse modelWithJSON:responseObject];
                //TODO: 数据请求成功数据重组到数组中
                
                success(groupByIdModel);
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

//删除公司
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_DeleteGroup params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [YDBAlertView showToast:@"删除公司成功！" dismissDelay:1.0];
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

//退出公司
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_QuitGroup2 params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [YDBAlertView showToast:@"退出公司成功！" dismissDelay:1.0];
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

-(NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)dataArray {
    if (!_dataArray) {
        NSString *path;
        _dataArray = [[NSMutableArray alloc]init];
        if (self.companyType == DYJXAddCompanyType_Sub ||
            self.companyType == DYJXAddCompanyType_SubDetails) {
            path = [[NSBundle mainBundle] pathForResource:@"DYJXAddSubCompany.json" ofType:nil];
        }else {
            path = [[NSBundle mainBundle] pathForResource:@"DYJXAddCompany.json" ofType:nil];
        }
        if (path) {
            NSData *data = [[NSData alloc]initWithContentsOfFile:path];
            NSError *error;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&error];
            [_dataArray addObjectsFromArray: [LPXNewCustomerCellModel mj_objectArrayWithKeyValuesArray:(NSArray *)jsonObject]];
            if (self.companyType == DYJXAddCompanyType_Details ||
                self.companyType == DYJXAddCompanyType_SubDetails) {
                _dataArray.firstObject.firstObject.cellIdentity = kGroupDetailModelPorityCellId;
            }
        }else {
            NSLog(@"josn文件不存在");
        }
    }
    return _dataArray;
}

//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager POST:[BEST_URL stringByAppendingString:kDYJXAPI_user_UploadFile] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *data = UIImageJPEGRepresentation(image, 0.2);
        //上传的参数(上传图片，以文件流的格式)
        // 设置时间格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString  stringWithFormat:@"%@.png", dateString];
        [formData appendPartWithFileData:data
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传进度：%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        NSLog(@"上传成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
    }];
}

// 提交用户数据
- (void)uploadCompanySuccess:(void (^)(DYJXXYGroupByIdResponse *))success failed:(void (^)(NSString *))fail {
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_user_EditGroup2 params:[self getUpDataParameters] success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                NSString *message = @"添加公司成功！";
                if (weakSelf.companyType == DYJXAddCompanyType_Sub) {
                    message = @"添加子公司成功！";
                }else if (weakSelf.companyType == DYJXAddCompanyType_Details) {
                    message = @"公司详情修改成功！";
                }else {
                    message = @"子公司详情修改成功！";
                }
                [YDBAlertView showToast:message dismissDelay:1.0];
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

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (DYJXXYResult *)result {
    if (!_result) {
        _result = [[DYJXXYResult alloc]init];
    }
    return _result;
}

@end
