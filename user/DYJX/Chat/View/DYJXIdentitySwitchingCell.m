//
//  JXFoodCell.m
//  user
//
//  Created by 岩  熊 on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingCell.h"

@interface DYJXIdentitySwitchingCell ()
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end

@implementation DYJXIdentitySwitchingCell

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
    self.goodsNameLabel.numberOfLines = 2;
    
    self.sellingPointLable.textColor = [UIColor colorWithHexString:@"999999"];
    self.sellingPointLable.font = [UIFont systemFontOfSize:12];
    self.sellingPointLable.numberOfLines = 1;

    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = [UIColor colorWithHexString:@"#E4E4E4"];
    [self.contentView addSubview:self.line];
   
    
    
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];
    [self.contentView addSubview:self.goodsImageView];
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40 , 40));
    }];
    
    [self.contentView addSubview:self.selectedImageView];
    [self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.contentView addSubview:self.goodsNameLabel];
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.selectedImageView.mas_left).mas_equalTo(-10);
    }];
    
    [self.contentView addSubview:self.sellingPointLable];
    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.goodsImageView.mas_bottom).mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.selectedImageView.mas_left).mas_equalTo(-10);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
}

- (UIImageView *)selectedImageView{
    if (!_selectedImageView) {
        _selectedImageView = [[UIImageView alloc]init];
    }
    return _selectedImageView;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (selected) {
        [self.selectedImageView setImage:[UIImage imageNamed:@"check35"]];
    }else{
        [self.selectedImageView setImage:[UIImage imageNamed:@""]];
    }
}

@end
