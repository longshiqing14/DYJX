//
//  XYOrderPaymentRemarkSectionFooterVC.m
//  XY
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 yongxing. All rights reserved.
//

#import "XYOrderPaymentRemarkSectionFooterVC.h"

@interface XYOrderPaymentRemarkSectionFooterVC ()
/**商品总额*/
@property(nonatomic,strong)UILabel *acouuntLab;
/** 具体商品总价*/
@property(nonatomic,strong) UILabel *realAccountLab;
/** 配送费 */
@property(strong,nonatomic) UILabel *deliverLab ;

/** 配送费 ￥10.0 */
@property(strong,nonatomic) UILabel *deliverMoneyLab ;
/** 线 */
@property(strong,nonatomic) UIView *lineView ;
///** 备注 */
//@property(strong,nonatomic) UITextField *remarkTF ;

/** 本页面字体颜色 */
@property(strong,nonatomic) UIColor *KMoneyColor ;

@end

@implementation XYOrderPaymentRemarkSectionFooterVC

/** view  高度 */
const CGFloat payment_remark_height = 45.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
    [self creatGui];
}


-(void)creatGui{
//    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;

//    self.acouuntLab.frame = CGRectMake(10, 16, 80, 13);
//    self.realAccountLab.frame = CGRectMake(90, 16, screenW-90-10, 13);
//    self.deliverLab.frame = CGRectMake(10, 40, 80, 13);
//    self.deliverMoneyLab.frame = CGRectMake(90, 40, screenW-90-10, 13);
//    self.lineView.frame = CGRectMake(0, 70, screenW, 0.5);
//
//    self.remarkTF.frame = CGRectMake(10, 71, screenW-20, 44);
    
    [self.remarkTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];

}

//- (void)setAccountString:(NSString *)accountString
//{
//    _accountString = accountString;
//
//    if (_accountString == nil) {
//        self.realAccountLab.text =  @"￥0.0";
//    }else{
//        self.realAccountLab.text = [NSString stringWithFormat:@"￥%@",accountString];
//    }
//
//}

- (void)remarkSectionUpdateAccountString:(NSString*)accountString deliverMoneyString:(NSString*)deliverMoneyString
{
    if (accountString == nil) {
        self.realAccountLab.text =  @"￥0.0";
    }else{
        self.realAccountLab.text = [NSString stringWithFormat:@"￥%@",accountString];
    }
    
    if (deliverMoneyString == nil) {
        self.deliverMoneyLab.text =  @"￥0.0";
    }else{
        self.deliverMoneyLab.text = [NSString stringWithFormat:@"￥%@",deliverMoneyString];
    }
    
}


-(UILabel *)acouuntLab
{
    if (!_acouuntLab) {
        _acouuntLab = [UILabel new];
        _acouuntLab.font = XYFont_14;
        _acouuntLab.textColor = XYBlackColor;
        _acouuntLab.text = @"商品总额";
        [self.view addSubview:_acouuntLab];
    }
    return _acouuntLab;

}

-(UILabel *)realAccountLab
{
    if (!_realAccountLab) {
        _realAccountLab = [UILabel new];
        _realAccountLab.font = XYFont_14;
        _realAccountLab.textColor = XYBlackColor;
        _realAccountLab.text = @"￥0.0";
        _realAccountLab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:_realAccountLab];
    }
    return _realAccountLab;
}

-(UILabel *)deliverLab
{
    
    if (!_deliverLab) {
        _deliverLab = [UILabel new];
        _deliverLab.font = XYFont_14;
        _deliverLab.textColor = XYBlackColor;
        _deliverLab.text = @"配送费";
        [self.view addSubview:_deliverLab];
    }
    return _deliverLab;
}

-(UILabel *)deliverMoneyLab
{
    if (!_deliverMoneyLab) {
        _deliverMoneyLab = [UILabel new];
        _deliverMoneyLab.font = XYFont_14;
        _deliverMoneyLab.textColor = XYBlackColor;
        _deliverMoneyLab.text = @"￥0.0";
        _deliverMoneyLab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:_deliverMoneyLab];
    }
    return _deliverMoneyLab;

}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self.view addSubview:_lineView];
        _lineView.backgroundColor = XYLineColor;
    }
    return _lineView;
}

-(UITextField *)remarkTF
{

    if (!_remarkTF) {
        _remarkTF = [[UITextField alloc] init];
        [self.view addSubview:_remarkTF];
        _remarkTF.font = XYFont_14;
        _remarkTF.placeholder = @"请输入您的订单备注";
        _remarkTF.textColor = self.KMoneyColor;
    }
    return _remarkTF;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
