//
//  JXRefundViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/4/8.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXRefundReasonsModel.h"
#import "JXRefundTextModel.h"

@interface JXRefundViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;

- (NSInteger)numberOfCells;

-(NSInteger)numberOfCellsWithSection:(NSInteger)section;

- (NSString *)contentWithIndexPath:(NSIndexPath *)indexPath;

- (void)GetRefundCashDataSuccess:(void(^)(BOOL isLastPage,BOOL doHaveData))success failed:(void(^)(NSString *errorMsg))fail;

- (void)upLoadRefundData:(BOOL)isFirst Success:(void(^)(NSString *refundId))success failed:(void(^)(NSString *errorMsg))fail;

- (void)GetRefundTextSuccess:(void(^)(JXRefundTextModel *model))success failed:(void(^)(NSString *errorMsg))fail;

-(NSMutableArray<JXRefundReasonsDeatailModel*>*)getRefundReasonsArray;
@end
