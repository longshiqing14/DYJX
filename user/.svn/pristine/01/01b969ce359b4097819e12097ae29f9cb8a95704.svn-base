//
//  XYConfirmOrderInvoiceTypeVC.m
//  user
//
//  Created by xingyun on 2017/10/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYConfirmOrderInvoiceTypeVC.h"

@interface XYConfirmOrderInvoiceTypeVC ()

@end

@implementation XYConfirmOrderInvoiceTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
    [self addViewAndLayout];
    
}

#pragma mark - add view
/** 添加 view */
- (void)addViewAndLayout
{
    [self.view addSubview:self.titleLB];
    
    [self.view addSubview:self.lineView];
    
    [self.view addSubview:self.buttonView];
    
    [self.buttonView addSubview:self.personalInvoiceBT];
    
    [self.buttonView addSubview:self.enterpriseInvoiceBT];
    
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(_titleLB.mas_bottom);
    }];
    
    [self.buttonView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    
    [self.personalInvoiceBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(_buttonView.mas_centerY);
    }];
    
    [self.enterpriseInvoiceBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_buttonView.mas_centerX);
        make.centerY.mas_equalTo(_buttonView.mas_centerY);
    }];
    
    
}



#pragma mark - button click
/** 个人发票 */
- (void)personalInvoiceButtonClick:(UIButton*)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(InvoiceTypeViewPersonalButtonClick)]) {
        [self.delegate InvoiceTypeViewPersonalButtonClick];
    }
}
/** 企业发票 */
- (void)enterpriseInvoiceButtonClick:(UIButton*)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(InvoiceTypeViewEnterpriseButtonClick)]) {
        [self.delegate InvoiceTypeViewEnterpriseButtonClick];
    }
}


#pragma mark - 懒加载

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.text = @"发票类型";
        
        _titleLB.textColor = XYFontTitleColor;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font = XYFont_15;
        
    }
    return _titleLB;
}

- (UIView*)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = XYLineColor;
    }
    return _lineView;
}

- (UIView*)buttonView
{
    if (_buttonView == nil) {
        _buttonView = [[UIView alloc]initWithFrame:CGRectZero];
        _buttonView.backgroundColor = XYWhiteColor;
    }
    return _buttonView;
}

- (UIButton*)personalInvoiceBT
{
    if (_personalInvoiceBT == nil) {
        _personalInvoiceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _personalInvoiceBT.frame = CGRectZero;
        
        [_personalInvoiceBT setTitle:@"个人" forState:UIControlStateNormal];
        [_personalInvoiceBT setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_personalInvoiceBT.titleLabel setFont:XYFont_16];
        
        [_personalInvoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_personalInvoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        
        _personalInvoiceBT.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, -8);
        
        [_personalInvoiceBT addTarget:self action:@selector(personalInvoiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _personalInvoiceBT;
}

- (UIButton*)enterpriseInvoiceBT
{
    if (_enterpriseInvoiceBT == nil) {
        _enterpriseInvoiceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _enterpriseInvoiceBT.frame = CGRectZero;
        
        [_enterpriseInvoiceBT setTitle:@"企业" forState:UIControlStateNormal];
        [_enterpriseInvoiceBT setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_enterpriseInvoiceBT.titleLabel setFont:XYFont_16];
        [_enterpriseInvoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_enterpriseInvoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        
        _enterpriseInvoiceBT.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, -8);
        
        [_enterpriseInvoiceBT addTarget:self action:@selector(enterpriseInvoiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _enterpriseInvoiceBT;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
