//
//  DYJXCompanyInfoDetailViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXCompanyInfoDetailViewModel.h"

@interface DYJXCompanyInfoDetailViewModel()
@property(nonatomic, strong) DYJXXYGroupByIdResponse *groupByIdModel;
@end

@implementation DYJXCompanyInfoDetailViewModel
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

//获取公司信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
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
                
                weakSelf.groupByIdModel = [DYJXXYGroupByIdResponse modelWithJSON:[responseObject objectForKey:@"Result"]];
                success(weakSelf.groupByIdModel);
                
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


- (void)initData{
    self.dataArray = [@[@[@"个人头像和二维码：",@"公司名称：",@"公司简称：",@"公司商号：",@"公司成员：",@"子公司：",@"非管理员不能发言",@"不能通过搜索或扫描找到本商号"],@[@"公司统一社会信用代码：",@"公司地址：",@"公司所属街道门牌号：",@"公司GPS位置：",@"公司座机："],@[@"公司联系人：",@"公司联系人手机：",@"公司联系人QQ：",@"公司联系人微信：",@"公司网站：",@"公司邮箱：",@"公司介绍："],@[@"公司微信：",@"公司支付宝：",@"公司银行账号：",@"公司银行账号名称：",@"公司银行账号开户行："],@[@"添加您的名片或营业执照照片"]] mutableCopy];
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

- (DYJXXYGroupByIdResponse *)groupByIdModel{
    if (!_groupByIdModel) {
        _groupByIdModel = [[DYJXXYGroupByIdResponse alloc]init];
    }
    return _groupByIdModel;
}
@end
