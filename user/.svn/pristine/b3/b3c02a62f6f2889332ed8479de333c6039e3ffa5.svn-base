//
//  XYEWalletPreDepositFourthCell.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositFourthCell.h"

@implementation XYEWalletPreDepositFourthCell

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
        make.width.mas_equalTo(XYScreenW/3);
    }];
    [self.middleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(XYScreenW/3);
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-11);
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_middleLab.mas_right);
    }];
    
}
-(UILabel *)leftLab
{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.textColor = XYBlackColor;
        _leftLab.font = XYFont_13;
        _leftLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_leftLab];
    }
    return _leftLab;
}
-(UILabel *)middleLab
{
    if (!_middleLab) {
        _middleLab = [UILabel new];
        _middleLab.textAlignment = NSTextAlignmentCenter;
        _middleLab.font = XYFont_13;
        _middleLab.textColor = XYBlackColor;
        [self.contentView addSubview:_middleLab];
    }
    return _middleLab;
}

-(UILabel *)rightLab
{
    if(!_rightLab)
    {
        _rightLab = [UILabel new];
        _rightLab.textColor = XYBlackColor;;
        _rightLab.textAlignment = NSTextAlignmentCenter;
        _rightLab.font = XYFont_13;
        [self.contentView addSubview:_rightLab];
        
    }
    return _rightLab;
}




@end
