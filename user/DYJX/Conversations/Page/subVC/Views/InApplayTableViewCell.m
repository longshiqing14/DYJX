//
//  InApplayTableViewCell.m
//  user
//
//  Created by longshiqing on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "InApplayTableViewCell.h"

@implementation InApplayTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    self.goodsNameLabel = [[UILabel alloc] init];
    self.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.numberOfLines = 1;

    self.sellingPointLable.textColor = [UIColor colorWithHexString:@"#333333"];
    self.sellingPointLable.font = [UIFont systemFontOfSize:14];
    self.sellingPointLable.numberOfLines = 1;

    [self.contentView addSubview:self.goodsImageView];
    [self.contentView addSubview:self.goodsNameLabel];
    [self.contentView addSubview:self.sellingPointLable];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.applyLabel];
    [self.contentView addSubview:self.agreeLabel];
}

-(void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];

    [self.agreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(110, 14));
    }];

    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(30 , 30));
    }];

    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf).mas_equalTo(10);
        make.right.mas_equalTo(weakSelf).mas_equalTo(-120);
    }];

    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left);
        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(weakSelf).mas_equalTo(-125);
    }];

    [self.applyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.sellingPointLable.mas_bottom).offset(5);
        make.right.mas_equalTo(weakSelf).mas_equalTo(-125);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.mas_equalTo(0.5);
    }];

}

- (UIImageView *)goodsImageView{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]init];
        _goodsImageView.layer.masksToBounds = YES;
        _goodsImageView.layer.cornerRadius = 15.0;
    }
    return _goodsImageView;
}

- (UILabel *)goodsNameLabel{
    if (!_goodsNameLabel) {
        _goodsNameLabel = [[UILabel alloc]init];
        _goodsNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _goodsNameLabel;
}

- (UILabel *)sellingPointLable{
    if (!_sellingPointLable) {
        _sellingPointLable = [[UILabel alloc]init];
        _sellingPointLable.font = [UIFont systemFontOfSize:14];
    }
    return _sellingPointLable;
}

-(UILabel *)line {
    if (!_line) {
        _line = [[UILabel alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}
-(UILabel *)agreeLabel {
    if (!_agreeLabel) {
        _agreeLabel = [[UILabel alloc] init];
        _agreeLabel.textColor = [UIColor lightGrayColor];
        _agreeLabel.text = @"正在等待对方答复";
        _agreeLabel.textAlignment = NSTextAlignmentRight;
        _agreeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _agreeLabel;
}

-(UILabel *)applyLabel {
    if (!_applyLabel) {
        _applyLabel = [[UILabel alloc] init];
        _applyLabel.textColor = [UIColor lightGrayColor];
        _applyLabel.text = @"请加我为好友";
        _applyLabel.font = [UIFont systemFontOfSize:13];
    }
    return _applyLabel;
}

@end
