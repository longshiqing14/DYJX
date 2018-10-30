//
//  JXFullReduceGoodsViewmodel.m
//  user
//
//  Created by 岩  熊 on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXFullReduceGoodsViewmodel.h"
#import "XYBestRequest.h"
#import "XYNetWorking.h"
#import "JXSearchReusltListModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1

@interface JXFullReduceGoodsViewmodel ()
@property (nonatomic,strong) JXSearchReusltListModel *SearchReusltListModel;
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) NSMutableArray<JXBaseGoodsModel*> *goodsListArray;
@end

@implementation JXFullReduceGoodsViewmodel
- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
        self.pageNum = kStartPageIndex;
    }
    return _requestDic;
}

- (JXSearchReusltListModel *)SearchReusltListModel{
    if (!_SearchReusltListModel) {
        _SearchReusltListModel = [[JXSearchReusltListModel alloc]init];
    }
    return _SearchReusltListModel;
}

- (NSString *)goodsName:(NSIndexPath *)indexPath
{
    
    return self.goodsListArray[indexPath.row].title;
}

- (NSString *)goodsPrice:(NSIndexPath *)indexPath
{
    return self.goodsListArray[indexPath.row].memberPrice;
}

- (NSString *)productID:(NSIndexPath *)indexPath
{
    return self.goodsListArray[indexPath.row].productID;
}

- (NSString *)goodsImageUrl:(NSIndexPath *)indexPath
{
    
    return self.goodsListArray[indexPath.row].logo;
}

- (NSArray *)goodsLable:(NSIndexPath *)indexPath
{
    
    return self.goodsListArray[indexPath.row].lable;
}

- (NSString *)listShowTile
{
    
    return self.SearchReusltListModel.activeCard.firstObject.listShowTile;
}

- (NSInteger)numberOfCell{
    return self.goodsListArray.count;
}


- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    [XYProgressHUD show];
    WeakSelf;
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    [self.requestDic setValue:merchantId forKey:@"theMerchantId"];
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productShowPromotionProductList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                if (pageNumber > 1) {
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA]];
                    NSMutableArray *array = [self.SearchReusltListModel.products mutableCopy];
                    [weakSelf.goodsListArray addObjectsFromArray:array];
                }else{
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA]];
                    weakSelf.goodsListArray = [self.SearchReusltListModel.products mutableCopy];
                }
                
                BOOL isHaveData = self.SearchReusltListModel.total;
                
                
                success(nil,isHaveData);
                //                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                //                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
            //            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        //        block(nil,error);
    }];
}

- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    NSInteger pageNumber = kStartPageIndex;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:pageNumber Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

@end
