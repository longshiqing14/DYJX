//
//  CompanyTitleAndContentCell.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "CompanyTitleAndContentCell.h"

@implementation CompanyTitleAndContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.contentLb];
    [self.contentView addSubview:self.separatorLineView];
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.titleLb.mas_right).mas_equalTo(5);
        make.right.mas_equalTo(-10);
//        make.top.mas_equalTo(0);
//        make.bottom.mas_equalTo(1);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.contentLb.mas_left).mas_equalTo(-5);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(1);
        
    }];
    
    [self.separatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _titleLb;
}

- (UITextField *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UITextField alloc]init];
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _contentLb;
}

- (UIView *)separatorLineView{
    if (!_separatorLineView) {
        _separatorLineView = [[UIView alloc] init];
        _separatorLineView.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
    }
    return _separatorLineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
