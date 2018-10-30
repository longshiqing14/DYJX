//
//  XYEWalletPreDepositReturnListTVCell.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositReturnListTVCell.h"

#import "XYEWalletPreDepositReturnListModel.h"

@implementation XYEWalletPreDepositReturnListTVCell


//static CGFloat const iconImageHeight = 40;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.timeLB];
        
        [self.contentView addSubview:self.moneyLB];
        
        
    }
    return self;
}


- (void)setListModel:(XYEWalletPreDepositReturnListModel *)listModel
{
    _listModel = listModel;
    
    
    self.titleLB.text = _listModel.productName;
    
    self.timeLB.text = _listModel.formatCreateTime;
    
    self.moneyLB.text = [NSString stringWithFormat:@"￥%@",_listModel.price];
    
}





- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    
    CGSize size = [XYStringHandle sizeWithString:self.moneyLB.text font:XYFont_14 viewWidth:1000];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin-size.width);
        make.bottom.mas_equalTo(supperView.mas_centerY).offset(-4);
    }];
    
    [self.timeLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin-size.width);
        make.top.mas_equalTo(supperView.mas_centerY).offset(4);
    }];
    
    [self.moneyLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(size.width);
    }];
    
}






#pragma mark - 懒加载

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.textColor = XYFontTitleColor;
        
    }
    return _titleLB;
}

- (UILabel*)timeLB
{
    if (_timeLB == nil) {
        _timeLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _timeLB.font = XYFont_14;
        _timeLB.textAlignment = NSTextAlignmentLeft;
        _timeLB.textColor = XYGrayColor;
        
    }
    return _timeLB;
}

- (UILabel*)moneyLB
{
    if (_moneyLB == nil) {
        _moneyLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _moneyLB.font = XYFont_14;
        _moneyLB.textAlignment = NSTextAlignmentRight;
        _moneyLB.textColor = XYMainColor;
        
    }
    return _moneyLB;
}




#pragma mark - 创建 cell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYEWalletPreDepositReturnListTVCell";
    XYEWalletPreDepositReturnListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYEWalletPreDepositReturnListTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
