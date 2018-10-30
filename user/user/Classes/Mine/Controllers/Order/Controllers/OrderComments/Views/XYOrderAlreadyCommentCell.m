//
//  XYOrderAlreadyCommentCell.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderAlreadyCommentCell.h"

@implementation XYOrderAlreadyCommentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self) {
        [self creatGui];
    }
    return self;
    
}

-(void)creatGui{
    
    WeakSelf;
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.left.mas_equalTo(XY_Left_Margin);
        make.width.height.mas_equalTo(90);
    }];
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImgV.mas_right).offset(9);
        make.top.mas_equalTo(19);
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(30);
    }];
 
    
}

-(void)setModel:(XYCommentProductListModel *)model
{

    [self.leftBtn setTitle:@"查看评论" forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"追加评论" forState:UIControlStateNormal];
    if ([model.isCanCommentTo boolValue] && [model.certifyState integerValue] == 1) {
//            self.rightBtn.hidden = NO;
        
        self.rightBtn.frame = CGRectMake(XYScreenW+XY_Right_Margin-76, 109-33-13, 76, 33);
        self.leftBtn.frame = CGRectMake(XYScreenW+XY_Right_Margin*2-76*2, 109-33-13, 76, 33);
//        [self.rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(XY_Right_Margin);
//            make.bottom.mas_equalTo(-13);
//            make.width.mas_equalTo(76);
//            make.height.mas_equalTo(33);
//        }];
//        [self.leftBtn mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(_rightBtn.mas_left).offset(XY_Right_Margin);
//            make.top.mas_equalTo(_rightBtn.mas_top);
//            make.width.mas_equalTo(_rightBtn.mas_width);
//            make.height.mas_equalTo(_rightBtn.mas_height);
//        }];
//        self.statusLab.text = @"审核已通过";
    
        
    }else
    {
//         self.rightBtn.hidden = YES;
        self.rightBtn.frame = CGRectZero;
        self.leftBtn.frame = CGRectMake(XYScreenW+XY_Right_Margin-76, 109-33-13, 76, 33);
//        [self.rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(XY_Right_Margin);
//            make.bottom.mas_equalTo(-13);
//            make.width.mas_equalTo(0);
//            make.height.mas_equalTo(33);
//        }];
//    
//        
//        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(_rightBtn.mas_left);
//            make.bottom.mas_equalTo(-13);
//            make.width.mas_equalTo(76);
//            make.height.mas_equalTo(33);
//        }];
   
//        self.statusLab.text = @"正在审核中";
       
        
    }
    
//    [self layoutIfNeeded];
    
//    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_iconImgV.mas_right).offset(10);
//        make.right.mas_equalTo(_leftBtn.mas_left).offset(-10);
//        make.top.mas_equalTo(_leftBtn.mas_top);
//        make.bottom.mas_equalTo(_leftBtn.mas_bottom);
//    }];

}


-(UIImageView *)iconImgV
{
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc] init];
        _iconImgV.layer.borderColor = XYGrayColor.CGColor;
        _iconImgV.layer.cornerRadius = 5;
        _iconImgV.layer.borderWidth = 0.5;
        _iconImgV.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconImgV];
    }
    return _iconImgV;
    
}

-(UILabel *)descLab
{
    if (!_descLab) {
        _descLab = [UILabel new];
        _descLab.numberOfLines = 2;
        _descLab.lineBreakMode = NSLineBreakByWordWrapping;
        _descLab.font = XYFont_13;
        [self.contentView addSubview:_descLab];
    }
    return _descLab;
}

-(UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc] init];
        _leftBtn.frame = CGRectZero;
        _leftBtn.titleLabel.font = XYFont_14;
        [_leftBtn addTarget:self action:@selector(leftBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBtn setTitleColor:XYBlackColor forState:UIControlStateNormal];
        _leftBtn.layer.borderColor = XYBlackColor.CGColor;
        _leftBtn.layer.borderWidth = 0.5;
        _leftBtn.layer.cornerRadius = 3;
        _leftBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:_leftBtn];
    }
    return _leftBtn;
}


-(UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] init];
        _rightBtn.titleLabel.font = XYFont_14;
        _rightBtn.frame = CGRectZero;
        [_rightBtn addTarget:self action:@selector(rightBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setTitleColor:self.rightColor forState:UIControlStateNormal];
        _rightBtn.layer.borderColor = self.rightColor.CGColor;
        _rightBtn.layer.borderWidth = 0.5;
        _rightBtn.layer.cornerRadius = 3;
        _rightBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:_rightBtn];
    }
    return _rightBtn;
}

-(UILabel *)statusLab{

    if (!_statusLab) {
        _statusLab = [UILabel new];
        _statusLab.font = XYFont_13;
        [self.contentView addSubview:_statusLab];
        _statusLab.textColor = XYMainColor;
    }
    return _statusLab;
}


-(UIColor *)rightColor
{
    if (!_rightColor) {
        _rightColor = XYRGBColor(163, 145, 93);
    }
    return _rightColor;
}

-(void)leftBtnHandler:(UIButton *)sender{
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(btnHandlerWithIndex:btnTitle:)]) {
        [self.delegate btnHandlerWithIndex:self.index btnTitle:@"查看评论"];
    }
}

-(void)rightBtnHandler:(UIButton *)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(btnHandlerWithIndex:btnTitle:)]) {
        [self.delegate btnHandlerWithIndex:self.index btnTitle:@"追加评论"];
    }
    
    
}
@end
