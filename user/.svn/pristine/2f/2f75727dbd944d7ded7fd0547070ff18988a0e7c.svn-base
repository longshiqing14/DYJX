//
//  XYClassificationGoodsRightCVCell.m
//  user
//
//  Created by xingyun on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationGoodsRightCVCell.h"

@implementation XYClassificationGoodsRightCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(supperView.mas_centerX);
        make.height.width.mas_equalTo(60);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    

}

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _iconImageView.contentMode = UIViewContentModeCenter;
        
    }
    return _iconImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_12;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        
    }
    return _titleLB;
}



@end
