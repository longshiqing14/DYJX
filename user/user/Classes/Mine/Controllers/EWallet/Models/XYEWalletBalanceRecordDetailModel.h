//
//  XYEWalletBalanceRecordDetailModel.h
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYEWalletBalanceRecordDetailTypeModel;

@interface XYEWalletBalanceRecordDetailModel : NSObject

/** 当次交易之后的预存款金额 */
@property (nonatomic, copy) NSString * afterAmount;
/** 当次交易之前的预存款金额 */
@property (nonatomic, copy) NSString * beforeAmount;

/** id */
@property (nonatomic, copy) NSString * balance_id;


/** 支付方式 */
@property (nonatomic, copy) NSString * paymentType;


/** 增加 还是 减少预存款 */
@property (nonatomic, copy) NSString * direction;
/** 交易金额 */
@property (nonatomic, copy) NSString * transactionAmount;
/** 交易号 */
@property (nonatomic, copy) NSString * transactionNo;
/** 预存款发生时间 */
@property (nonatomic, copy) NSString * transactionTime;
/** 类型 */
@property (nonatomic, strong) XYEWalletBalanceRecordDetailTypeModel * transactionType;



@end

@interface XYEWalletBalanceRecordDetailTypeModel : NSObject

/** 类型 */
@property (nonatomic, copy) NSString * type;
/** 类型显示标签 */
@property (nonatomic, copy) NSString * typeLabel;

@end

