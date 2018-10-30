//
//  JXElectronicInvoiceCheckCell.m
//  user
//
//  Created by 岩  熊 on 2018/3/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXElectronicInvoiceCheckCell.h"

@implementation JXElectronicInvoiceCheckCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)initSubViews{
//    [self.topLineView setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
    
    [self.confirmBNT setTitle:@"查看发票" forState:UIControlStateNormal];
    self.confirmBNT.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.confirmBNT addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    
    [self layoutIfNeeded];
}

- (void)confirm:(UIButton *)sender{
    if (self.confirmBlock) {
        self.confirmBlock();
    }
}

- (void)layoutSubviews{
    WeakSelf;
    
    [self.contentView addSubview:self.confirmBNT];
    [self.contentView addSubview:self.line];
    [self.confirmBNT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(91, 33));
    }];
    
//    [self.contentView addSubview:self.topLineView];
//    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView).with.offset(0);
        make.right.mas_equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(0);
    }];

}

- (UIButton *)confirmBNT{
    if (!_confirmBNT) {
        _confirmBNT = [UIButton buttonWithType:UIButtonTypeSystem];
//        [_confirmBNT setBackgroundColor:[UIColor colorWithHexString:@"#EC3B2C"]];
        [_confirmBNT setTitleColor:[UIColor colorWithHexString:@"#EC3B2C"] forState:(UIControlStateNormal)];
        _confirmBNT.layer.borderColor = [UIColor colorWithHexString:@"#EC3B2C"].CGColor;
        _confirmBNT.layer.borderWidth = 0.5;
        _confirmBNT.layer.cornerRadius = 3.0;
        _confirmBNT.layer.masksToBounds = YES;
    }
    return _confirmBNT;
}

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    }
    return _line;
}

//- (UIView *)topLineView{
//    if (!_topLineView) {
//        _topLineView = [[UIView alloc]init];
//    }
//    return _topLineView;
//}

@end
