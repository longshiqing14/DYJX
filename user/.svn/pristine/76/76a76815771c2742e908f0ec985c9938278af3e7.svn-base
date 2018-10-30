//
//  XYConfirmOrderInvoiceOrNotVC.m
//  user
//
//  Created by xingyun on 2017/10/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYConfirmOrderInvoiceOrNotVC.h"

@interface XYConfirmOrderInvoiceOrNotVC ()




@end

@implementation XYConfirmOrderInvoiceOrNotVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 是否 开发票
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
    
    [self.buttonView addSubview:self.invoiceBT];
    
    [self.buttonView addSubview:self.notBT];
    
    
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
    
    [self.invoiceBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(_buttonView.mas_centerY);
    }];
    
    [self.notBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_buttonView.mas_centerX);
        make.centerY.mas_equalTo(_buttonView.mas_centerY);
    }];
    
    
}



#pragma mark - button click
/** 开发票 */
- (void)invoiceButtonClick:(UIButton*)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(InvoiceOrNotViewInvoiceButtonClick)]) {
        [self.delegate InvoiceOrNotViewInvoiceButtonClick];
    }
}
/** 不开发票 */
- (void)notButtonClick:(UIButton*)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(InvoiceOrNotViewNotButtonClick)]) {
        [self.delegate InvoiceOrNotViewNotButtonClick];
    }
}


#pragma mark - 懒加载

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.text = @"是否开发票";
        
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

- (UIButton*)invoiceBT
{
    if (_invoiceBT == nil) {
        _invoiceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _invoiceBT.frame = CGRectZero;
        
        [_invoiceBT setTitle:@"开票" forState:UIControlStateNormal];
        [_invoiceBT setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_invoiceBT.titleLabel setFont:XYFont_16];
        
        [_invoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_invoiceBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        
        _invoiceBT.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, -8);
        
        [_invoiceBT addTarget:self action:@selector(invoiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _invoiceBT;
}

- (UIButton*)notBT
{
    if (_notBT == nil) {
        _notBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _notBT.frame = CGRectZero;
        
        [_notBT setTitle:@"不开票" forState:UIControlStateNormal];
        [_notBT setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_notBT.titleLabel setFont:XYFont_16];
        [_notBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_notBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        
        _notBT.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, -8);
        
        [_notBT addTarget:self action:@selector(notButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _notBT;
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
