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
@property (nonatomic, strong) UILabel *dotNumber;
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
    self.goodsNameLabel.numberOfLines = 1;

    self.sellingPointLable.textColor = [UIColor colorWithHexString:@"#333333"];
    self.sellingPointLable.font = [UIFont systemFontOfSize:14];
    self.sellingPointLable.numberOfLines = 1;


    self.line = [[UIView alloc] init];
    self.line.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    
    [self.contentView addSubview:self.detailButton];
    [self.contentView addSubview:self.goodsImageView];
    [self.contentView addSubview:self.selectedImageView];
    [self.contentView addSubview:self.goodsNameLabel];
    [self.contentView addSubview:self.sellingPointLable];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.dotNumber];
}

-(void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).insets(UIEdgeInsetsMake(10, 10, 10, 0));
        make.centerY.equalTo(weakSelf);
        make.width.mas_equalTo(50);
    }];

    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(65);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(50 , 50));
    }];

    [self.dotNumber mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(weakSelf.goodsImageView).insets(UIEdgeInsetsMake(0, 0, 10, 10));
        make.right.equalTo(weakSelf.goodsImageView).offset(7);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(5);
        make.right.mas_equalTo(weakSelf.selectedImageView.mas_left).mas_equalTo(-5);
    }];
    
    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.goodsImageView.mas_bottom).mas_equalTo(-5);
        make.right.mas_equalTo(weakSelf.selectedImageView.mas_left).mas_equalTo(-5);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)setNumber:(NSInteger)number {
    if (number && number > 0) {
        [self.dotNumber setHidden:false];
        if (number > 99) {
            self.dotNumber.text = @"99";
        }
        else {
            self.dotNumber.text = [NSString stringWithFormat:@"%ld",(long)number];
        }
    }
    else {
        [self.dotNumber setHidden:true];
    }
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
-(UILabel *)dotNumber {
    if (!_dotNumber) {
        _dotNumber = [[UILabel alloc]init];
        _dotNumber.backgroundColor = [UIColor colorWithRed:219/255.0 green:55/255.0 blue:48/255.0 alpha:1];
        _dotNumber.textAlignment = NSTextAlignmentCenter;
        _dotNumber.font = [UIFont systemFontOfSize:11];
        _dotNumber.textColor = [UIColor whiteColor];
        _dotNumber.layer.masksToBounds = true;
        _dotNumber.layer.cornerRadius = 9.0;
        [_dotNumber setHidden:true];
        _dotNumber.text = @"99";
    }
    return _dotNumber;
}
-(UIButton *)detailButton {
    if (!_detailButton) {
        _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _detailButton.titleLabel.numberOfLines = 2;
        [_detailButton setTitleColor:[UIColor colorWithRed:63/255.0 green:105/255.0 blue:164/255.0 alpha:1] forState:UIControlStateNormal];
        [_detailButton setTitleColor:[UIColor colorWithRed:63/255.0 green:105/255.0 blue:164/255.0 alpha:0.5]
                            forState:UIControlStateHighlighted];
        [_detailButton setTitle:@"子公司\n  详情" forState:UIControlStateNormal];
    }
    return _detailButton;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (selected) {
        [self.selectedImageView setImage:[UIImage imageNamed:@"check35"]];
    }else{
        [self.selectedImageView setImage:[UIImage imageNamed:@""]];
    }
}

@end
