//
//  JXShareImageView.m
//  user
//
//  Created by 岩  熊 on 2018/1/9.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXShareImageView.h"

@implementation JXShareImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self initsubView];
        
    }
    return self;
}

- (void)initsubView{
    [self addSubview:self.contentImage];
    [self addSubview:self.shotScreenImage];
    [self.contentImage addSubview:self.QRCodeImageView];
    self.contentImage.image = [UIImage imageNamed:@"homeshare_bg"];
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    WeakSelf;
//    [self.contentImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(100);
//    }];
//    
//    [self.shotScreenImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(0);
//        make.bottom.mas_equalTo(weakSelf.contentImage.mas_top).mas_equalTo(0);
//    }];
}
- (UIImageView *)contentImage{
    if (!_contentImage) {
        _contentImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 18, kScreenWidth, 150)];
    }
    return _contentImage;
}

- (UIImageView *)shotScreenImage{
    if (!_shotScreenImage) {
        _shotScreenImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 18)];
    }
    return _shotScreenImage;
}

- (UIImageView *)QRCodeImageView{
    if (!_QRCodeImageView) {
        _QRCodeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 18, 116, 116)];
        _QRCodeImageView.layer.borderWidth = 3.0;
        _QRCodeImageView.layer.borderColor = [UIColor colorWithHexString:@"#D86457"].CGColor;
    }
    return _QRCodeImageView;
}
@end
