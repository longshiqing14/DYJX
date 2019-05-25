//
//  DYJXUserInfoDetailViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXUserInfoDetailViewModel.h"

@interface DYJXUserInfoDetailViewModel()
@property(nonatomic, strong) DYJXUserInfoModel *personInfoModel;
@end

@implementation DYJXUserInfoDetailViewModel

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

- (NSInteger)numberOfCell:(NSInteger)section{
    return self.dataArray[section].count;
}

- (NSString *)content:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.section][indexPath.row].placeholder;
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
        [formData appendPartWithFileData:data
                                name:@"file"
                                fileName:@"name.png"
                                mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        NSLog(@"上传成功");
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"上传失败%@",error);
     
    }];
}

//获取用户信息
- (void)getUserInfoSuccess:(void(^)(DYJXUserInfoModel*))success failed:(void(^)(NSString *errorMsg))fail{
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
//            [weakSelf.dataArray removeAllObjects];
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                
                weakSelf.personInfoModel = [DYJXUserInfoModel modelWithJSON:[responseObject objectForKey:@"Result"]];
                [weakSelf setContentsWithPersonInfoModel:weakSelf.personInfoModel];
                success(weakSelf.personInfoModel);
                
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

//提交个人信息
- (void)CommitUserInfoSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic  setObject:userModel.UserID forKey:@"CertificateId"];
    [self.requestDic  setObject:userModel.UserID forKey:@"Id"];
    [self.requestDic  setObject:@"iOS" forKey:@"Device"];
    [self.requestDic  setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic  setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic  setObject:userModel.MemberID forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_UpdateIMUserInfo params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            DJJXResponModel *responseModel = [DJJXResponModel mj_objectWithKeyValues:responseObject];
            responseModel.Result = [NSArray modelArrayWithClass:[DJJXResult class] json:responseModel.Result];
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                
                success();
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
                
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

//（子）公司所属省市
- (void)getProvincesWithSuccess:(void (^)(DYJXAddressModel * _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [XYNetWorking XYPOST:kDYJXAPI_user_GetProvinces params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ?: success([DYJXAddressModel parse:responseObject]);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        !fail ?: fail(@"连接异常");
    }];
}

- (NSDictionary *)getUpDataParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    if (self.dataArray[1][0].text.length > 0) {
        [parameters setObject:self.dataArray[1][0].text forKey:@"NickName"];
    }
    if (self.dataArray[1][1].text.length > 0) {
        [parameters setObject:self.dataArray[1][1].text forKey:@"PersonRemark"];
    }
    if (self.dataArray[1][2].text.length > 0) {
        [parameters setObject:self.dataArray[1][2].text forKey:@"TrueName"];
    }
    if (self.dataArray[1][3].text.length > 0) {
        [parameters setObject:self.dataArray[1][3].text forKey:@"PCDName"];
    }
    if (self.dataArray[1][4].text.length > 0) {
        [parameters setObject:self.dataArray[1][4].text forKey:@"Address"];
    }
    if (self.dataArray[1][5].text.length > 0) {
        [parameters setObject:self.dataArray[1][5].text forKey:@"GPSAddress"];
    }
    if (self.dataArray[1][6].text.length > 0) {
        [parameters setObject:self.dataArray[1][6].text forKey:@"PersonQQ"];
    }
    if (self.dataArray[1][7].text.length > 0) {
        [parameters setObject:self.dataArray[1][7].text forKey:@"PersonWeiXin"];
    }
    if (self.dataArray[1][8].text.length > 0) {
        [parameters setObject:self.dataArray[1][8].text forKey:@"PersonAlipay"];
    }
    if (self.dataArray[2][0].text.length > 0) {
        [parameters setObject:self.dataArray[2][0].text forKey:@"PersonBank"];
    }
    if (self.dataArray[2][1].text.length > 0) {
        [parameters setObject:self.dataArray[2][1].text forKey:@"PersonBankCardNo"];
    }
    if (self.dataArray[2][2].text.length > 0) {
        [parameters setObject:self.dataArray[2][2].text forKey:@"PersonBankName"];
    }

    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    [self.dataArray.lastObject.lastObject.spareArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dataArray addObject:((LPXPhotoModel *)obj).photo];
    }];
    [parameters setObject:[[PersonZhiZhaoModel  mj_keyValuesArrayWithObjectArray:(dataArray ?: @[])] mj_JSONString] forKey:@"Images"];
//    [parameters setObject:[[PersonZhiZhaoModel  mj_keyValuesArrayWithObjectArray:(self.dataArray.lastObject.lastObject.spareArray ?: @[])] mj_JSONString]  forKey:@"Images"];
    return parameters;
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
    NSArray *spareArray = [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:personInfoModel.Business.IMInfo.Images].copy;
    [spareArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LPXPhotoModel *photoModel = [[LPXPhotoModel alloc]init];
        photoModel.photo = obj;
        [self.dataArray.lastObject.lastObject.spareArray addObject:photoModel];
    }];
//    [self.dataArray.lastObject.lastObject.spareArray addObjectsFromArray: [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:personInfoModel.Business.IMInfo.Images].copy];
}

- (NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DYJXUserInfoDetail.json" ofType:nil];
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

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (DYJXUserInfoModel *)personInfoModel{
    if (!_personInfoModel) {
        _personInfoModel = [[DYJXUserInfoModel alloc]init];
    }
    return _personInfoModel;
}
@end
