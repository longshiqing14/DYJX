//
//  DJGroupChatWildGroupsViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJGroupChatWildGroupsViewModel.h"
#import "DYJXXYResult.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DJGroupChatWildGroupsViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> *dataArray;
@end

@implementation DJGroupChatWildGroupsViewModel
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
    
    return self.dataArray[indexPath.section].NumberString;
}

- (NSString *)iconImageUrl:(NSIndexPath *)indexPath
{
    return self.dataArray[indexPath.row].GroupHeadImg;
}

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

- (void)getMyWildGroupsDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:userModel.MemberID forKey:@"MemberID"];
    [self.requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [self.requestDic setObject:@1 forKey:@"Data"];

    [XYNetWorking XYPOST:kDYJXAPI_user_MyWildGroups params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                [self.dataArray removeAllObjects];
                self.dataArray = [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
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

- (NSMutableArray<DYJXXYResult *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
