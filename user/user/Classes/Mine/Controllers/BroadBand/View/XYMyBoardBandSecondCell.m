//
//  XYMyBoardBandSecondCell.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandSecondCell.h"

@implementation XYMyBoardBandSecondCell



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
    WeakSelf;
    [self.indicatorImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(15);
    }];
    
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(19);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImg.mas_right).offset(5);
        make.right.mas_equalTo(_indicatorImgV.mas_left);
        make.top.bottom.mas_equalTo(0);
    }];
}

-(UIImageView *)iconImg
{
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.image = [UIImage imageNamed:@"ic_renewal"];
        [self.contentView addSubview:_iconImg];
        
    }
    return _iconImg;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_14;
        _titleLab.textColor = XYBlackColor;
        _titleLab.text = @"续约记录";
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;

}


-(UIImageView *)indicatorImgV
{
    if (!_indicatorImgV) {
        _indicatorImgV = [[UIImageView alloc] init];
        _indicatorImgV.image = [UIImage imageNamed:@"order_icon_more"];
        [self.contentView addSubview:_indicatorImgV];
    }
    return _indicatorImgV;
    
}





@end
