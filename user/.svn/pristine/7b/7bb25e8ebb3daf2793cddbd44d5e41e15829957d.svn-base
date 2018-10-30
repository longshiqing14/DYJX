//
//  XYPreDepositTVCHeaderView.m
//  user
//
//  Created by xingyun on 2017/9/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositTVCHeaderView.h"

@implementation XYPreDepositTVCHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.titleLB];
        
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(_bgView.mas_centerX);
        make.left.mas_equalTo(XY_Left_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
}




#pragma mark - 懒加载

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYGlobalBg;
    }
    return _bgView;
}


- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.font = XYFont_14;
        _titleLB.textColor = XYGrayColor;
        
    }
    return _titleLB;
}

#pragma mark -  headerView init

+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYPreDepositTVCHeaderView";
    XYPreDepositTVCHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[XYPreDepositTVCHeaderView alloc] initWithReuseIdentifier:ID];
        
    }
    return headerView;
}

@end
