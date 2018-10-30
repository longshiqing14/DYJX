//
//  XYMyBoardBandFirstCell.m
//  user
//
//  Created by xingyun on 2017/10/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandFirstCell.h"

@implementation XYMyBoardBandFirstCell

static CGFloat const topH = 15.0;

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
        make.left.mas_equalTo(XY_Left_Margin);
        make.top.mas_equalTo(topH);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(14);
    }];
    
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right);
        make.right.mas_equalTo(XY_Right_Margin);
        make.bottom.mas_equalTo(-topH);
        make.top.mas_equalTo(topH);
    }];
    

}

-(UILabel *)leftLab
{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.font = XYFont_14;
        _leftLab.textColor = XYBlackColor;
        [self.contentView addSubview:_leftLab];
    }
    return _leftLab;
}


-(UILabel *)rightLab
{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.font = XYFont_14;
        _rightLab.textColor = XYBlackColor;
        _rightLab.numberOfLines = 0;
        _rightLab.lineBreakMode = NSLineBreakByWordWrapping;
        _rightLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_rightLab];
    }
    return _rightLab;

}


@end
