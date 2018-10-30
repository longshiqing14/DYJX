//
//  XYOrderConfirmInvoiceSubTVC.h
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYOrderFromDetailInvoiceInfoModel;

@protocol XYOrderConfirmInvoiceSubTVCDelegate <NSObject>

@optional
/** 发票选择结束 */
- (void)orderConfirmInvoiceSelectEnd;
/** 发票选择开始 */
- (void)orderConfirmInvoiceSelectStar;

@end

@interface XYOrderConfirmInvoiceSubTVC : UITableViewController

@property(nonatomic,copy)void (^ ClockSub)();

/** 发票信息 model */
@property (nonatomic, strong) XYOrderFromDetailInvoiceInfoModel * invoiceInfoModel;

/** 代理 */
@property (nonatomic, weak) id <XYOrderConfirmInvoiceSubTVCDelegate> delegate;

@end
