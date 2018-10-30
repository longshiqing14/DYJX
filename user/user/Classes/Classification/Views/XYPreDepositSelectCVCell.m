//
//  XYPreDepositSelectCVCell.m
//  user
//
//  Created by xingyun on 2017/9/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositSelectCVCell.h"

@implementation XYPreDepositSelectCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.contentView.layer.borderWidth = 1;
        self.contentView.layer.borderColor = XYFontTitleColor.CGColor;
        
        self.contentView.layer.cornerRadius = 5;
        self.contentView.layer.masksToBounds = YES;
        
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.subLB];
        
    }
    return self;
}





- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(supperView.mas_centerY).offset(-4);
    }];
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(supperView.mas_centerY).offset(4);
    }];
    
}

#pragma mark - 懒加载


- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_18;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        
        
    }
    return _titleLB;
}



- (UILabel*)subLB
{
    if (_subLB == nil) {
        _subLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _subLB.font = XYFont_14;
        _subLB.textAlignment = NSTextAlignmentCenter;
        _subLB.textColor = XYFontTitleColor;
        
        _subLB.numberOfLines = 0;
        
    }
    return _subLB;
}


@end
