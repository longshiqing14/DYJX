//
//  CompareHeadView.m
//  user
//
//  Created by longshiqing on 2019/1/29.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "CompareHeadView.h"

@implementation CompareHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
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
        make.left.bottom.top.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(5, 20, 5, 20));
    }];

    //    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.equalTo(weakSelf.contentView);
    //    }];

    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 10));
        make.width.mas_equalTo(44);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.searchButton.mas_left).offset(-5);
        make.top.bottom.equalTo(weakSelf.contentView);
        make.width.mas_equalTo(0.5);
    }];

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).offset(5);
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.line.mas_left);
    }];

}

#pragma mark - UI
-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 20;
        _contentView.layer.borderWidth = 0.5;
        _contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

-(UIImageView *)imageView {
    if (!_imageView) {
        UIImage *image = [UIImage imageNamed:@"ic_search"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.frame = CGRectMake(10, 9, 22, 22);
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
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

-(UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_searchButton setTitle:@"查找" forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1] forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:0.5] forState:UIControlStateHighlighted];
    }
    return _searchButton;
}

@end
