//
//  XYHomeButtonCVCell.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeButtonCVCell.h"

@implementation XYHomeButtonCVCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.numLB];

        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(supperView.mas_centerX);
        make.height.width.mas_equalTo(40);
    }];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_iconImageView.mas_bottom).mas_offset(-2);
//        make.bottom.mas_equalTo(-8);
//        make.height.mas_equalTo(20);
    }];
    
    [self.numLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(supperView.mas_centerX).offset(5);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);

    }];
}

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _iconImageView.contentMode = UIViewContentModeCenter;

    }
    return _iconImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = [UIFont systemFontOfSize:12];
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYRGBAColor(153, 153, 153, 1);
        
    }
    return _titleLB;
}

- (UILabel*)numLB
{
    if (_numLB == nil) {
        _numLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _numLB.font = XYFont_10;
        _numLB.textAlignment = NSTextAlignmentCenter;
        _numLB.textColor = XYWhiteColor;
        
        _numLB.backgroundColor = [UIColor redColor];
        
        _numLB.layer.cornerRadius = 18/2;
        _numLB.layer.masksToBounds = YES;
        
    }
    return _numLB;
}

@end
