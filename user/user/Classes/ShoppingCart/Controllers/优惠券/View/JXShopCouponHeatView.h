//
//  JXShopCouponHeatView.h
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCouponHeatView.h"
#import "PPNumberButton.h"
#import "JXHhopAvailableModel.h"

@interface JXShopCouponHeatView : UITableViewHeaderFooterView
//加号小于优惠券
@property(nonatomic,strong)void (^ ClockSmall)();

//加号数量优惠券
@property(nonatomic,strong)void (^ ClockPlus)(NSString *number);

//选择优惠券
@property(nonatomic,strong)void (^ SelectClock)(BOOL isOpen,NSString *number);


@property (weak, nonatomic) IBOutlet PPNumberButton *numberButton;
//共几张券
@property (weak, nonatomic) IBOutlet UIButton *allCoupons;

//满多少减多少
@property (weak, nonatomic) IBOutlet UILabel *fullDenomination;

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
//是否选中
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

-(void)heat_init:(NSInteger)tag ImageName:(NSString *)imageName shopModel:(JXHhopAvailableBatchesModel *)model;
@end
