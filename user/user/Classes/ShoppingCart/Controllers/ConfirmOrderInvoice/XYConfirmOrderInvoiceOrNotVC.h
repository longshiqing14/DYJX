//
//  XYConfirmOrderInvoiceOrNotVC.h
//  user
//
//  Created by xingyun on 2017/10/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYConfirmOrderInvoiceOrNotVCDelegate <NSObject>

/** 开发票 按钮点击事件 */
- (void)InvoiceOrNotViewInvoiceButtonClick;
/** 不开发票 点击事件 */
- (void)InvoiceOrNotViewNotButtonClick;

@end

@interface XYConfirmOrderInvoiceOrNotVC : UIViewController

@property (nonatomic, weak) id<XYConfirmOrderInvoiceOrNotVCDelegate> delegate;

/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
/** 线 */
@property (nonatomic, strong) UIView * lineView;
/** 按钮底 */
@property (nonatomic, strong) UIView * buttonView;
/** 开发票 */
@property (nonatomic, strong) UIButton * invoiceBT;
/** 不开发票 */
@property (nonatomic, strong) UIButton * notBT;

@end
