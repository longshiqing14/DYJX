//
//  GroupHeadView.m
//  user
//
//  Created by longshiqing on 2018/11/23.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "GroupHeadView.h"

@implementation GroupHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.addButton];
//        [self addSubview:self.backView];
//        [self.backView addSubview:self.innerButton];
//        [self.backView addSubview:self.outsideButton];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(15, 0, 0, 15));
        make.centerY.equalTo(weakSelf).offset(0);
    }];

//    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(60, 0, 0, 0));
//    }];
//
//    [self.outsideButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.bottom.top.equalTo(weakSelf.backView).insets(UIEdgeInsetsMake(2, 2, 2, 2));
//        make.width.mas_equalTo(kScreenWidth/2.0);
//    }];
//
//    [self.innerButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.top.equalTo(weakSelf.backView).insets(UIEdgeInsetsMake(2, 2, 2, 2));
//        make.width.mas_equalTo(kScreenWidth/2.0);
//    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(10, 20, 10, 20));
        make.right.equalTo(weakSelf.addButton.mas_left).offset(-10);
        make.height.equalTo(@40);
    }];

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

-(UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addButton setTitle:@"新增公司" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1] forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:0.5] forState:UIControlStateHighlighted];
        _addButton.tag = 5;
    }
    return _addButton;
}
-(UIButton *)innerButton {
    if (!_innerButton) {
        _innerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _innerButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_innerButton setTitle:@"内部群" forState:UIControlStateNormal];
        [_innerButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1] forState:UIControlStateNormal];
        [_innerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_innerButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_innerButton setSelected:YES];
        [_innerButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:30/255.0 green:38/255.0 blue:58/255.0 alpha:1]] forState:UIControlStateSelected];
        _innerButton.tag = 1;
    }
    return _innerButton;
}
-(UIButton *)outsideButton {
    if (!_outsideButton) {
        _outsideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _outsideButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_outsideButton setTitle:@"外部群" forState:UIControlStateNormal];
        [_outsideButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1] forState:UIControlStateNormal];
        [_outsideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_outsideButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_outsideButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:30/255.0 green:38/255.0 blue:58/255.0 alpha:1]] forState:UIControlStateSelected];
        _outsideButton.tag = 2;
    }
    return _outsideButton;
}
-(UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderColor = [UIColor colorWithRed:30/255.0 green:38/255.0 blue:58/255.0 alpha:1].CGColor;
        _backView.layer.borderWidth = 2;
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

@end
