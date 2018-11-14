//
//  DYJXConversionViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXConversionViewModel.h"
#import "DYJXIdentitySwitchingModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DYJXConversionViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableArray<DYJXIdentitySwitchingModel*> *dataArray;
@end

@implementation DYJXConversionViewModel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
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
- (void)getMyConversionDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];

    [XYNetWorking XYPOST:kDYJXAPI_user_Conversations params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                NSArray *resultArray = [NSArray modelArrayWithClass:[DYJXIdentitySwitchingModel class] json:[responseObject objectForKey:@"Result"]];
                
                [resultArray enumerateObjectsUsingBlock:^(DYJXIdentitySwitchingModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.dataArray addObject:obj];
                    if (obj.Children.count > 0) {
                        [weakSelf.dataArray addObjectsFromArray:obj.Children];
                    }
                    
                }];
                
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
@end
