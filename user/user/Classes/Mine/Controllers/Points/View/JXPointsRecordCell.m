//
//  JXPointsRecordCell.m
//  user
//
//  Created by 岩  熊 on 2017/12/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXPointsRecordCell.h"
#import "XYEWalletBalanceRecordModel.h"

#import "XYEWalletCommon.h"

@implementation JXPointsRecordCell



static CGFloat const iconImageHeight = 40;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.timeLB];
        
        [self.contentView addSubview:self.moneyLB];
        
        
    }
    return self;
}


- (void)setListModel:(XYEWalletBalanceRecordModel *)listModel
{
    _listModel = listModel;
    
//    if ([_listModel.type isEqualToString:transationType_recharge]) {
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_chong"];
//    }else if ([_listModel.type isEqualToString:transationType_cashback]){
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_chong"];
//    }else if ([_listModel.type isEqualToString:transationType_order]){
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_mai"];
//    }else if ([_listModel.type isEqualToString:transationType_order_rollpay]){
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_tui"];
//    }
    
    self.titleLB.text = _listModel.typeLabel;
    
    self.timeLB.text = _listModel.transactionTime;
    
    self.moneyLB.text = _listModel.realTransactionAmt;
    
    if ([_listModel.direction isEqualToString:@"+"]) {
        self.moneyLB.textColor = XYMainColor;
    }else{
        self.moneyLB.textColor = XYBlackColor;
    }
    
}





- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
//    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(XY_Left_Margin);
//        make.centerY.mas_equalTo(supperView.mas_centerY);
//        make.height.width.mas_equalTo(iconImageHeight);
//    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(supperView.mas_left).offset(10);
        make.bottom.mas_equalTo(supperView.mas_centerY).offset(-4);
    }];
    
    [self.timeLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(supperView.mas_left).offset(10);
        make.top.mas_equalTo(supperView.mas_centerY).offset(4);
    }];
    
    [self.moneyLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
    }];
    
}






#pragma mark - 懒加载

//- (UIImageView*)iconImageView
//{
//    if (_iconImageView == nil) {
//        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//    }
//    return _iconImageView;
//}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.textColor = XYBlackColor;
        
    }
    return _titleLB;
}

- (UILabel*)timeLB
{
    if (_timeLB == nil) {
        _timeLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _timeLB.font = XYFont_14;
        _timeLB.textAlignment = NSTextAlignmentLeft;
        _timeLB.textColor = [UIColor colorWithHexString:@"999999"];
        
        
    }
    return _timeLB;
}

- (UILabel*)moneyLB
{
    if (_moneyLB == nil) {
        _moneyLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _moneyLB.font = XYFont_14;
        _moneyLB.textAlignment = NSTextAlignmentRight;
        //        _moneyLB.textColor = XYBlackColor;
        
    }
    return _moneyLB;
}





#pragma mark - 创建 cell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYEWalletBalanceRecordTVCell";
    JXPointsRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[JXPointsRecordCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
