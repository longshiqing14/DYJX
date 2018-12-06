//
//  CompanyTitleAndArrowCell.m
//  user
//
//  Created by 岩  熊 on 2018/12/6.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "CompanyTitleAndArrowCell.h"

@implementation CompanyTitleAndArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.ArrowImage];
    [self.contentView addSubview:self.separatorLineView];
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    [self.ArrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.mas_equalTo(self.titleLb.mas_right).mas_equalTo(5);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.ArrowImage.mas_left).mas_equalTo(-5);
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

- (UIView *)separatorLineView{
    if (!_separatorLineView) {
        _separatorLineView = [[UIView alloc] init];
        _separatorLineView.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
    }
    return _separatorLineView;
}

- (UIImageView *)ArrowImage{
    if (!_ArrowImage) {
        _ArrowImage  = [[UIImageView alloc]init];
        [_ArrowImage setImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _ArrowImage;
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
