//
//  XYPreDepositVCell.m
//  user
//
//  Created by xingyun on 2017/9/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositVCell.h"

@implementation XYPreDepositVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.iconImageView];
   
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.selectImageView];
        
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(XY_Left_Margin);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
    }];
    
    [self.selectImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    
    
}

#pragma mark - 懒加载

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        _iconImageView.contentMode = UIViewContentModeCenter;
    }
    return _iconImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYBlackColor;
        
    }
    return _titleLB;
}

- (UIImageView*)selectImageView
{
    if (_selectImageView == nil) {
        _selectImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        _selectImageView.contentMode = UIViewContentModeCenter;

        
        _selectImageView.image = [UIImage imageNamed:@"payment_icon_gx"];
        
    }
    return _selectImageView;
}




#pragma mark - cell 初始化

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYPreDepositVCell";
    XYPreDepositVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XYPreDepositVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
