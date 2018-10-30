//
//  XYDeliveryWayPopView.m
//  user
//
//  Created by xingyun on 2017/9/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYDeliveryWayPopView.h"
#import "XYOrderFromDetailModel.h"
@interface XYDeliveryWayPopView ()
/** 背景图 */
@property(nonatomic,strong) UIView *bgView;
/**标题 */
@property(nonatomic,strong) UILabel *titleLab;
/** 关闭页面按钮 */
@property(strong,nonatomic) UIButton * closeBtn ;
/** 线视图 */
@property(strong,nonatomic) UIView *lineView ;
/** 送货上门 */
@property(strong,nonatomic) UIButton *deliverKnockDoorBtn ;
/** 到店自提 */
@property(strong,nonatomic) UIButton *deliverToShopBtn ;

/** 选中颜色 */
@property(strong,nonatomic) UIColor *selectColor ;

@property(copy,nonatomic) NSString *wayStr ;
@end

@implementation XYDeliveryWayPopView


-(void)showWithStr:(NSString *)str
{
    
    
    _wayStr = str;
    self.frame = [UIScreen mainScreen].bounds;
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    WeakSelf;
//    CGFloat bgH = (XYScreenW -60)*383/617;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(190);
    }];

    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.height.mas_equalTo(0.5);
        make.left.right.mas_equalTo(0);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(_lineView.mas_top);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [self.deliverKnockDoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lineView.mas_bottom).offset(30);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(36);
        make.centerX.mas_equalTo(_bgView.mas_centerX);
    }];
    
    [self.deliverToShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_deliverKnockDoorBtn.mas_bottom).offset(15);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(36);
        make.centerX.mas_equalTo(_bgView.mas_centerX);
    }];
    
    if ([str isEqualToString:@"到店自提"]) {
        self.deliverToShopBtn.selected =YES;
        self.deliverKnockDoorBtn.selected = NO;
    }
    
    if ([str isEqualToString:@"送货上门"]) {
        self.deliverToShopBtn.selected =NO;
        self.deliverKnockDoorBtn.selected = YES;
        
    }
    
    
    [self updateSelectColor];
    
    
    
    [self showAnimate];
}



-(void)showAnimate{

    
 
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 0.2; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.autoreverses = NO; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:0.1]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.0]; // 结束时的倍率
    
    // 添加动画
    [_bgView.layer addAnimation:animation forKey:@"scale-layer"];



}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    
    for (NSInteger i=0; i<dataArr.count; i++) {
        XYOrderFromDetailAvailableDeliveryRuleResultsModel *model = dataArr[i];
        if (i==0) {
            [self.deliverKnockDoorBtn setTitle:model.name forState:UIControlStateNormal];
            if ([model.name isEqualToString:self.wayStr]) {
                self.deliverKnockDoorBtn.selected = YES;
                self.deliverToShopBtn.selected = NO;
            }
        }else{
            if ([model.name isEqualToString:self.wayStr]) {
                self.deliverKnockDoorBtn.selected = NO;
                self.deliverToShopBtn.selected = YES;
            }
            [self.deliverToShopBtn setTitle:model.name forState:UIControlStateNormal];
        }
        
        
    }
    
    
    [self updateSelectColor];
}

-(void)viewDiss
{
    
    WeakSelf;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.alpha = 0;
        weakSelf.bgView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
    }];
    

}

#pragma Mark -lazy

-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = XYWhiteColor;
        [self addSubview:_bgView];
        _bgView.layer.cornerRadius = 5;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;

}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"配送方式";
        _titleLab.font = XYFont_14;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor =XYFontTitleColor;
        [self.bgView addSubview:_titleLab];
    }
    return _titleLab;
}

-(UIButton *)closeBtn
{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:_closeBtn];
        [_closeBtn setImage:[UIImage imageNamed:@"xy_address_close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(viewDiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGlobalBg;
        [self.bgView addSubview:_lineView];
    }
    return _lineView;
}

-(UIButton *)deliverKnockDoorBtn
{
    if (!_deliverKnockDoorBtn) {
        _deliverKnockDoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_deliverKnockDoorBtn setTitle:@"送货上门" forState:UIControlStateNormal];
        _deliverKnockDoorBtn.titleLabel.font = XYFont_13;
        [self.bgView addSubview:_deliverKnockDoorBtn];
        [_deliverKnockDoorBtn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [_deliverKnockDoorBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_deliverKnockDoorBtn addTarget:self action:@selector(handlerSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _deliverKnockDoorBtn.layer.cornerRadius = 3;
        _deliverKnockDoorBtn.layer.borderColor = XYGrayColor.CGColor;
        _deliverKnockDoorBtn.layer.borderWidth = 0.5;
        _deliverKnockDoorBtn.layer.masksToBounds = YES;
        _deliverKnockDoorBtn.selected = YES;
        [_deliverKnockDoorBtn setImage:[UIImage imageNamed:@"xy_address_door_unselect"] forState:UIControlStateNormal];
        [_deliverKnockDoorBtn setImage:[UIImage imageNamed:@"xy_address_door_select"] forState:UIControlStateSelected];
        
        _deliverKnockDoorBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _deliverKnockDoorBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return _deliverKnockDoorBtn;

}

-(UIButton *)deliverToShopBtn
{
    if (!_deliverToShopBtn) {
        _deliverToShopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_deliverToShopBtn setTitle:@"到店自提" forState:UIControlStateNormal];
        [self.bgView addSubview:_deliverToShopBtn];
        _deliverToShopBtn.titleLabel.font = XYFont_13;
        [_deliverToShopBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_deliverToShopBtn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [_deliverToShopBtn addTarget:self action:@selector(handlerSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_deliverToShopBtn setImage:[UIImage imageNamed:@"xy_address_shop_unselect"] forState:UIControlStateNormal];
        [_deliverToShopBtn setImage:[UIImage imageNamed:@"xy_address_shop_select"] forState:UIControlStateSelected];
        _deliverToShopBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        _deliverToShopBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _deliverToShopBtn.layer.cornerRadius = 3;
        _deliverToShopBtn.layer.borderColor = XYGrayColor.CGColor;
        _deliverToShopBtn.layer.borderWidth = 0.5;
        _deliverToShopBtn.layer.masksToBounds = YES;
        
    }
    return _deliverToShopBtn;

}

-(UIColor *)selectColor
{
    if (!_selectColor) {
        _selectColor = [UIColor colorWithRed:236/255.0 green:58/255.0 blue:45/255.0 alpha:1.0];
    }

    return _selectColor;
}
-(void)handlerSelectBtn:(UIButton *)sender
{
    if (sender == self.deliverToShopBtn) {
        self.deliverToShopBtn.selected = YES;
        self.deliverKnockDoorBtn.selected = NO;
        
        
    }else
    {
        self.deliverKnockDoorBtn.selected  = YES;
        self.deliverToShopBtn.selected = NO;
    }
    [self updateSelectColor];
    
    NSString *str = sender.titleLabel.text;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectWay:)]) {
        [self.delegate selectWay:str];
    }
    
    [self viewDiss];

}

//更新选中颜色
-(void)updateSelectColor{

    if (self.deliverToShopBtn.selected) {
        self.deliverToShopBtn.layer.borderColor = self.selectColor.CGColor;
        self.deliverKnockDoorBtn.layer.borderColor = XYGrayColor.CGColor;
    }else
    {
        self.deliverKnockDoorBtn.layer.borderColor = self.selectColor.CGColor;
        self.deliverToShopBtn.layer.borderColor = XYGrayColor.CGColor;
    }
}


@end
