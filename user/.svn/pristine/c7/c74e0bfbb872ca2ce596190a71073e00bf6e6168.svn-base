//
//  XYConfirmOrderPayPickView.h
//  user
//
//  Created by xingyun on 2017/10/23.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYConfirmOrderPayPickViewDelegate <NSObject>

/** 选择支付方式   */
- (void)pickPayType:(BOOL)isBalancePay balanceTotal:(NSString*)balanceTotal payType:(NSString*)payType needTotal:(NSString*)needTotal;

@end

@interface XYConfirmOrderPayPickView : UIView

@property (nonatomic, weak) id<XYConfirmOrderPayPickViewDelegate> delegate;


- (instancetype)initWithPayTotal:(NSString*)totalPayString balanceString:(NSString*)balanceString paymentTypes:(NSArray*)paymentTypes;


- (void)show;

@end
