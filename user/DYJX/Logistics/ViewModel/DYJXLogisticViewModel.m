//
//  DYJXLogisticViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLogisticViewModel.h"
#import "DYJXLogisticModel.h"

@interface DYJXLogisticViewModel()
@property (nonatomic, strong)NSMutableArray<DYJXLogisticDetailModel*> *responseResultArray;
@property (nonatomic, strong)NSMutableArray<DYJXLogisticDetailModel*> *firstSectionResultArray;
@property (nonatomic, strong)NSMutableArray<DYJXLogisticDetailModel*> *secondSectionResultArray;
@property (nonatomic, strong)NSMutableArray<NSMutableArray<DYJXLogisticDetailModel *> *> * resultArray;
@end

@implementation DYJXLogisticViewModel

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}


- (NSMutableArray<DYJXLogisticDetailModel *> *)responseResultArray{
    if (!_responseResultArray) {
        _responseResultArray = [NSMutableArray array];
    }
    return _responseResultArray;
}

- (NSMutableArray<DYJXLogisticDetailModel *> *)firstSectionResultArray{
    if (!_firstSectionResultArray) {
        _firstSectionResultArray = [NSMutableArray array];
    }
    return _firstSectionResultArray;
}

- (NSMutableArray<DYJXLogisticDetailModel *> *)secondSectionResultArray{
    if (!_secondSectionResultArray) {
        _secondSectionResultArray = [NSMutableArray array];
    }
    return _secondSectionResultArray;
}

- (NSMutableArray<NSMutableArray<DYJXLogisticDetailModel *> *>*)resultArray{
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (NSString*)itemName:(NSIndexPath*)indexpath{
    return self.resultArray[indexpath.section][indexpath.row].Name;
}

- (NSInteger)numberOfSection{
//    if (self.secondSectionResultArray.count>1) {
//            return 2;
//    }else{
//        return 1;
//    }
    return self.resultArray.count;
}

- (NSInteger)numberOfCellectionItem:(NSInteger)section{
    return self.resultArray[section].count;
}

//获取用户信息
- (void)getMyAppsSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_MyApps params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
              self.responseResultArray = [NSMutableArray arrayWithArray:[NSArray modelArrayWithClass:[DYJXLogisticDetailModel class] json:[responseObject objectForKey:@"Result"]]];
                
                [self.responseResultArray enumerateObjectsUsingBlock:^(DYJXLogisticDetailModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj.Name isEqualToString:@"xttlc"]) {
                        [weakSelf.firstSectionResultArray addObject:obj];
                    }
                    if ([obj.Name isEqualToString:@"compare"]) {
                        [weakSelf.firstSectionResultArray addObject:obj];
                    }
                    if ([obj.Name isEqualToString:@"numberMarket"]) {
                        [weakSelf.firstSectionResultArray addObject:obj];
                        DYJXLogisticDetailModel *walletObj = [[DYJXLogisticDetailModel alloc]init];
                        walletObj.Name = @"wallet";
                        [weakSelf.firstSectionResultArray addObject:walletObj];
                    }
                    
                }];
                
                [self.responseResultArray enumerateObjectsUsingBlock:^(DYJXLogisticDetailModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ((![obj.Name isEqualToString:@"xttlc"]) && (![obj.Name isEqualToString:@"compare"]) && ![obj.Name isEqualToString:@"numberMarket"]) {
                        [weakSelf.secondSectionResultArray addObject:obj];
                    }
                    
                }];
                
                
                [weakSelf.resultArray addObject:weakSelf.firstSectionResultArray];
                [weakSelf.resultArray addObject:weakSelf.secondSectionResultArray];
                success();
                
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

@end
