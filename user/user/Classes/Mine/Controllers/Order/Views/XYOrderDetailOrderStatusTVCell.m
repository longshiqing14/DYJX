//
//  XYOrderDetailOrderStatusTVCell.m
//  user
//
//  Created by xingyun on 2017/9/22.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailOrderStatusTVCell.h"

#import "XYOrderDetailOrderStatusModel.h"

@implementation XYOrderDetailOrderStatusTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.timeLB];
        
        [self.contentView addSubview:self.lineUpView];
        
        [self.contentView addSubview:self.lineDownView];
        
    }
    return self;
}


- (void)setStatusModel:(JXLogisticInfoDataModel *)statusModel
{
    _statusModel = statusModel;
    
    self.titleLB.text = _statusModel.context;
    
    self.timeLB.text = _statusModel.time;
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(XY_Right_Margin);
//        make.bottom.mas_equalTo(supperView.mas_centerY).offset(-5);
    }];
    
    [self.timeLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_titleLB.mas_bottom).offset(10);
//        make.top.mas_equalTo(supperView.mas_centerY).offset(5);
    }];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(_titleLB.mas_centerY);
        make.width.height.mas_equalTo(9);
    }];
    
    [self.lineUpView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_iconImageView.mas_centerX);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(_iconImageView.mas_top).offset(-3);
        make.width.mas_equalTo(1);
    }];
    
    [self.lineDownView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_iconImageView.mas_centerX);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(3);
        make.width.mas_equalTo(1);
    }];
    

    
}



- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _iconImageView.backgroundColor = XYGrayColor;
        
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 5;
    }
    return _iconImageView;
}

- (UIView*)lineUpView
{
    if (_lineUpView == nil) {
        _lineUpView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineUpView.backgroundColor = XYLineColor;
    }
    return _lineUpView;
}

- (UIView*)lineDownView
{
    if (_lineDownView == nil) {
        _lineDownView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineDownView.backgroundColor = XYLineColor;
        
    }
    return _lineDownView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        //自动折行设置
        _titleLB.lineBreakMode = UILineBreakModeWordWrap;
        _titleLB.numberOfLines = 0;
        _titleLB.font = XYFont_16;
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


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderDetailOrderStatusTVCell";
    XYOrderDetailOrderStatusTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYOrderDetailOrderStatusTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
