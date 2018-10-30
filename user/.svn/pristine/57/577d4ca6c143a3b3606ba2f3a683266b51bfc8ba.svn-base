//
//  XYOrderDetailPayPickView.h
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYOrderDetailPayPickViewDelegate <NSObject>

/** 选择支付方式   */
- (void)pickPayType:(NSString*)payType needTotal:(NSString*)needTotal;

@end


@interface XYOrderDetailPayPickView : UIView

@property (nonatomic, weak) id <XYOrderDetailPayPickViewDelegate> delegate;

- (instancetype)initWithPayTotal:(NSString*)totalPayString paymentTypes:(NSArray*)paymentTypes;

- (void)show;

@end
