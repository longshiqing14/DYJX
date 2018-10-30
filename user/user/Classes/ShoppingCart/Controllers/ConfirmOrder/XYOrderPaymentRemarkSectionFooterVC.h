//
//  XYOrderPaymentRemarkSectionFooterVC.h
//  XY
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 yongxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYOrderPaymentRemarkSectionFooterVC : UIViewController

/** 备注 */
@property(strong,nonatomic) UITextField *remarkTF;

/** view  高度 */
extern const  CGFloat payment_remark_height;

/** 商品 总额 */
//@property (nonatomic, copy) NSString * accountString;

- (void)remarkSectionUpdateAccountString:(NSString*)accountString deliverMoneyString:(NSString*)deliverMoneyString;

@end
