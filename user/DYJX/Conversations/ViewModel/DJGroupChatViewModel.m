//
//  DJGroupChatViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJGroupChatViewModel.h"

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
    if (indexPath.section + 1 <= self.innerGroupdataArray.count) {
      return self.innerGroupdataArray[indexPath.section].Children[indexPath.row].GroupName;
    }else{
      return self.wildGroupdataArray[indexPath.row].GroupName;
    }
}

- (NSString *)GroupId:(NSIndexPath *)indexPath
{
    if (indexPath.section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[indexPath.section].Children[indexPath.row].Id ? self.innerGroupdataArray[indexPath.section].Children[indexPath.row].Id : @"";
    }else{
        return self.wildGroupdataArray[indexPath.row].Id ? self.wildGroupdataArray[indexPath.row].Id : @"";
    }
}

- (NSString *)GroupNumberString:(NSIndexPath *)indexPath
{
    if (indexPath.section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[indexPath.section].Children[indexPath.row].NumberString;
    }else{
        return self.wildGroupdataArray[indexPath.row].NumberString;
    }
}

- (NSString *)iconImageUrl:(NSIndexPath *)indexPath
{
    if (indexPath.section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[indexPath.section].Children[indexPath.row].GroupHeadImg;
    }else{
        return self.wildGroupdataArray[indexPath.row].GroupHeadImg;
    }
}

- (NSInteger)numberOfSection{
    if (self.dataArray.count == 0) {
        return 0;
    }
    if (self.wildGroupdataArray.count >0) {
        return self.innerGroupdataArray.count + 1;
    }else {
        return self.innerGroupdataArray.count + 0;
    }

}

//- (NSInteger)numberOfCell:(NSInteger)section{
//    return self.dataArray[section].Children.count;
//}

- (NSInteger)numberOfCell:(NSInteger)section{
    if (section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[section].Children.count;
    }else{
        return self.wildGroupdataArray.count;
    }
}

- (NSString *)sectionHeaderGroupName:(NSInteger )section{
    if (section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[section].GroupName;
    }else{
        return self.wildGroupdataArray[section].GroupName;
    }
}
- (NSString *)sectionHeaderGroupNumberString:(NSInteger )section{
    if (section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[section].NumberString;
    }else{
        return self.wildGroupdataArray[section].NumberString;
    }
}
- (NSString *)sectionHeadericonImageUrl:(NSInteger )section{
    if (section + 1 <= self.innerGroupdataArray.count) {
        return self.innerGroupdataArray[section].GroupHeadImg;
    }else{
        return self.wildGroupdataArray[section].GroupHeadImg;
    }
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
                [weakSelf.dataArray removeAllObjects];
                [weakSelf.innerGroupdataArray removeAllObjects];
                [weakSelf.wildGroupdataArray removeAllObjects];
                self.dataArray = [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                
               __block NSMutableArray<DYJXXYResult *> *tempArray = [self.dataArray mutableCopy];
                [tempArray enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (weakSelf.dataArray[idx].Children.count > 0) {
                        [weakSelf.innerGroupdataArray addObject:obj];
                    }else{
                        [weakSelf.wildGroupdataArray addObject:obj];
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

- (NSMutableArray<DYJXXYResult *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray<DYJXXYResult *> *)innerGroupdataArray{
    if (!_innerGroupdataArray) {
        _innerGroupdataArray = [NSMutableArray array];
    }
    return _innerGroupdataArray;
}

- (NSMutableArray<DYJXXYResult *> *)wildGroupdataArray{
    if (!_wildGroupdataArray) {
        _wildGroupdataArray = [NSMutableArray array];
    }
    return _wildGroupdataArray;
}

@end
