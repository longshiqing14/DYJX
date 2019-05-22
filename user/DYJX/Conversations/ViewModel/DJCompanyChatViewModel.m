//
//  DJCompanyChatViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJCompanyChatViewModel.h"


#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DJCompanyChatViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> *dataArray;
@end

@implementation DJCompanyChatViewModel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (NSString *)GroupName:(NSIndexPath *)indexPath
{
    if (self.dataArray[indexPath.section].Children) {
        return self.dataArray[indexPath.section].Children[indexPath.row].GroupName;
        
    }else{
        return self.dataArray[indexPath.section].GroupName;
    }
    
}

- (NSString *)GroupNumberString:(NSIndexPath *)indexPath
{
    if (self.dataArray[indexPath.section].Children) {
        return self.dataArray[indexPath.section].Children[indexPath.row].NumberString;
        
    }else{
        return self.dataArray[indexPath.section].NumberString;
    }
    
}

- (NSString *)iconImageUrl:(NSIndexPath *)indexPath
{
    if (self.dataArray[indexPath.section].Children) {
        return self.dataArray[indexPath.section].Children[indexPath.row].GroupHeadImg;

    }else{
        return self.dataArray[indexPath.section].GroupHeadImg;

    }
}

- (NSString *)isQuanYuan:(NSIndexPath *)indexPath
{
    if (self.dataArray[indexPath.section].Children) {

        if (self.dataArray[indexPath.section].Children[indexPath.row].IsPart) {
            return @"子公司";
        }else{
            return @"全员";
        }
        
    }else{
        if (self.dataArray[indexPath.section].IsPart) {
            return @"子公司";
        }else{
            return @"全员";
        }
        
    }
}

- (NSString *)isAdmin:(NSIndexPath *)indexPath
{
    if (self.dataArray[indexPath.section].Children) {
        
        if ([self.dataArray[indexPath.section].Children[indexPath.row].AdminUserIds containsObject:self.dataArray[indexPath.section].Children[indexPath.row].OwnerId]) {
            return @"管理员";
        }else{
            return @"参与者";
        }
    }else{
        if ([self.dataArray[indexPath.section].AdminUserIds containsObject:self.dataArray[indexPath.section].OwnerId]) {
            return @"管理员";
        }else{
            return @"参与者";
        }
    }
}

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

//- (NSInteger)numberOfCell:(NSInteger)section{
//    return self.dataArray[section].Children.count;
//}

- (NSInteger)numberOfCell:(NSInteger)section{
    if (self.dataArray[section].Children) {
        return self.dataArray[section].Children.count;

    }else{
        return 1;
    }
}

- (NSString *)sectionHeaderGroupName:(NSInteger )section{
    return self.dataArray[section].GroupName;
}
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section{
    return self.dataArray[section].NumberString;
}
- (NSString *)sectionHeadericonImageUrl:(NSIndexPath* )indexPath{
    if (self.dataArray[indexPath.section].Children) {
        return self.dataArray[indexPath.section].Children[indexPath.row].GroupHeadImg;
        
    }else{
        return self.dataArray[indexPath.section].GroupHeadImg;
        
    }
}

- (NSMutableArray<DYJXXYResult*> *)getRefundReasonsArray{
    return self.dataArray;
}

//获取子公司、参与公司 信息
- (void)getMyGroupsDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;

    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:userModel.MemberID forKey:@"MemberID"];
    [self.requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [self.requestDic setObject:@"1" forKey:@"GroupType"];
    [XYNetWorking XYPOST:kDYJXAPI_user_MyGroups params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                
                self.dataArray = [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                
                __block NSMutableArray<DYJXXYResult *> *tempArray = [self.dataArray mutableCopy];
                [tempArray enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

                        [weakSelf.dataArray[idx].Children insertObject:obj atIndex:0];

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

- (NSMutableArray<DYJXXYResult *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end

