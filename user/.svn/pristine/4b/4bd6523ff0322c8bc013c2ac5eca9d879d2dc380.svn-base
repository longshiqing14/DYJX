//
//  JXNotUsedView.h
//  user
//
//  Created by liu_yakai on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCouponDetailModel.h"
@interface JXNotUsedHeatView : UITableViewHeaderFooterView
@property(nonatomic,copy)void (^ Clock)(NSInteger index,BOOL isOpen);
@property(nonatomic,copy)void (^ UseClock)();
//箭头
@property (weak, nonatomic) IBOutlet UIButton *heatUpDown;
//点击
@property (weak, nonatomic) IBOutlet UIButton *clockButton;
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

//点View
@property (weak, nonatomic) IBOutlet UILabel *circularLable;
@property (weak, nonatomic) IBOutlet UILabel *circular;
//内容
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *content;

-(void)heat_init:(NSInteger)tag  ImageName:(NSString *)imageName couponModel:(JXCouponDetailModel*)model;
@end
