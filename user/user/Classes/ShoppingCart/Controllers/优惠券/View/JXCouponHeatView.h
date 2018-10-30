//
//  JXCouponHeatView.h
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXCouponHeatView : UITableViewHeaderFooterView
-(id)initWith:(NSString *)xibName;


@property(nonatomic,copy)void (^ Clock)(BOOL isOpen);
//箭头
@property (weak, nonatomic) IBOutlet UIButton *heatUpDown;
//点击
@property (weak, nonatomic) IBOutlet UIButton *clockButton;
//优惠券面额
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
//用户类型
@property (weak, nonatomic) IBOutlet UILabel *userTypeLable;
//优惠券类型
@property (weak, nonatomic) IBOutlet UILabel *voucherLable;
//优惠券时间
@property (weak, nonatomic) IBOutlet UILabel *vocherTime;
//优惠券背景
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
//点View
@property (weak, nonatomic) IBOutlet UILabel *circularLable;
@property (weak, nonatomic) IBOutlet UILabel *circular;
//内容
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *content;

-(void)heat_init:(NSInteger)tag IsOpen:(BOOL)isOpen ImageName:(NSString *)imageName;
@end
