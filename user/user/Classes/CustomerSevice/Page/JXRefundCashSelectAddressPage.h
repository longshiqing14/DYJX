//
//  JXRefundCashSelectAddressPage.h
//  user
//
//  Created by 岩  熊 on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SaveRefundAddressBlock)(NSString *pickAddress);
@interface JXRefundCashSelectAddressPage : BaseViewController
@property(nonatomic,copy)SaveRefundAddressBlock block;
@end
