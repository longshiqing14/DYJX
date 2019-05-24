//
//  DYJXNewGroupViewModel.m
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXNewGroupViewModel.h"
#import "GroupDetailModel.h"

@implementation DYJXNewGroupViewModel

-(NSInteger)numberOfSections {
    return self.dataArray.count;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (NSDictionary *)getUpDataParametersWithGroupType:(NSInteger)groupType {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [parameters setObject:[self getDataParametersWithGroupType:groupType] forKey:@"Data"];
    [parameters setObject:userModel.UserID forKey:@"CertificateId"];
    [parameters setObject:userModel.ClientId forKey:@"ClientId"];
    [parameters setObject:@"iOS" forKey:@"Device"];
    [parameters setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [parameters setObject:userModel.MemberID forKey:@"MemberID"];
    [parameters setObject:userModel.UserID forKey:@"UserID"];
    return parameters.copy;
}

- (NSArray *)setAdminUserIds {
    NSMutableArray *AdminUserIds = [[NSMutableArray alloc]init];
    [AdminUserIds addObject:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID];
    [self.memberModels enumerateObjectsUsingBlock:^(DYJXAddGroupSubMemberModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isAdmin) {
            [AdminUserIds addObject:obj.GroupNumber];
        }
    }];
    return AdminUserIds.copy;
}

- (NSDictionary *)getDataParametersWithGroupType:(NSInteger)groupType {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *parameters = @{}.mutableCopy;
    if (userModel.UserID) {
        [parameters setObject:[self setAdminUserIds] forKey:@"AdminUserIds"];
    }
    
    if (self.MemberIds.count > 0) {
        [parameters setObject:self.MemberIds.copy forKey:@"MemberIds"];
    }else {
        [parameters setObject:@[userModel.UserID] forKey:@"MemberIds"];
    }
    
    [parameters setObject:@(self.dataArray[0][8].isSelected) forKey:@"CanNotSearch"];
    if (self.dataArray[0][2].text) {
        [parameters setObject:self.dataArray[0][2].text forKey:@"GroupInfo"];
    }
    
    if (self.dataArray[0][1].text) {
        [parameters setObject:self.dataArray[0][1].text forKey:@"GroupName"];
    }
    if (self.dataArray[0][3].text) {
        [parameters setObject:self.dataArray[0][3].text forKey:@"GroupNumber"];
    }
    
    [parameters setObject:@(2) forKey:@"GroupType"];
    [parameters setObject:@(self.dataArray[0][6].isSelected) forKey:@"NotAllowJoinFree"];
    [parameters setObject:@(self.dataArray[0][5].isSelected) forKey:@"NotAllowJMemberInvite"];
    [parameters setObject:@(self.dataArray[0][7].isSelected) forKey:@"NotAllowSay"];
    [parameters setObject:userModel.UserID forKey:@"ParentEnterpriseId"];
    [parameters setObject:@[] forKey:@"SilenceUserIds"];
    [parameters setObject:@(groupType) forKey:@"WildType"];
    [parameters setObject:@(false) forKey:@"showChild"];
    [parameters setObject:self.dataArray[0][0].spareString ?: @"" forKey:@"GroupHeadImg"];
    [parameters setObject:@"" forKey:@"header"];
    [parameters setObject:@(false) forKey:@"isHeader"];
    return parameters.copy;
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
        !success ?: success(responseObject);
        NSLog(@"上传成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
    }];
}

-(void)uploadGroupWithGroupType:(NSInteger)groupType success:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    [XYNetWorking XYPOST:kDYJXAPI_EditGroup2 params:[self getUpDataParametersWithGroupType:groupType] success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [YDBAlertView showToast:@"新增成功！" dismissDelay:1.0];
                !success ?: success(responseObject);
            }else {
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else {
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
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
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_GetGroupById params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                DYJXXYGroupByIdResponse *groupByIdModel = [DYJXXYGroupByIdResponse modelWithJSON:responseObject];
                //TODO: 数据请求成功数据重组到数组中
                weakSelf.response = groupByIdModel;
                [weakSelf setDataArrayWithResponse:groupByIdModel];
                !success ?: success(responseObject);
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

- (void)setDataArrayWithResponse:(DYJXXYGroupByIdResponse *)response {
    DYJXXYResult *result = response.Result;
    self.dataArray.firstObject[1].text = result.GroupName;
    self.dataArray.firstObject[3].text = result.NumberString;
    if (result.Members.count > 0) {
        self.dataArray.firstObject[4].leftViewText = [NSString stringWithFormat:@"群成员(%lu人)",(unsigned long)result.Members.count];
    }else {
        self.dataArray.firstObject[4].text = @"群成员：";
    }
    self.dataArray[0][5].isSelected = result.NotAllowMemberInvite;
    self.dataArray[0][6].isSelected = result.NotAllowJoinFree;
    self.dataArray[0][7].isSelected = result.NotAllowSay;
    self.dataArray[0][8].isSelected = result.CanNotSearch;
    if ([result.SilenceUserIds containsObject:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID]) {
        self.dataArray[0][9].isSelected = YES;
    }
    self.dataArray[0][0].spareString =  response.Result.EnterpriseInfo.HeadImgUrl;
}

-(void)uploadSlientGroupMsgWithGroupNumber:(NSString *)groupNumber isSlientGroupMsg:(BOOL)isSlientGroupMsg success:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:@(isSlientGroupMsg) forKey:@"Data"];
    [reqDict setObject:groupNumber forKey:@"Id"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    [XYNetWorking XYPOST:kDYJXAPI_SlientGroupMsg params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                weakSelf.dataArray[0][9].isSelected = isSlientGroupMsg;
                !success ?: success(responseObject);
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
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(nonnull void (^)(NSString * _Nonnull))success failed:(nonnull void (^)(NSString * _Nonnull))fail{
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
                !success ?: success(@"删除公司成功！");
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
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(nonnull void (^)(NSString * _Nonnull))success failed:(nonnull void (^)(NSString * _Nonnull))fail{
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
                !success ?: success(@"退出公司成功！");
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
        path = [[NSBundle mainBundle] pathForResource:@"DYJXNewGroup.json" ofType:nil];
        if (path) {
            NSData *data = [[NSData alloc]initWithContentsOfFile:path];
            NSError *error;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&error];
            [_dataArray addObjectsFromArray: [LPXNewCustomerCellModel mj_objectArrayWithKeyValuesArray:(NSArray *)jsonObject]];
            if (self.groupType == DYJXGroupType_Details) {
                _dataArray.firstObject.firstObject.cellIdentity = kGroupDetailModelPorityCellId;
                
            }else {
                _dataArray.firstObject[9].userInteractionEnabled = YES;
            }
        }else {
            NSLog(@"josn文件不存在");
        }
    }
    return _dataArray;
}

-(NSArray<DYJXAddGroupSubMemberModel *> *)memberModels {
    if (!_memberModels) {
        _memberModels = [[NSArray alloc]init];
    }
    return _memberModels;
}


-(NSMutableArray<NSString *> *)MemberIds {
    if (!_MemberIds) {
        _MemberIds = [[NSMutableArray alloc]init];
    }
    return _MemberIds;
}

-(DYJXXYGroupByIdResponse *)response {
    if (!_response) {
        _response = [[DYJXXYGroupByIdResponse alloc]init];
    }
    return _response;
}

@end
