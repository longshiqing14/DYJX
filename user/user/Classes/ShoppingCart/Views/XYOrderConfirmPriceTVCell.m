//
//  XYOrderConfirmPriceTVCell.m
//  user
//
//  Created by xingyun on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmPriceTVCell.h"

@implementation XYOrderConfirmPriceTVCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = [UIColor whiteColor];
        //        self.accessoryType   = UITableViewCellAccessoryNone;
        
        
        
        
        [self.contentView addSubview:self.titleLB];
        
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
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    
}


#pragma mark - 懒加载

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
    static NSString *ID = @"XYOrderConfirmPriceTVCell";
    XYOrderConfirmPriceTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYOrderConfirmPriceTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
