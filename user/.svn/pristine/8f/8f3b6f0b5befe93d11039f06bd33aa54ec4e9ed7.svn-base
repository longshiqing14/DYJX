//
//  JXFoodheaderViewModel.m
//  user
//
//  Created by 岩  熊 on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXFoodheaderViewModel.h"
#import "JXSearchReusltListModel.h"

#define kRequestPageNumber @"page"
#define kRequestPageSize @"page_size"
#define kStartPageIndex 1
@interface JXFoodheaderViewModel()
@property (nonatomic,strong)JXSearchReusltListModel *SearchReusltListModel;
@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) NSMutableArray<JXBaseGoodsModel*> *goodsListArray;
@end

@implementation JXFoodheaderViewModel
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
    
    return self.goodsListArray[indexPath.row].productName;
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
    return self.goodsListArray[indexPath.row].productId;
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
    [self.requestDic setValue:[NSString stringWithFormat:@"%ld",(long)pageNumber] forKey:kRequestPageNumber];
    [self.requestDic setValue:@"10" forKey:kRequestPageSize];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_channelDetail request_data:self.requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];
                if (pageNumber > 1) {
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA_]];
                    NSMutableArray *array = [self.SearchReusltListModel.products mutableCopy];
                    [weakSelf.goodsListArray addObjectsFromArray:array];
                }else{
                    [weakSelf.goodsListArray removeAllObjects];
                    self.SearchReusltListModel = [JXSearchReusltListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA_]];
                    weakSelf.goodsListArray = [self.SearchReusltListModel.products mutableCopy];
                }
                
                BOOL isLastPage = (self.goodsListArray.count == self.SearchReusltListModel.total);
                BOOL isHaveData = self.goodsListArray.count;
                
                
                success(isLastPage,isHaveData);
                //                block([responseObject objectForKey:RETURN_DATA],nil);
                
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
