//
//  JXElectronicInvoiceCell.m
//  user
//
//  Created by 岩  熊 on 2018/3/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXElectronicInvoiceCell.h"

@implementation JXElectronicInvoiceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLb];
    [self.contentView addSubview:self.line];
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    WeakSelf;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.contentView).with.offset(15);
    }];
    
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.contentView).with.offset(-15);
        make.left.mas_equalTo(weakSelf.titleLabel.mas_right).with.offset(10);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView).with.offset(0);
        make.right.mas_equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
        make.bottom.mas_equalTo(0);
    }];
 
}



- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 1;
    }
    return _titleLabel;
}

- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _contentLb.numberOfLines = 1;
    }
    return _contentLb;
}

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    }
    return _line;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
