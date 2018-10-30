//
//  XYUMSocialShareItemCVCell.m
//  user
//
//  Created by xingyun on 2017/9/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYUMSocialShareItemCVCell.h"

@implementation XYUMSocialShareItemCVCell

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
        make.width.height.mas_equalTo(44);
        make.top.mas_equalTo(30);
        make.centerX.mas_equalTo(supperView.mas_centerX);
    }];
    
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(10);
    }];
    
    
}


#pragma mark - 懒加载

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
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        
    }
    return _titleLB;
}



@end
