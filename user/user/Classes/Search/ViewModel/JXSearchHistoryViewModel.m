//
//  JXSearchHistoryViewModel.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchHistoryViewModel.h"
#import "XYBestRequest.h"
#import "XYNetWorking.h"
#import "XYBestAllNet.h"
#import "JXHotSearchListModel.h"

@interface JXSearchHistoryViewModel ()
@property (nonatomic,strong)JXHotSearchListModel *hotSearchListModel;
@end

@implementation JXSearchHistoryViewModel
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (NSArray*)getHotSearchData{
    return self.hotSearchData;
}

- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productHotsearch request_data:[NSMutableDictionary new]];
   
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                weakSelf.hotSearchListModel = [JXHotSearchListModel modelWithJSON:[responseObject objectForKey:RETURN_DATA]];
                
                weakSelf.hotSearchData = [NSArray arrayWithArray:weakSelf.hotSearchListModel.hotKeyword];
                
                success(nil,nil);
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

- (NSString*)getHotSearchWithIndex:(NSInteger)index{
    return self.hotSearchData[index].content;
}

- (NSArray<JXHotSearchModel*> *)hotSearchData{
    if (!_hotSearchData) {
        _hotSearchData = [NSArray array];
    }
    return _hotSearchData;
}

- (JXHotSearchListModel *)hotSearchListModel{
    if (!_hotSearchListModel) {
        _hotSearchListModel = [[JXHotSearchListModel alloc]init];
    }
    return _hotSearchListModel;
}
@end
