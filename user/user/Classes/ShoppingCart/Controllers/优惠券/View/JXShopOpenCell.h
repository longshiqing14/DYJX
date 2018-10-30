//
//  JXShopOpenCell.h
//  user
//
//  Created by liu_yakai on 2017/12/1.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"
typedef void(^clickBlock) (UIButton*);
@interface JXShopOpenCell : BaseCell
//点View
@property (weak, nonatomic) IBOutlet UILabel *circularLable;

//内容
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, copy)clickBlock block;

@end
