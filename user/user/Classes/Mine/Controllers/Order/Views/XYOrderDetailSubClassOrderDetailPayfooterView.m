//
//  XYOrderDetailSubClassOrderDetailPayfooterView.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailPayfooterView.h"

@interface XYOrderDetailSubClassOrderDetailPayfooterView ()



@end

@implementation XYOrderDetailSubClassOrderDetailPayfooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.titleLB];
        
        [self.bgView addSubview:self.titleNumLB];

        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(1);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.titleNumLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_titleNumLB.mas_left).offset(-5);
        make.top.bottom.mas_equalTo(0);
    }];
}


#pragma mark - 懒加载

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYWhiteColor;
    }
    return _bgView;
}


- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentRight;
        _titleLB.textColor = XYFontTitleColor;
        
    }
    return _titleLB;
}

- (UILabel*)titleNumLB
{
    if (_titleNumLB == nil) {
        _titleNumLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleNumLB.font = XYFont_14;
        _titleNumLB.textAlignment = NSTextAlignmentRight;
        _titleNumLB.textColor = XYMainColor;
        
    }
    return _titleNumLB;
}

#pragma mark -  headerView init

+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderDetailSubClassOrderDetailPayfooterView";
    XYOrderDetailSubClassOrderDetailPayfooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[XYOrderDetailSubClassOrderDetailPayfooterView alloc] initWithReuseIdentifier:ID];
        
    }
    return headerView;
}

@end
