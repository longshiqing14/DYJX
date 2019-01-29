//
//  DYJXComparePage.m
//  user
//
//  Created by longshiqing on 2019/1/29.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "DYJXComparePage.h"
#import "JSExtension.h"
#import "XYNetWorking.h"
#import "XYAppDotNetAPIClient.h"
#import "XYBestAllNet.h"
#import "GSCCListCompareItem.h"
#import "HeadSearchView.h"

@interface DYJXComparePage ()

@property (nonatomic, strong)NSMutableArray <GSCCListCompareItem *> *listArray;
@property (nonatomic, strong)HeadSearchView *headView;

@end

@implementation DYJXComparePage

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    [self getCompareData];

    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"比价";

}


- (void)getCompareData {
    WeakSelf;
    //    [XYProgressHUD show];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setValue:[[JSExtension shared] myClientId] forKey:@"ClientId"];
    [requestDic setValue:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setValue:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setValue:[[JSExtension shared] myIdentityId] forKey:@"CertificateId"];
    [requestDic setValue:@"iOS" forKey:@"Device"];
    [requestDic setValue:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];

    AFHTTPSessionManager *manager = [XYNetWorking managerWithBaseURL:nil sessionConfiguration:NO];
    manager.requestSerializer.timeoutInterval = 60.f;
//    NSLog(@"%@",[NSString stringWithFormat:@"\n url:%@ -----\n"]);
    [manager POST:[BEST_COMPARA stringByAppendingString:@"CompareIndex"] parameters:requestDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"ListCompareItem"]) {
            self.listArray = [[NSArray modelArrayWithClass:[GSCCListCompareItem class] json:[responseObject objectForKey:@"ListCompareItem"]] mutableCopy];
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


-(NSMutableArray<GSCCListCompareItem *> *)listArray {
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
@end
