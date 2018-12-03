//
//  TipsFooter.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "TipsFooter.h"

@implementation TipsFooter
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    [self.contentView addSubview:self.contentLb];
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.bottom.mas_equalTo(0);
    }];
}

- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc]init];
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.numberOfLines = 0;
        _contentLb.textAlignment = NSTextAlignmentCenter;
        _contentLb.textColor = [UIColor colorWithHexString:@"999999"];
        _contentLb.text = @"用户可用商户号ID、手机号进行登录；商户号ID由平台在用户注册时自动分配；银行账户号可使用于用户收付款，请准确填写。";
    }
    return _contentLb;
}

@end
