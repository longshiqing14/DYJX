//
//  XYAddCommentImgCVCell.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYAddCommentImgCVCell.h"

@implementation XYAddCommentImgCVCell



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.photoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(13);
        make.right.mas_equalTo(-10);
        
    }];
    
    [self.deleImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(26);
    }];
    
    
}


-(UIButton *)deleImgBtn
{

    if (!_deleImgBtn) {
        _deleImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleImgBtn setImage:[UIImage imageNamed:@"comment-delete"] forState:UIControlStateNormal];
        [_deleImgBtn addTarget:self action:@selector(deleImgBtnHan:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_deleImgBtn];
    }
    return _deleImgBtn;
}

-(UIImageView *)photoImgView
{

    if (!_photoImgView) {
        _photoImgView = [[UIImageView alloc] init];
//        _photoImgView.backgroundColor = XYMainColor;
        [self.contentView addSubview:_photoImgView];
        _photoImgView.contentMode = UIViewContentModeScaleAspectFit;
        _photoImgView.layer.masksToBounds=YES;
    }
    
    return _photoImgView;
}


#pragma mark 

-(void)deleImgBtnHan:(UIButton *)sender{


    if (self.delegate && [self.delegate respondsToSelector:@selector(deleBtnHandler:)]) {
        [self.delegate deleBtnHandler:self.index];
    }
}



@end
