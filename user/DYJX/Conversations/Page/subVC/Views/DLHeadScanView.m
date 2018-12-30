//
//  DLHeadScanView.m
//  user
//
//  Created by longshiqing on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DLHeadScanView.h"

@implementation DLHeadScanView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contractButton];
        [self addSubview:self.scanButton];
        [self addSubview:self.qrCodeButton];
    }
    return self;
}

-(UIButton *)contractButton {
    if (!_contractButton) {
        _contractButton = [HeadView buttonWithType:UIButtonTypeCustom];
        _contractButton.frame = CGRectMake(10, 0, (kScreenWidth - 20)/3.0, 90);
        [_contractButton setImage:[UIImage imageNamed:@"phone163"] forState:UIControlStateNormal];
        [_contractButton setTitle:@"添加手机联系人" forState:UIControlStateNormal];
        [_contractButton setTitleColor:[UIColor colorWithHexString:@"444444"] forState:UIControlStateNormal];
        _contractButton.tag = 1;
        _contractButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _contractButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _contractButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _contractButton;
}

-(UIButton *)scanButton {
    if (!_scanButton) {
        _scanButton = [HeadView buttonWithType:UIButtonTypeCustom];
        _scanButton.frame = CGRectMake(10 + (kScreenWidth - 20)/3.0, 0, (kScreenWidth - 20)/3.0, 90);
        _scanButton.tag = 2;
        [_scanButton setImage:[UIImage imageNamed:@"groupscan"] forState:UIControlStateNormal];
        [_scanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_scanButton setTitleColor:[UIColor colorWithHexString:@"444444"] forState:UIControlStateNormal];
        _scanButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _scanButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _scanButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _scanButton;
}

-(UIButton *)qrCodeButton {
    if (!_qrCodeButton) {
        _qrCodeButton = [HeadView buttonWithType:UIButtonTypeCustom];
        _qrCodeButton.frame = CGRectMake(10 + (kScreenWidth - 20)*2/3.0, 0, (kScreenWidth - 20)/3.0, 90);
        _qrCodeButton.tag = 3;
        [_qrCodeButton setImage:[UIImage imageNamed:@"myqrcode"] forState:UIControlStateNormal];
        [_qrCodeButton setTitle:@"我的二维码" forState:UIControlStateNormal];
        [_qrCodeButton setTitleColor:[UIColor colorWithHexString:@"444444"] forState:UIControlStateNormal];
        _qrCodeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _qrCodeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _qrCodeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _qrCodeButton;
}

@end
