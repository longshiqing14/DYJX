//
//  DYJXIdentitySwitchingViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingViewModel.h"
#import "DYJXIdentitySwitchingModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface DYJXIdentitySwitchingViewModel()
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic, strong) DYJXIdentitySwitchingModel *resultModel;
@end
@implementation DYJXIdentitySwitchingViewModel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (DYJXIdentitySwitchingModel *)resultModel{
    if (!_resultModel) {
        _resultModel = [[DYJXIdentitySwitchingModel alloc]init];
    }
    return _resultModel;
}
//
//- (NSString *)goodsName:(NSIndexPath *)indexPath
//{
//    
//    return self.dataArray[indexPath.row].productName;
//}
//
//- (NSString *)sellingPointText:(NSIndexPath *)indexPath
//{
//    
//    return self.goodsListArray[indexPath.row].sellingPointText;
//}
//
//- (NSString *)goodsPrice:(NSIndexPath *)indexPath
//{
//    return self.goodsListArray[indexPath.row].memberPrice;
//}
//
//- (NSString *)productID:(NSIndexPath *)indexPath
//{
//    return self.goodsListArray[indexPath.row].productId;
//}
//
//- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath
//{
//    
//    return self.goodsListArray[indexPath.row].logo;
//}
//
//- (NSArray *)goodsLable:(NSIndexPath *)indexPath
//{
//    
//    return self.goodsListArray[indexPath.row].lable;
//}
//
//- (NSString *)listShowTile
//{
//    
//    return self.SearchReusltListModel.activeCard.firstObject.listShowTile;
//}
//
//- (NSInteger)numberOfCell{
//    return self.dataArray.count;
//}


- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    [self.requestDic setValue:@"10" forKey:kRequestPageSize];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_channelDetail request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                if (pageNumber > 1) {
                    self.resultModel = [DYJXIdentitySwitchingModel modelWithJSON:[responseObject objectForKey:@"Result"]];
//                    NSMutableArray *array = [self.SearchReusltListModel.products mutableCopy];
//                    [weakSelf.goodsListArray addObjectsFromArray:array];
                }else{
//                    [weakSelf.goodsListArray removeAllObjects];
//                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:@"Result"]];
//                    weakSelf.goodsListArray = [self.SearchReusltListModel.products mutableCopy];
                }
                
//                BOOL isLastPage = (self.goodsListArray.count == self.SearchReusltListModel.total);
//                BOOL isHaveData = self.goodsListArray.count;
                
                
//                success(isLastPage,isHaveData);
                
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

- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = kStartPageIndex;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}
@end
