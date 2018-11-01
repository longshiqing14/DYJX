//
//  DYJXIdentitySwitchingHeader.m
//  user
//
//  Created by 岩  熊 on 2018/10/31.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingHeader.h"

@interface DYJXIdentitySwitchingHeader ()
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end

@implementation DYJXIdentitySwitchingHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
       [self initSubViews];
        
    }
    return self;
}

- (void)initSubViews
{
    
    self.backgroundColor = [UIColor lightGrayColor];
    self.goodsNameLabel = [[UILabel alloc] init];
    self.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.numberOfLines = 2;
    
    self.sellingPointLable.textColor = [UIColor colorWithHexString:@"999999"];
    self.sellingPointLable.font = [UIFont systemFontOfSize:12];
    self.sellingPointLable.numberOfLines = 1;
    
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = [UIColor colorWithHexString:@"#E4E4E4"];
    [self addSubview:self.line];
    
    
    
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];
    [self addSubview:self.goodsImageView];
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40 , 40));
    }];
    
    [self addSubview:self.goodsNameLabel];
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(0);
        make.right.mas_equalTo(-14);
    }];
    
    [self addSubview:self.sellingPointLable];
    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.goodsImageView.mas_bottom).mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
}

- (UIImageView *)goodsImageView{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]init];
    }
    return _goodsImageView;
}

- (UILabel *)goodsNameLabel{
    if (!_goodsNameLabel) {
        _goodsNameLabel = [[UILabel alloc]init];
    }
    return _goodsNameLabel;
}

- (UILabel *)sellingPointLable{
    if (!_sellingPointLable) {
        _sellingPointLable = [[UILabel alloc]init];
    }
    return _sellingPointLable;
}



@end
