//
//  DYJXInterface.h
//  user
//
//  Created by longshiqing on 2018/11/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYBestAllNet.h"
#import "DYJOLatestListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXInterface : XYBestAllNet

// 最近联系人
- (void)getLasterContractsNumer:(NSInteger)pageNumber Success:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;
@property (nonatomic, strong)DYJOLatestListModel *lasterList;

@end

NS_ASSUME_NONNULL_END
