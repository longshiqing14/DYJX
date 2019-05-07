//
//  DYJXNewGroupViewModel.m
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXNewGroupViewModel.h"

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

- (NSDictionary *)getDataParametersWithGroupType:(NSInteger)groupType {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:@[userModel.UserID] forKey:@"AdminUserIds"];
    [parameters setObject:@(self.dataArray[0][8].isSelected) forKey:@"CanNotSearch"];
    [parameters setObject:self.dataArray[0][2].text forKey:@"GroupInfo"];
    [parameters setObject:self.dataArray[0][1].text forKey:@"GroupName"];
    [parameters setObject:self.dataArray[0][3].text forKey:@"GroupNumber"];
    [parameters setObject:@(2) forKey:@"GroupType"];
    [parameters setObject:@[userModel.UserID] forKey:@"MemberIds"];
    [parameters setObject:@(self.dataArray[0][6].isSelected) forKey:@"NotAllowJoinFree"];
    [parameters setObject:@(self.dataArray[0][5].isSelected) forKey:@"NotAllowJMemberInvite"];
    [parameters setObject:@(self.dataArray[0][7].isSelected) forKey:@"NotAllowSay"];
    [parameters setObject:userModel.UserID forKey:@"ParentEnterpriseId"];
    [parameters setObject:@[] forKey:@"SilenceUserIds"];
    [parameters setObject:@(groupType) forKey:@"WildType"];
    [parameters setObject:@(self.dataArray[0][9].isSelected) forKey:@"showChild"];
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
        }else {
            NSLog(@"josn文件不存在");
        }
    }
    return _dataArray;
}

@end
