//
//  XYOrderConfirmOrderBottomVC.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XYOrderConfirmOrderBottomVCDelegate <NSObject>

/**  */
- (void)orderConfirmOrderBottomButtonClick;

@end

@interface XYOrderConfirmOrderBottomVC : UIViewController

@property (nonatomic, weak) id<XYOrderConfirmOrderBottomVCDelegate> delegate;

/** 底部 总价 */
@property (nonatomic, copy) NSString * totalString ;

//@property(nonatomic, copy)NSString *totalDiscountLbStr;

@end
