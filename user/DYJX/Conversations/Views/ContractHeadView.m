//
//  ContractHeadView.m
//  user
//
//  Created by longshiqing on 2018/11/21.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ContractHeadView.h"

@implementation ContractHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backView];
        [self addSubview:self.goodContractButton];
        [self addSubview:self.nestContractButton];
        [self addSubview:self.generaContractButton];
        [self addSubview:self.hitContractButton];
        [self addSubview:self.addButton];
        [self bringSubviewToFront:self.contentView];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf
    [self.goodContractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(15, 15, 0, 0));
        make.height.equalTo(@20);
    }];

    [self.hitContractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        make.centerY.equalTo(weakSelf.goodContractButton);
        make.height.equalTo(@20);
    }];

    [self.generaContractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodContractButton.mas_right).offset(AutoSize(15));
        make.centerY.equalTo(weakSelf.goodContractButton);
        make.height.equalTo(@20);
    }];

    [self.nestContractButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.hitContractButton.mas_left).offset(-AutoSize(15));
        make.centerY.equalTo(weakSelf.goodContractButton);
        make.height.equalTo(@20);
    }];

    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(50, 0, 0, 0));
    }];

    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(15, 0, 0, 15));
        make.centerY.equalTo(weakSelf.backView);
    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(60, 20, 10, 20));
        make.right.equalTo(weakSelf.addButton.mas_left).offset(-10);
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
-(UIButton *)goodContractButton {
    if (!_goodContractButton) {
        _goodContractButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goodContractButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_goodContractButton setTitle:@"好友联系人" forState:UIControlStateNormal];
        [_goodContractButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
        [_goodContractButton setTitleColor:[UIColor colorWithRed:200/255.0 green:66/255.0 blue:74/255.0 alpha:1] forState:UIControlStateSelected];
        _goodContractButton.tag = 1;
    }
    return _goodContractButton;
}
-(UIButton *)generaContractButton {
    if (!_generaContractButton) {
        _generaContractButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _generaContractButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_generaContractButton setTitle:@"普通联系人" forState:UIControlStateNormal];
        [_generaContractButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
        [_generaContractButton setTitleColor:[UIColor colorWithRed:200/255.0 green:66/255.0 blue:74/255.0 alpha:1] forState:UIControlStateSelected];
        _generaContractButton.tag = 2;
    }
    return _generaContractButton;
}
-(UIButton *)nestContractButton {
    if (!_nestContractButton) {
        _nestContractButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nestContractButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_nestContractButton setTitle:@"新的联系人" forState:UIControlStateNormal];
        [_nestContractButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
        [_nestContractButton setTitleColor:[UIColor colorWithRed:200/255.0 green:66/255.0 blue:74/255.0 alpha:1] forState:UIControlStateSelected];
        _nestContractButton.tag = 3;
    }
    return _nestContractButton;
}
-(UIButton *)hitContractButton {
    if (!_hitContractButton) {
        _hitContractButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hitContractButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_hitContractButton setTitle:@"黑名单" forState:UIControlStateNormal];
        [_hitContractButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
        [_hitContractButton setTitleColor:[UIColor colorWithRed:200/255.0 green:66/255.0 blue:74/255.0 alpha:1] forState:UIControlStateSelected];
        _hitContractButton.tag = 4;
    }
    return _hitContractButton;
}
-(UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addButton setTitle:@"新增" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1] forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:0.5] forState:UIControlStateHighlighted];
        _addButton.tag = 5;
    }
    return _addButton;
}
-(UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 44)];
        _backView.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
    }
    return _backView;
}


@end
