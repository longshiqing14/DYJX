//
//  HeadSearchView.m
//  user
//
//  Created by longshiqing on 2018/11/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "HeadSearchView.h"

@implementation HeadSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.searchButton];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(5, 15, 5, 15));
    }];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView.mas_right).offset(10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(weakSelf.contentView);
        make.width.mas_equalTo(40);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_left).offset(-10);
        make.top.bottom.equalTo(weakSelf.contentView);
        make.width.mas_equalTo(1);
    }];

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).offset(5);
        make.centerY.equalTo(weakSelf);

    }];

}

#pragma mark - UI
-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 15;
        _contentView.layer.borderWidth = 1.0;
        _contentView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _contentView;
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"ic_search"]];
    }
    return _imageView;
}

-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        _textField.placeholder = @"手机/商号/公司或个人名称或简称/QQ";
    }
    return _textField;
}

-(UILabel *)line {
    if (!_line) {
        _line = [[UILabel alloc] init];
        _line.backgroundColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _line;
}

-(UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setTitle:@"查找" forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor colorWithRed:200.0/255.0 green:200/255.0 blue:200/255.0 alpha:0.5] forState:UIControlStateHighlighted];
    }
    return _searchButton;
}

@end
