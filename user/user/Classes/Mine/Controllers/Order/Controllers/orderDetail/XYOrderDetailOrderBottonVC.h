//
//  XYOrderDetailOrderBottonVC.h
//  user
//
//  Created by xingyun on 2017/9/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYOrderDetailModel;
@class XYOrderDetailAndPaymentModel;
@protocol XYOrderDetailOrderBottonVCDelegate <NSObject>

/** 订单详情底部按钮点击  取消 */
- (void)orderDetailBottomCancelButton;

@end


@interface XYOrderDetailOrderBottonVC : UIViewController

/** view  高度 */
extern const  CGFloat order_Detail_bottom_height;


@property (nonatomic,weak) id <XYOrderDetailOrderBottonVCDelegate> delegate;


/** 数据 */
@property (nonatomic,strong) XYOrderDetailModel * detailModel;

//支付方式
@property (nonatomic, strong) XYOrderDetailAndPaymentModel *paymentModel;
@end
