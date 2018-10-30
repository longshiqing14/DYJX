//
//  JXRefundViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/4/8.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundViewModel.h"

@interface JXRefundViewModel ()
@property(nonatomic ,strong ) NSMutableArray<JXRefundReasonsDeatailModel*> *reasonsDataArray;
@property(nonatomic ,strong )NSMutableArray<NSArray*> *dataArray;
@end

@implementation JXRefundViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray arrayWithObjects:@[@"退款原因",@"问题描述",@"上传图片（最多8张）"],@[@"联系人：",@"联系电话：",@"请选择地址"], nil];
    }
    return self;
}

-(NSInteger)numberOfCells{
    return self.dataArray.count;
}

-(NSInteger)numberOfCellsWithSection:(NSInteger)section{
    return self.dataArray[section].count;
}

- (NSString *)contentWithIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.section][indexPath.row];
}

-(NSMutableArray<JXRefundReasonsDeatailModel*>*)getRefundReasonsArray{
    return self.reasonsDataArray;
}

- (void)GetRefundCashDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_xplServicesRefundReasons request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            [XYProgressHUD svHUDDismiss];

            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                JXRefundReasonsModel *model = [JXRefundReasonsModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                weakSelf.reasonsDataArray = [model.reasonList mutableCopy];
                success(nil,nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
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

- (void)GetRefundTextSuccess:(void(^)(JXRefundTextModel *model))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderRefundText request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];
                JXRefundTextModel *model = [JXRefundTextModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                success(model);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
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


//提交退货申请单
- (void)upLoadRefundData:(BOOL)isFirst Success:(void(^)(NSString *refundId))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    NSMutableDictionary * dict = nil;
    if (isFirst) {
        dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_xplServicesOrderRefund request_data:self.requestDic];
    }else{
        dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_xplServicesRepeatOrderRefund request_data:self.requestDic];
    }
    
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                NSDictionary *refundData = [responseObject objectForKey:RETURN_DATA_];
                if ((NSNull *)refundData == [NSNull null]) {
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
                }else{
                    success([refundData objectForKey:@"refundId"]);
                    [XYProgressHUD svHUDDismiss];
                }

            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
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


- (NSMutableArray<NSArray*> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
        
    }
    return _dataArray;
}

- (NSMutableArray<JXRefundReasonsDeatailModel*> *)reasonsDataArray{
    if (!_reasonsDataArray) {
        _reasonsDataArray = [NSMutableArray arrayWithCapacity:50];
        
    }
    return _reasonsDataArray;
}


- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}
@end
