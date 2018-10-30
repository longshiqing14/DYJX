//
//  XYOrderShowImgCVCell.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderShowImgCVCell.h"

@implementation XYOrderShowImgCVCell


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.photoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        
    }];
    

    
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


@end
