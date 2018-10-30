//
//  XYBoardBandRenewalCell.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBoardBandRenewalCell.h"

@implementation XYBoardBandRenewalCell



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
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(50);
        make.bottom.mas_equalTo(-13);
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_statusLab.mas_left).offset(-10);
        make.centerY.mas_equalTo(_statusLab.mas_centerY);
        make.left.mas_equalTo(XY_Left_Margin);
        make.height.mas_equalTo(14);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(_statusLab.mas_left).offset(-10);
        make.top.mas_equalTo(13);
        make.height.mas_equalTo(14);
    }];


}


-(UILabel *)titleLab
{
    if (!_titleLab ) {
        
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_14;
        _titleLab.textColor = XYBlackColor;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;

}

-(UILabel *)timeLab
{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.font = XYFont_14;
        _timeLab.textColor = XYGrayColor;
        [self.contentView addSubview:_timeLab];
    }
    return _timeLab;

}

-(UILabel *)statusLab
{
    if (!_statusLab) {
        _statusLab = [UILabel new];
        _statusLab.font = XYFont_14;
        _statusLab.textColor = XYMainColor;
        _statusLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_statusLab];
    }
    return _statusLab;

}


@end
