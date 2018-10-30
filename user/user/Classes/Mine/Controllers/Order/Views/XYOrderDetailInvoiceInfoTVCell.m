//
//  XYOrderDetailInvoiceInfoTVCell.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailInvoiceInfoTVCell.h"

@implementation XYOrderDetailInvoiceInfoTVCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = XYWhiteColor;
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.arrowImage];
        
        [self.contentView addSubview:self.subLB];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
    }];
    
    [self.arrowImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-8);
        //        make.top.mas_equalTo(10);
    }];
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(self.arrowImage.mas_left).mas_equalTo(-5);
//        make.top.mas_equalTo(10);
    }];
    

}


#pragma mark - 懒加载

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYFontTitleColor;
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLB;
}

- (UILabel *)subLB {
    if (_subLB == nil) {
        _subLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _subLB.font          = XYFont_14;
        _subLB.textAlignment = NSTextAlignmentRight;
        _subLB.textColor     = XYFontTitleColor;
    }
    return _subLB;
}

- (UIImageView *)arrowImage{
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc]init];
        _arrowImage.image = [UIImage imageNamed:@"order_icon_more"];
    }
    return _arrowImage;
}

#pragma mark - cell  创建
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderDetailInvoiceInfoTVCell";
    XYOrderDetailInvoiceInfoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYOrderDetailInvoiceInfoTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = XYWhiteColor;
    }
    
    return cell;
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
