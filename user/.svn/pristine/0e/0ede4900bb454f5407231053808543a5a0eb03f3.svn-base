//
//  XYEWalletBalanceFirstCell.m
//  user
//
//  Created by xingyun on 2017/10/24.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletBalanceFirstCell.h"
@interface XYEWalletBalanceFirstCell ()

@property(nonatomic,strong)UILabel *titleLab;



@end
@implementation XYEWalletBalanceFirstCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatGui];
    }
    return self;

}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    
    self.titleLab.text = titleStr;
    
}
-(void)creatGui{

    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(9);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    WeakSelf;
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-16);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(14);
    }];
    
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_iconImgV.mas_left).offset(-10);
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_titleLab.mas_right);
    }];
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_14;
        [self.contentView addSubview:_titleLab];
        
    }
    return _titleLab;
}
-(UILabel *)descLab
{
    if (!_descLab) {
        _descLab = [UILabel new];
        _descLab.font = XYFont_14;
        _descLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_descLab];
        
    }
    return _descLab;
}

-(UIImageView *)iconImgV
{
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc] init];
        _iconImgV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_iconImgV];
    }
    return _iconImgV;
}


@end
