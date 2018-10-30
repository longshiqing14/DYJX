//
//  XYEWalletPreDepositReturnListModel.h
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYEWalletPreDepositReturnListModel : NSObject

/** 返现 id */
@property (nonatomic, copy) NSString * cashbackId;
/** 时间 */
@property (nonatomic, copy) NSString * formatCreateTime;
/** 价格 */
@property (nonatomic, copy) NSString * price;
/** 套餐名 */
@property (nonatomic, copy) NSString * productName;

@end
