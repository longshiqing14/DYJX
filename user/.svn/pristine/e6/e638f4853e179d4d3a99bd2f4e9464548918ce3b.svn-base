//
//  XYHomePopAdsView.m
//  user
//
//  Created by xingyun on 2017/9/18.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomePopAdsView.h"

#import "XYCycleImageModel.h"

@interface XYHomePopAdsView ()
/** 广告图片 */
@property(nonatomic,strong) UIImageView *adsImgView;
/** 取消按钮 */
@property(strong,nonatomic) UIButton *cancelBtn ;

@property (nonatomic ,strong) XYCycleImageModel * model;

@end

@implementation XYHomePopAdsView

- (instancetype)initWithModel:(XYCycleImageModel*)model
{
    self = [super init];
    if (self) {
        
        self.model = model;
    }
    return self;
    
}


-(void)show
{
    self.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
    
    WeakSelf;
    CGFloat imgW = XYScreenW - 76;
    CGFloat imgH = imgW * 795 /594;
    [self.adsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.mas_centerY).offset(-20);
        make.width.mas_equalTo(imgW);
        make.height.mas_equalTo(imgH);
    }];
    
    [self.adsImgView sd_setImageWithURL:[NSURL URLWithString:self.model.imgUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.top.mas_equalTo(_adsImgView.mas_bottom).offset(48);
        make.width.height.mas_equalTo(50);
    }];
    
}


-(UIImageView *)adsImgView
{
    if (!_adsImgView) {
        _adsImgView = [[UIImageView alloc] init];
        
        [self addSubview:_adsImgView];
        _adsImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adsImgViewGestureHandler:)];
        tap.numberOfTapsRequired = 1;
        _adsImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_adsImgView addGestureRecognizer:tap];
    }

    return _adsImgView;

}


-(UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setImage:[UIImage imageNamed:@"home_close"] forState:UIControlStateNormal];
        [self addSubview:_cancelBtn];
        
        [_cancelBtn addTarget:self action:@selector(cancelBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancelBtn;

}

//点击取消显示
-(void)cancelBtnHandler:(id)sender
{
//    self.popBackBlcok(NO);
    [self dismiss];
}



-(void)adsImgViewGestureHandler:(id)sender{

    self.popBackBlcok(YES,self.model.url);
    [self dismiss];

}

-(void)dismiss{

    [self removeFromSuperview];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self dismiss];

}


@end
