//
//  JXMyAleadyUsedHeatView.h
//  user
//
//  Created by liu_yakai on 2017/11/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCouponDetailModel.h"

@interface JXMyAleadyUsedHeatView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UIButton *sheetsNumberButton;
@property(nonatomic,copy)void (^ Clock)(NSInteger index,BOOL isOpen);
//箭头
@property (weak, nonatomic) IBOutlet UIButton *heatUpDown;
//点击
@property (weak, nonatomic) IBOutlet UIButton *clockButton;
@property (weak, nonatomic) IBOutlet UILabel *thresHoldLb;
//优惠券面额
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
//用户类型
@property (weak, nonatomic) IBOutlet UILabel *userTypeLable;
//优惠券类型
@property (weak, nonatomic) IBOutlet UILabel *voucherLable;
//优惠券时间
@property (weak, nonatomic) IBOutlet UILabel *vocherTime;
//优惠券的状态图片
@property (weak, nonatomic) IBOutlet UIImageView *heatImageView;
//点View
@property (weak, nonatomic) IBOutlet UILabel *circularLable;
@property (weak, nonatomic) IBOutlet UILabel *circular;
//内容
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *content;

-(void)heat_init:(NSInteger)tag ImageName:(NSString *)imageName couponModel:(JXCouponDetailModel*)model;
@end
