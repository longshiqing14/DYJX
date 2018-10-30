//
//  JXShoppingCartView.h
//  user
//
//  Created by liu_yakai on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYShoppingCartTotalModel.h"

@interface JXShoppingCartHeatView: UIView
//满减
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeWidth;
@property (weak, nonatomic) IBOutlet UILabel *typeLable;
//满多少减多少
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
//凑单
@property (weak, nonatomic) IBOutlet UIButton *singleButton;
//点击按钮
@property (weak, nonatomic) IBOutlet UIButton *clockButton;
@property(nonatomic,copy)void (^ ClockSingle)(NSInteger index);

@property (weak, nonatomic) IBOutlet UILabel *dotLable;
-(void)heat_init:(NSInteger)tag Model:(XYShopTargetsModel *)model;
@end
