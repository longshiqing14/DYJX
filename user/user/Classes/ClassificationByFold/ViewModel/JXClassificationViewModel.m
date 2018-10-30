//
//  JXClassificationViewModel.m
//  user
//
//  Created by 岩  熊 on 2017/12/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXClassificationViewModel.h"
#import "XYBestRequest.h"
#import "XYNetWorking.h"
#import "JXSearchReusltListModel.h"
#import "JXClassificationTitleListModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1


@interface JXClassificationViewModel()
@property (nonatomic,strong) JXSearchReusltListModel *SearchReusltListModel;
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) NSMutableArray<JXBaseGoodsModel*> *goodsListArray;
@property (nonatomic,strong) NSMutableArray<JXClassificationSecondTitleListModel*> *titleArray;
@end

@implementation JXClassificationViewModel
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

- (NSArray<JXClassificationSecondTitleListModel*> *)JXClassificationTitleList{
    return self.titleArray;
}

- (NSInteger)numberSectionOfTableCell{
    return self.titleArray.count;
}
- (NSInteger)numberRowsOfTableSection:(NSInteger)section{
    return self.titleArray[section].children.count;
}
- (NSString *)titleName:(NSInteger )section{
    return self.titleArray[section].name;
}
- (NSString *)ChildrentitleName:(NSIndexPath *)indexPath{
    return self.titleArray[indexPath.section].children[indexPath.row].name;
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

- (void)getClassificationTitleListDataFromSeviceSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
//    [XYProgressHUD show];
    WeakSelf;
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    [self.requestDic setValue:merchantId forKey:@"theMerchantId"];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_categoryFrontLiLst request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [XYProgressHUD svHUDDismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                
                    JXClassificationTitleListModel *Model = [JXClassificationTitleListModel modelWithJSON: responseObject];
                
                self.titleArray = [Model.RETURN_DATA copy];
                
                BOOL isHaveData = self.titleArray.count;

                success(nil,isHaveData);
                //                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
                

            }
            
        }else{
            
             [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

    }];
}

- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    self.pageNum = pageNumber;
    [XYProgressHUD show];
    WeakSelf;
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    [self.requestDic setValue:merchantId forKey:@"theMerchantId"];
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productShowPromotionProductList request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];
                if (pageNumber > 1) {
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA_]];
                    NSMutableArray *array = [self.SearchReusltListModel.products mutableCopy];
                    [weakSelf.goodsListArray addObjectsFromArray:array];
                }else{
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA_]];
                    weakSelf.goodsListArray = [self.SearchReusltListModel.products mutableCopy];
                }
                
                BOOL isHaveData = self.SearchReusltListModel.total;
                
                BOOL isLastPage = !self.SearchReusltListModel.products.count;
                success(isLastPage,isHaveData);
                //                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
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
    self.pageNum = pageNumber;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:pageNumber Success:success failed:failed];
}

- (void)loadMoreDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))failed {
    self.pageNum = self.pageNum + 1;
    [self getSearchReaultGoodsListDataFromSeviceWithPageNumer:self.pageNum Success:success failed:failed];
}

@end
