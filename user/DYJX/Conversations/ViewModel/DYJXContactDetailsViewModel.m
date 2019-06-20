//
//  DYJXContactDetailsViewModel.m
//  user
//
//  Created by YP on 2019/5/13.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXContactDetailsViewModel.h"

@implementation DYJXContactDetailsViewModel

-(NSInteger)numberOfSections {
    return self.dataArray.count;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (void)setContentsWithPersonInfoModel:(DYJXUserInfoModel *)personInfoModel {
    self.dataArray[0][1].text = personInfoModel.NumberString;
    self.dataArray[0][2].text = personInfoModel.Cellphone;
    
    self.dataArray[1][0].text = personInfoModel.Business.IMInfo.NickName;
    self.dataArray[1][1].text = personInfoModel.Business.IMInfo.PersonRemark;
    self.dataArray[1][2].text = personInfoModel.Business.IMInfo.TrueName;
    self.dataArray[1][3].text = personInfoModel.Business.IMInfo.PCDName;
    self.dataArray[1][4].text = personInfoModel.Business.IMInfo.Address;
    self.dataArray[1][5].text = personInfoModel.Business.IMInfo.GPSAddress;
    self.dataArray[1][6].text = personInfoModel.Business.IMInfo.PersonQQ;
    self.dataArray[1][7].text = personInfoModel.Business.IMInfo.PersonWeiXin;
    self.dataArray[1][8].text = personInfoModel.Business.IMInfo.PersonAlipay;
    
    self.dataArray[2][0].text = personInfoModel.Business.IMInfo.PersonBank;
    self.dataArray[2][1].text = personInfoModel.Business.IMInfo.PersonBankCardNo;
    self.dataArray[2][2].text = personInfoModel.Business.IMInfo.PersonBankName;
    
    [self.dataArray.lastObject.lastObject.spareArray addObjectsFromArray: [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:personInfoModel.Business.IMInfo.Images].copy];
}

-(void)getGetUserWithById:(NSString *)byId Success:(void (^)(DYJXUserInfoModel * _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:byId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_user_GetUserById params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                DYJXUserInfoModel *userInfoModel = [DYJXUserInfoModel modelWithJSON:responseObject[@"Result"]];
                //TODO: 数据请求成功数据重组到数组中
                [weakSelf setContentsWithPersonInfoModel:userInfoModel];
                weakSelf.personInfoModel = userInfoModel;
                success(userInfoModel);
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



-(void)uploadUserWithContactType:(ContactType)type success:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:userModel.UserID forKey:@"CertificateId"];
    [parameters setObject:userModel.ClientId forKey:@"ClientId"];
    [parameters setObject:@"iOS" forKey:@"Device"];
    [parameters setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [parameters setObject:userModel.MemberID forKey:@"MemberID"];
    [parameters setObject:userModel.UserID forKey:@"UserID"];
    NSString *url;
    switch (type) {
        case ContactType_Normal:
            [YDBAlertView showToast:@"请选择联系人关系" dismissDelay:1.0];
            return;
            break;
        case ContactType_Friend:
            url = kDYJXAPI_user_AddFriendApply;
            [parameters setObject:[self getAddFriendParameters] forKey:@"Data"];
            break;
        case ContactType_Ordinary:
            url = kDYJXAPI_user_AddUAUserContact;
            [parameters setObject:[self getDataParameters] forKey:@"Data"];
            break;
        case ContactType_Black:
            url = kDYJXAPI_user_AddToBlacklist;
            [parameters setObject:@{@"BelongBlackUserEnterprise":self.personInfoModel.Id,@"BlackUserId":self.personInfoModel.Id} forKey:@"Data"];
            break;
        case ContactType_Delete:
            url = kDYJXAPI_user_DelContact;
            [parameters setObject:@{@"Id":self.personInfoModel.Id,@"isSelect":@(false)} forKey:@"Data"];
            break;
        default:
            break;
    }
    [self uploadUserOrdinaryWithURL:url params:parameters success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                !success ?: success(responseObject);
            }else {
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else {
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } failed:^(NSString *errMsg) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

- (void)uploadUserOrdinaryWithURL:(NSString *)url params:(NSMutableDictionary *)params success:(void (^)(id responseObject))success failed:(void (^)(NSString * errMsg))fail {
    
    [XYNetWorking XYPOST:url params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ?: success(responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        !fail ?: fail(@"连接异常");
    }];
}

- (NSDictionary *)getAddFriendParameters {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:@"" forKey:@"ApplyContent"];
    [parameters setObject:@(0) forKey:@"ApplyType"];
    [parameters setObject:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID forKey:@"FromBelongEnterprise"];
    [parameters setObject:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID forKey:@"MemberIDFrom"];
    [parameters setObject:self.personInfoModel.Id forKey:@"MemberIDTo"];
    [parameters setObject:self.personInfoModel.Id forKey:@"ToBelongEnterprise"];
    return parameters;
}

- (NSDictionary *)getDataParameters {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:self.personInfoModel.Id forKey:@"BindUserId"];
    [parameters setObject:self.personInfoModel.Id forKey:@"ContactEnterprise"];
    [parameters setObject:@(false) forKey:@"isSelect"];
    return parameters;
}

-(NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)dataArray {
    if (!_dataArray) {
        NSString *path;
        _dataArray = [[NSMutableArray alloc]init];
        path = [[NSBundle mainBundle] pathForResource:@"DYJXContactDetails.json" ofType:nil];
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
