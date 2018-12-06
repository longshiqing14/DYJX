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
- (instancetype)init{
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

- (NSInteger)numberOfCell:(NSInteger)section{
    return self.dataArray[section].count;
}

- (NSString *)content:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.section][indexPath.row];
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

- (void)initData{
    self.dataArray = [@[@[@"个人头像和二维码",@"请输入商号",@"电话号码"],@[@"请输入用户名",@"请输入个性签名",@"请输入真实姓名",@"请选择所属省市区",@"请填写街道门牌地址信息",@"请设置GPS定位",@"请输入QQ号",@"请输入微信号",@"请输入支付宝账号"],@[@"请输入个人银行开户行",@"请输入个人银行账号",@"请输入个人银行账户名称"],@[@"添加您的名片或营业执照照片"]] mutableCopy];
}

- (NSMutableArray<NSArray<NSString*>*>*)dataArray{
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

- (DYJXUserInfoModel *)personInfoModel{
    if (!_personInfoModel) {
        _personInfoModel = [[DYJXUserInfoModel alloc]init];
    }
    return _personInfoModel;
}
@end
