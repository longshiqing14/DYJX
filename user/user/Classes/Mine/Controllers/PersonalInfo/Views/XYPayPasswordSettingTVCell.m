//
//  XYPayPasswordSettingTVCell.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPayPasswordSettingTVCell.h"

@implementation XYPayPasswordSettingTVCell

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
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(14);
        make.top.bottom.mas_offset(0);
        make.width.mas_offset(86);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLab.mas_right);
        make.width.mas_equalTo(0.5);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
}


-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGrayColor;
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_14;
        [self.contentView addSubview:_titleLab];
        _titleLab.textColor = XYFontTitleColor;
    }
    return _titleLab;

}



@end
