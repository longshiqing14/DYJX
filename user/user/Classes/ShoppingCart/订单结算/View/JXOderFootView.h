//
//  JXOderFootView.h
//  user
//  提交订单
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXOderFootView : UIView
@property(nonatomic,copy)void (^ ClockSubmit)();
//订单金额
@property (weak, nonatomic) IBOutlet UILabel *footTitleLable;
-(void)foot_init:(NSString *)paymentPrice;
@end
