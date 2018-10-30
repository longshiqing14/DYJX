//
//  XYOrderListCellGoodsListCVCell.m
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderListCellGoodsListCVCell.h"

@implementation XYOrderListCellGoodsListCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.markImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);

    }];
    [self.markImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.size.mas_equalTo(CGSizeMake(22, 24));
    }];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(3);
    }];
}

-(UIImageView *)markImageView{
    if (!_markImageView) {
        _markImageView=[[UIImageView alloc]init];
        _markImageView.image=[UIImage imageNamed:@"home_mark_Image"];
    }
    return _markImageView;
}

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _iconImageView.contentMode = UIViewContentModeCenter;
        
        _iconImageView.layer.cornerRadius = 5;
        _iconImageView.layer.masksToBounds = YES;
        
        _iconImageView.layer.borderWidth = 0.5;
        _iconImageView.layer.borderColor = XYLineColor.CGColor;
        
    }
    return _iconImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.backgroundColor = XYRGBAColor(0, 0, 0, 0.4);
        
        _titleLB.font = XYFont_10;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYWhiteColor;
        
    }
    return _titleLB;
}

@end
