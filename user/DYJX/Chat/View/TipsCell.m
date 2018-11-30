//
//  TipsCell.m
//  user
//
//  Created by 岩  熊 on 2018/11/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "TipsCell.h"

@implementation TipsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
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
