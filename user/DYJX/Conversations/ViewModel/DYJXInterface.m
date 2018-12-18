//
//  DYJXInterface.m
//  user
//
//  Created by longshiqing on 2018/11/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXInterface.h"
#import "XYNetWorking.h"
#import "XYBaseModel.h"
#import "YDBAlertView.h"
#import "YDBAlertView.h"
#import "JSExtension.h"

@implementation DYJXInterface


- (void)getLasterContractsNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
//    [XYProgressHUD show];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setValue:[[JSExtension shared] myClientId] forKey:@"ClientId"];
    [requestDic setValue:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setValue:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setValue:[[JSExtension shared] myIdentityId] forKey:@"CertificateId"];
    [requestDic setValue:@"iOS" forKey:@"Device"];
    [requestDic setValue:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];

    [requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:@"page"];
    [requestDic setValue:[NSString stringWithFormat:@"%ld",(long)100] forKey:@"page_size"];

//    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:@"Conversations" request_data:requestDic];

    [XYNetWorking XYPOST:@"Conversations" params:requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
//        [XYProgressHUD svHUDDismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            self.lasterList = [DYJOLatestListModel mj_objectWithKeyValues:responseObject];
            self.lasterList.Result = [NSArray modelArrayWithClass:[DYJOResult class] json:[responseObject objectForKey:@"Result"]];
            success(YES,YES);
        }
        else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        [XYProgressHUD svHUDDismiss];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}


#pragma mark - Model
-(DYJOLatestListModel *)lasterList {
    if (!_lasterList) {
        _lasterList = [[DYJOLatestListModel alloc] init];
    }
    return _lasterList;
}


@end
