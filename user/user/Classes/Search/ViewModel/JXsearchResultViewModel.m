//
//  JXsearchResultViewModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXsearchResultViewModel.h"
#import "XYBestRequest.h"
#import "XYNetWorking.h"
#import "JXSearchReusltListModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1

@interface JXsearchResultViewModel ()
@property (nonatomic,strong) JXSearchReusltListModel *SearchReusltListModel;
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) NSMutableArray<JXBaseGoodsModel*> *goodsListArray;
@end

@implementation JXsearchResultViewModel

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

- (NSString *)sellingPointText:(NSIndexPath *)indexPath
{
    
    return self.goodsListArray[indexPath.row].sellingPointText;
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

- (NSInteger)numberOfCell{
    return self.goodsListArray.count;
}

- (NSArray *)goodsLable:(NSIndexPath *)indexPath
{
    
    return self.goodsListArray[indexPath.row].lable;
}

- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
     [XYProgressHUD show];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    [self.requestDic setValue:merchantId forKey:@"theMerchantId"];
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productShowPromotionProductList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            BOOL isLastPage = nil;
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];
                if (pageNumber > 1) {
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA]];
                    NSMutableArray *array = [self.SearchReusltListModel.products mutableCopy];
                    if (self.SearchReusltListModel.products.count == 0) {
                        isLastPage = YES;
                    }else{
                        isLastPage = NO;
                    }
                     [weakSelf.goodsListArray addObjectsFromArray:array];
                }else{
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA]];
                    weakSelf.goodsListArray = [self.SearchReusltListModel.products mutableCopy];
                }
                
                BOOL isHaveData = self.SearchReusltListModel.total;
                
                
                success(isLastPage,isHaveData);
//                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

            }
            
        }else{
            
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        
    }];
}

- (void)refreshDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    NSInteger pageNumber = kStartPageIndex;
    self.pageNum=pageNumber;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:pageNumber Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

@end
