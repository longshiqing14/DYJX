//
//  CompanyTitleAndSelcetedArrowCell.m
//  user
//
//  Created by 岩  熊 on 2018/12/6.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "CompanyTitleAndSelcetedArrowCell.h"
@interface CompanyTitleAndSelcetedArrowCell()
@property (nonatomic, assign) BOOL isSelect;
@end

@implementation CompanyTitleAndSelcetedArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.ArrowBTN];
    [self.contentView addSubview:self.separatorLineView];
    [self layoutIfNeeded];
}

- (void)selectorType:(UIButton*) sender{
    self.isSelect = !self.isSelect;
    if (self.isSelect) {
      [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
        if (self.block) {
            self.block(SelcetedTypeActive);
        }
    }else{
      [sender setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
        if (self.block) {
            self.block(SelcetedTypeNone);
        }
    }
    
}

- (void)layoutSubviews{
    [self.ArrowBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.mas_equalTo(self.titleLb.mas_right).mas_equalTo(5);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.ArrowBTN.mas_left).mas_equalTo(-5);
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

- (UIButton *)ArrowBTN{
    if (!_ArrowBTN) {
        _ArrowBTN  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ArrowBTN addTarget:self action:@selector(selectorType:) forControlEvents:(UIControlEventTouchUpInside)];
        [_ArrowBTN setBackgroundImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    }
    return _ArrowBTN;
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
