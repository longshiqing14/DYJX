//
//  DYJXMyManageGroupViewModel.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXMyManageGroupViewModel.h"

@implementation DYJXMyManageGroupViewModel

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)addObjectsFromGroups:(NSArray<DYJXXYResult *> *)groups {
    WeakSelf
    [groups enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.dataArray addObject:[weakSelf addGroupWithSelection:([obj.MemberIds containsObject:weakSelf.targetId] ? YES : NO) imageName:obj.GroupHeadImg groupName:obj.GroupName]];
        [weakSelf.originalArray addObject:[weakSelf addGroupWithSelection:([obj.MemberIds containsObject:weakSelf.targetId] ? YES : NO) imageName:obj.GroupHeadImg groupName:obj.GroupName]];
    }];
}

-(void)getInviteIntoMyManageGroupSuccess:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_MyManagedGroups params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                NSLog(@"Succeed :%@",responseObject);
                [weakSelf.resultArray removeAllObjects];
                [weakSelf.dataArray removeAllObjects];
                [weakSelf.resultArray addObjectsFromArray:[NSArray modelArrayWithClass:[DYJXXYResult class] json:responseObject[@"Result"]]];
                [weakSelf addObjectsFromGroups:weakSelf.resultArray];
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

-(void)uploadUserWithSuccess:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    WeakSelf
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    for (LPXNewCustomerCellModel *model in self.dataArray) {
        NSInteger index = [self.dataArray indexOfObject:model];
        LPXNewCustomerCellModel *original = [self.originalArray objectAtIndex:index];
        if (model.isSelected != original.isSelected) {
            dispatch_group_enter(group);
            dispatch_async(queue, ^{
                [weakSelf uploadSelectedUserWithGroupIndex:index isDelete:!model.isSelected success:^(id responseObject, NSString *errMsg) {
                    if (errMsg) {
                        [YDBAlertView showToast:errMsg dismissDelay:1.0];
                    }
                    dispatch_group_leave(group);
                }];
            });
        }
    }
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [YDBAlertView showToast:@"邀请成功！" dismissDelay:1.0];
            !success ?: success(@"长传成功！");
        });
    });
}

- (void)uploadSelectedUserWithGroupIndex:(NSInteger)index isDelete:(BOOL)isDelete success:(void (^)(id responseObject,NSString *errMsg))success {
    DYJXXYResult *result = self.resultArray[index];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:[self getDataParametersWithResult:result isDelete:isDelete] forKey:@"Data"];
    [parameters setObject:userModel.UserID forKey:@"CertificateId"];
    [parameters setObject:userModel.ClientId forKey:@"ClientId"];
    [parameters setObject:@"iOS" forKey:@"Device"];
    [parameters setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [parameters setObject:userModel.MemberID forKey:@"MemberID"];
    [parameters setObject:userModel.UserID forKey:@"UserID"];
    [XYNetWorking XYPOST:kDYJXAPI_user_EditGroup2 params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *errMsg;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
            }else {
                errMsg = [responseObject objectForKey:@"Message"];
            }
        }else {
            errMsg = @"连接异常";
        }
        !success ?: success(responseObject,errMsg);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        !success ?: success(nil,@"连接异常");
    }];
}

- (NSDictionary *)getDataParametersWithResult:(DYJXXYResult *)result isDelete:(BOOL)isDelete{
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters addEntriesFromDictionary:[result modelToJSONObject]];
    if ([[parameters allKeys] containsObject:@"AllMemberIds"]) {
        [parameters removeObjectForKey:@"AllMemberIds"];
    }
    if ([[parameters allKeys] containsObject:@"GroupHeadImg"]) {
        [parameters removeObjectForKey:@"GroupHeadImg"];
    }
    
    if ([[parameters allKeys] containsObject:@"MemberIds"]) {
        NSMutableArray *MemberIds = [[NSMutableArray alloc]init];
        [MemberIds addObjectsFromArray:(NSArray *)parameters[@"MemberIds"]];
        if (isDelete) {
            if ([MemberIds containsObject:self.targetId]) {
                [MemberIds removeObject:self.targetId];
            }
        }else {
            [MemberIds addObject:self.targetId];
        }
        [parameters setValue:MemberIds forKey:@"MemberIds"];
    }
    if ([[parameters allKeys] containsObject:@"AdminUsers"]) {
        NSArray *adminUsers = ((NSArray *)parameters[@"AdminUsers"]).copy;
        [adminUsers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary *adminUser = ((NSDictionary *)obj).mutableCopy;
            [adminUser setObject:@(false) forKey:@"select"];
        }];
        [parameters setValue:adminUsers.copy forKey:@"AdminUsers"];
    }
    
    [parameters setObject:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID forKey:@"UpdateBy"];
    // 设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    [parameters setObject:dateString forKey:@"UpdateOn"];
    [parameters setObject:@(false) forKey:@"showChild"];
    [parameters setObject:@"" forKey:@"header"];
    [parameters setObject:@(false) forKey:@"isHeader"];
    return parameters;
}

-(NSMutableArray<LPXNewCustomerCellModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (LPXNewCustomerCellModel *)addGroupWithSelection:(BOOL)selection imageName:(NSString *)imageName groupName:(NSString *)groupName{
    NSDictionary *params = @{@"leftViewImage":imageName ? imageName : @"",
                             @"text":groupName ? groupName : @""
                             ,@"isShowSelectetView":
                                 @(true),
                             @"isSelected" : @(selection),
                             @"righImageName":@"register_checkbox",
                             @"righSelectedImageName":@"register_checkbox_active"
                             }.copy;
    return [LPXNewCustomerCellModel parse:params];
}

-(NSMutableArray<DYJXXYResult *> *)resultArray {
    if (!_resultArray) {
        _resultArray = [[NSMutableArray alloc]init];
    }
    return _resultArray;
}

@end
