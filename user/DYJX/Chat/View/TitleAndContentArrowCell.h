//
//  TitleAndContentArrowCell.h
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleAndContentArrowCell : UITableViewCell
@property(nonatomic, strong) UIImageView *iconImage;
@property(nonatomic, strong) UITextField* contentLb;
@property (nonatomic, strong) UIView *separatorLineView;
@property (nonatomic, strong) UIButton *arrowImageBtn;

@property (nonatomic, strong) LPXNewCustomerCellModel *model;
@property (nonatomic, copy) void (^nextBtnBlock)(TitleAndContentArrowCell *cell);

@end
