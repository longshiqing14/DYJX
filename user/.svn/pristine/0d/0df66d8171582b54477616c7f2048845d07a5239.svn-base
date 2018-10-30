//
//  XYOrderConfirmInvoiceSubTVCell.m
//  user
//
//  Created by xingyun on 2017/10/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmInvoiceSubTVCell.h"

@implementation XYOrderConfirmInvoiceSubTVCell

static CGFloat const iconImageHeight = 20;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = [UIColor whiteColor];
        //        self.accessoryType   = UITableViewCellAccessoryNone;
        
        
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.explainButton];
        [self.contentView addSubview:self.subLB];
        
        
    }
    return self;
}





- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(XY_Left_Margin);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.explainButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_titleLB.mas_right).mas_offset(-15);
        make.width.mas_equalTo(60);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_iconImageView.mas_left).offset(-5);
        make.top.bottom.mas_equalTo(0);
    }];
    

}

-(void)Clock{
    if (self.PopClock) {
        self.PopClock();
    }
}

#pragma mark - 懒加载

-(UIButton *)explainButton{
    if (!_explainButton) {
        _explainButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_explainButton addTarget:self action:@selector(Clock) forControlEvents:(UIControlEventTouchUpInside)];
        [_explainButton setImage:SETIMAGENAME(@"ic_order_hint") forState:(UIControlStateNormal)];
    }
    return _explainButton;
}




- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        _iconImageView.image = [UIImage imageNamed:@"order_icon_more"];
        
        _iconImageView.contentMode = UIViewContentModeCenter;
        
//        _iconImageView.layer.borderWidth = 0.5;
//        _iconImageView.layer.borderColor = XYLineColor.CGColor;
//        
//        _iconImageView.layer.cornerRadius = 5;
//        _iconImageView.layer.masksToBounds = YES;
        
    }
    return _iconImageView;
}

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYBlackColor;
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
        _subLB.textColor     = XYBlackColor;
    }
    return _subLB;
}















#pragma mark - 创建 cell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderConfirmInvoiceSubTVCell";
    XYOrderConfirmInvoiceSubTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYOrderConfirmInvoiceSubTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
