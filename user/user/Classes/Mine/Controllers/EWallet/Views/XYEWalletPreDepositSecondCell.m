//
//  XYEWalletPreDepositSecondCell.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositSecondCell.h"

@implementation XYEWalletPreDepositSecondCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatGui];
    }
    return self;
}

-(void)creatGui{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(11);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(XYScreenW/2);
    }];
    
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-40);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_monthLab.mas_left);
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_leftLab.mas_right);
    }];
    
}
-(UILabel *)leftLab
{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.textColor = XYBlackColor;
        _leftLab.font = XYFont_13;
        [self.contentView addSubview:_leftLab];
    }
    return _leftLab;
}

-(UILabel *)rightLab
{
    if(!_rightLab)
    {
        _rightLab = [UILabel new];
        _rightLab.textColor = XYBlackColor;;
        _rightLab.textAlignment = NSTextAlignmentRight;
        _rightLab.font = XYFont_13;
        [self.contentView addSubview:_rightLab];
        
    }
    return _rightLab;
}


-(UILabel *)monthLab
{
    if (!_monthLab) {
        _monthLab = [UILabel new];
        _monthLab.font = XYFont_13;
        _monthLab.textAlignment = NSTextAlignmentRight;
        _monthLab.textColor = XYMainColor;
        [self.contentView addSubview:_monthLab];
    }
    return _monthLab;

}




@end
