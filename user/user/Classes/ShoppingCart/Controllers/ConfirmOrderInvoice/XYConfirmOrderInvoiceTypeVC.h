//
//  XYConfirmOrderInvoiceTypeVC.h
//  user
//
//  Created by xingyun on 2017/10/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYConfirmOrderInvoiceTypeVCDelegate <NSObject>

/** 个人发票 点击事件 */
- (void)InvoiceTypeViewPersonalButtonClick;
/** 企业发票 点击事件 */
- (void)InvoiceTypeViewEnterpriseButtonClick;

@end


@interface XYConfirmOrderInvoiceTypeVC : UIViewController

/** 代理 */
@property (nonatomic ,weak) id<XYConfirmOrderInvoiceTypeVCDelegate> delegate;

/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
/** 线 */
@property (nonatomic, strong) UIView * lineView;
/** 按钮底 */
@property (nonatomic, strong) UIView * buttonView;
/** 个人 发票 */
@property (nonatomic, strong) UIButton * personalInvoiceBT;
/** 企业 发票 */
@property (nonatomic, strong) UIButton * enterpriseInvoiceBT;

@end
