//
//  JXSearchHistoryViewModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXHotSearchModel.h"

@interface JXSearchHistoryViewModel : NSObject
@property (nonatomic,strong) NSArray<JXHotSearchModel*> *hotSearchData;
@property (nonatomic,strong) NSMutableDictionary *requestDic;

- (NSArray*)getHotSearchData;
- (NSString*)getHotSearchWithIndex:(NSInteger)index;
- (void)getSearchReaultGoodsListDataFromSeviceWithPageNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
@end
