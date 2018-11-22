//
//  ConpanyHeadView.m
//  user
//
//  Created by longshiqing on 2018/11/21.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ConpanyHeadView.h"

@implementation ConpanyHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.addButton];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(15, 0, 0, 15));
        make.centerY.equalTo(weakSelf);
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
@end
