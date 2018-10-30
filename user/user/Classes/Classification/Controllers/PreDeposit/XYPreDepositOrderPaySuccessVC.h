//
//  XYPreDepositOrderPaySuccessVC.h
//  user
//
//  Created by xingyun on 2017/9/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"

@interface XYPreDepositOrderPaySuccessVC : XYBestVC

//   Y:套餐商品列表,N:预存款充值列表
@property (nonatomic, copy) NSString * isProductList;

@property (nonatomic, copy) NSString * totalPayPrice;

/** 订单ID */
@property(copy,nonatomic) NSString *orderId ;

@end
