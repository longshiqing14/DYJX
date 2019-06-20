//
//  DYJXGroupViewModel.m
//  user
//
//  Created by 岩  熊 on 2019/5/5.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXGroupViewModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"PageSize"
#define kStartPageIndex 1

@interface DYJXGroupViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,assign) BOOL HasNextPage;
@end

@implementation DYJXGroupViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.HasNextPage = true;
    }
    return self;
}

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

- (NSString *)sectionHeaderGroupNumber:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.section].GroupNumber;
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
//- (NSString *)sectionHeaderGroupNumber:(NSInteger )section{
//    return self.dataArray[section].GroupNumber;
//}

- (NSString *)sectionHeadericonImageUrl:(NSInteger )section{
    return self.dataArray[section].GroupHeadImg;
}


- (void)getMyWildGroupsDataWithPageNumer:(NSInteger)pageNumber Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [self.requestDic setObject:userModel.UserID forKey:@"UserID"];
    [self.requestDic setObject:@"iOS" forKey:@"Device"];
    [self.requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [self.requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [self.requestDic setObject:userModel.MemberID forKey:@"MemberID"];
    [self.requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [self.requestDic setObject:@50 forKey:@"PageSize"];
    [self.requestDic setObject:@(pageNumber) forKey:@"PageIndex"];
    [self.requestDic setObject:@"2" forKey:@"GroupType"];
    
    [XYNetWorking XYPOST:kDYJXAPI_SearchGroups params:self.requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                
                if ( pageNumber > 1) {
                    
                    if (self.HasNextPage){
                        [self.dataArray addObjectsFromArray: [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy]];
                        
                    }else{
                        [YDBAlertView showToast:@"无更多新数据！" dismissDelay:1.0];
                    }
                    self.HasNextPage = [[responseObject objectForKey:@"HasNextPage"] boolValue];
                }else{
                    [self.dataArray removeAllObjects];
                    self.dataArray = [[NSArray modelArrayWithClass:[DYJXXYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                }
                
          
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

- (void)refreshDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))failed {
    NSInteger pageNumber = kStartPageIndex;
    self.pageNum = pageNumber;
    [self getMyWildGroupsDataWithPageNumer:self.pageNum Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getMyWildGroupsDataWithPageNumer:self.pageNum Success:success failed:failed];
}

- (NSMutableArray<DYJXXYResult *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end

