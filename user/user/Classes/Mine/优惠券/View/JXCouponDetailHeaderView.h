//
//  JXCouponDetailHeaderView.h
//  user
//
//  Created by 岩  熊 on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCouponDetailModel.h"



@interface JXCouponDetailHeaderView : UITableViewHeaderFooterView
//立即使用
@property (weak, nonatomic) IBOutlet UIButton *immediatelyButton;
//优惠券面额
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
//用户类型
@property (weak, nonatomic) IBOutlet UILabel *userTypeLable;
//优惠券类型
@property (weak, nonatomic) IBOutlet UILabel *voucherLable;
//优惠券时间
@property (weak, nonatomic) IBOutlet UILabel *vocherTime;
@property (weak, nonatomic) IBOutlet UILabel *thresHoldLb;
@property(nonatomic,copy)void (^ UseClock)();
-(void)heat_init:(NSInteger)tag  ImageName:(NSString *)imageName couponModel:(JXCouponDetailModel*)model;
@end
