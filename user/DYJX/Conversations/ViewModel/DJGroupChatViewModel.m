//
//  DJGroupChatViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJGroupChatViewModel.h"
#import "DYJXXYResult.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DJGroupChatViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> *dataArray;
@end

@implementation DJGroupChatViewModel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (NSString *)GroupName:(NSIndexPath *)indexPath
{
    
    return self.dataArray[indexPath.section].Children[indexPath.row].GroupName;
}

- (NSString *)GroupNumberString:(NSIndexPath *)indexPath
{
    
    return self.dataArray[indexPath.section].NumberString;
}

- (NSString *)iconImageUrl:(NSIndexPath *)indexPath
{
    return self.dataArray[indexPath.section].Children[indexPath.row].GroupHeadImg;
}

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

//- (NSInteger)numberOfCell:(NSInteger)section{
//    return self.dataArray[section].Children.count;
//}

- (NSInteger)numberOfCell:(NSInteger)section{
    return self.dataArray[section].Children.count;
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

- (void)getMyCompanyAndGroupDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:userModel.MemberID forKey:@"MemberID"];
    [self.requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [XYNetWorking XYPOST:kDYJXAPI_user_MyCompanyAndGroup params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                [self.dataArray removeAllObjects];
                self.dataArray = [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                
               __block NSMutableArray<DYJXXYResult *> *tempArray = [self.dataArray mutableCopy];
                [tempArray enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.dataArray[idx].Children insertObject:obj atIndex:0];
                }];
                self.dataArray = [tempArray mutableCopy];
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
