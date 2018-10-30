//
//  XYPersonalInfoTVCell.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPersonalInfoTVCell.h"

@implementation XYPersonalInfoTVCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatGui];
    }
    return self;

}


-(void)creatGui{
    WeakSelf;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(75);
    }];

    
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_14;

        _titleLab.textColor = XYFontTitleColor;
        [self.contentView addSubview:_titleLab];
    
    }
    return  _titleLab;
}

@end
