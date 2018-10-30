//
//  JXSelectDeliverToShopViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXSelectDeliverToShopViewModel.h"
#import "JXSelectAdressListModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface JXSelectDeliverToShopViewModel()

@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) NSMutableArray<JXAdressModel*> *dataListArry;
@end

@implementation JXSelectDeliverToShopViewModel
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    [self.requestDic setValue:@"10" forKey:kRequestPageSize];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_warehouseGetList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL isLastPage = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];
                
                if (pageNumber == 1) {
                    JXSelectAdressListModel *model=[JXSelectAdressListModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                    NSLog(@"%lu",(unsigned long)model.warehouseList.count);


                    [self.dataListArry removeAllObjects];
                    [self.dataListArry addObjectsFromArray:model.warehouseList];
                    
                }else{
                    JXSelectAdressListModel *model=[JXSelectAdressListModel modelWithJSON:[responseObject valueForKey:RETURN_DATA_]];
                    if (model.warehouseList.count == 0) {
                        isLastPage = YES;
                    }else{
                        isLastPage = NO;
                    }
                    [self.dataListArry addObjectsFromArray:model.warehouseList];
                }
                
                BOOL isHaveData = self.dataListArry.count;
                success(isLastPage,isHaveData,weakSelf.dataListArry);
                
            }
            
        }else{
             [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
            fail(error.localizedDescription);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
         [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        fail(error.localizedDescription);
    }];
    
}

- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = kStartPageIndex;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

- (NSMutableArray<JXAdressModel *> *)dataListArry{
    if (!_dataListArry) {
        _dataListArry = [NSMutableArray array];
    }
    return _dataListArry;
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}
@end
