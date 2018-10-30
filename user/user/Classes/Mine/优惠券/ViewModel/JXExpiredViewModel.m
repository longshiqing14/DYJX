//
//  JXExpiredViewModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXExpiredViewModel.h"
#import "JXCouponBaseModel.h"
#import "JXCouponDetailModel.h"

@interface JXExpiredViewModel ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, copy) NSMutableArray<JXCouponDetailModel*> *dataListArry;
@end

@implementation JXExpiredViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.pageNum = kStartPageIndex;
    }
    return self;
}

//- (NSString *)productName:(NSIndexPath *)indexPath{
//    return self.dataListArry[indexPath.row].packageName;
//}
//- (NSString *)productPrice:(NSIndexPath *)indexPath{
//    return @"1128.99";
//}
//- (NSString *)productImageUrl:(NSIndexPath *)indexPath{
//    return self.dataListArry[indexPath.row].comboPicture;
//}
//- (NSString *)productStatus:(NSIndexPath *)indexPath{
//    return self.dataListArry[indexPath.row].orderStatus;
//}
//- (NSString *)productTime:(NSIndexPath *)indexPath{
//    return self.dataListArry[indexPath.row].orderDate;
//}
//- (NSString *)productOrderNum:(NSIndexPath *)indexPath{
//    return self.dataListArry[indexPath.row].orderCode;
//}

- (NSInteger)numberOfCell{
    return self.dataListArry.count;
}

- (NSMutableArray<JXCouponDetailModel*>*)getJXCouponDataLiat{
    return self.dataListArry;
}

- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL isHaveData))success failed:(void(^)(NSString *errorMsg))failed{
    [self getMyExtensoinListWithPageNumer:kStartPageIndex Success:success failed:failed];
    
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL isHaveData))success failed:(void(^)(NSString *errorMsg))failed{
    self.pageNum = self.pageNum + 1;
    [self getMyExtensoinListWithPageNumer:self.pageNum Success:success failed:failed];
    
}

- (void)getMyExtensoinListWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    [SVProgressHUD dismiss];
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    [self.requestDic setValue:@"exipred" forKey:@"type"];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productGetCouponList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];

                if (pageNumber == 1) {
                    JXCouponBaseModel *model = [JXCouponBaseModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                    [self.dataListArry removeAllObjects];
//                    self.dataListArry = [model.couponList mutableCopy];
                    [self.dataListArry addObjectsFromArray:model.couponList];
                }else{
                    JXCouponBaseModel *model = [JXCouponBaseModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                    // self.dataListArry = [model.couponList mutableCopy];
                    [self.dataListArry addObjectsFromArray:model.couponList];
                }
                
                BOOL isHaveData = self.dataListArry.count;
                success(nil,isHaveData);
                
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

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (NSMutableArray<JXCouponDetailModel *> *)dataListArry{
    if (!_dataListArry) {
        _dataListArry = [NSMutableArray array];
    }
    return _dataListArry;
}
@end
