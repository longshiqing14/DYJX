//
//  XYPayOrderSuccessVC.m
//  XY
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 yongxing. All rights reserved.
//

#import "XYPayOrderSuccessVC.h"

#import "XYMineOrderListVCViewController.h"

#import "XYLoginAndRegisterNet.h"  // 登录 个人信息

@interface XYPayOrderSuccessVC ()




/** 订单支付成功图片所在背景视图 */
@property(nonatomic,strong) UIView *imgBackgroundV;
/** 支付几个标签所在的背景图 */
@property(strong,nonatomic) UIImageView *payBackgroundImgV ;
/** 按钮所在背景视图 */
@property(strong,nonatomic) UIView *btnBackgroundView ;

/*************** 上面背景图  **************************/

/** 支付成功图片 */
@property(strong,nonatomic) UIImageView *successImgView ;
/** 订单支付成功标签 */
@property(strong,nonatomic) UILabel *payOrderSuccessLab ;
/** 支付方式标签 */
@property(strong,nonatomic) UILabel *payStyleLab ;

/** 订单支付方式，如余额支付 */
@property(strong,nonatomic) UILabel *showPayStyleLab ;

/** 支付金额 */
@property(strong,nonatomic) UILabel *paymentAmountLab ;
/** 显示支付金额 如￥880.00*/
@property(strong,nonatomic) UILabel *showPaymentAmountLab ;
/** 查看订单 */
@property(strong,nonatomic) UIButton *checkOrderBtn ;
/** 回到首页按妞 */
@property(strong,nonatomic) UIButton *backHomeBtn ;


@end

static CGFloat const successImgWidth = 77.f;

@implementation XYPayOrderSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"订单支付";
    
    self.view.backgroundColor = XYGlobalBg;
    
    [self setLeftImageButtonWith:@"nav_btn_goback" target:self action:@selector(leftButtonClick:)];
    
    [XYLoginAndRegisterNet netGetUserInfoListBlock:^(NSDictionary *blockDictionary, NSError *error) {
        
    }];
    
    [self creatGui];
}

//页面视图初始化
-(void)creatGui{
    //1
    self.imgBackgroundV.frame = CGRectMake(0, 0, XYScreenW, 150);
    self.successImgView.frame = CGRectMake(self.imgBackgroundV.center.x -successImgWidth/2, 22, successImgWidth, successImgWidth);
    self.payOrderSuccessLab.frame = CGRectMake(0, self.successImgView.frame.origin.y +self.successImgView.frame.size.height+15, XYScreenW, 15);
    //2
    self.payBackgroundImgV.frame = CGRectMake(0, self.imgBackgroundV.frame.origin.y+self.imgBackgroundV.frame.size.height+1, XYScreenW, 80);
    
    self.payStyleLab.frame = CGRectMake(11, 15, 80, 13);
    self.paymentAmountLab.frame = CGRectMake(11, 42, 100, 13);
    self.showPayStyleLab.frame = CGRectMake(XYScreenW-13-150, 15, 150, 14);
    self.showPaymentAmountLab.frame = CGRectMake(XYScreenW-13-150, 42, 150, 14);
    //3 按钮背景视图
    self.btnBackgroundView.frame = CGRectMake(0, _payBackgroundImgV.frame.origin.y+80+10, XYScreenW, 50);
    CGFloat width = (XYScreenW - 16*2-15)/2;
    
    self.checkOrderBtn.frame = CGRectMake(16, 10, width, 30);
    self.backHomeBtn.frame = CGRectMake(XYScreenW/2 +5, 10, width, 30);
 
    if (self.paymentAmountString == nil) {
        self.showPaymentAmountLab.text = @"";
    }else{
        self.showPaymentAmountLab.text = [NSString stringWithFormat:@"￥%@",self.paymentAmountString];
    }
    
}



#pragma mark - lazy

-(UIView *)imgBackgroundV
{
    if (!_imgBackgroundV) {
        _imgBackgroundV = [UIView new];
        _imgBackgroundV.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_imgBackgroundV];
    }
    return _imgBackgroundV;
}

-(UIImageView *)payBackgroundImgV
{
    if (!_payBackgroundImgV) {
        _payBackgroundImgV = [[UIImageView alloc] init];
//        _payBackgroundImgV.backgroundColor = [UIColor whiteColor];
        _payBackgroundImgV.image = [UIImage imageNamed:@"order_sucess_bg"];
        [self.view addSubview:_payBackgroundImgV];
    }
    return _payBackgroundImgV;
}

-(UIView *)btnBackgroundView
{
    if (!_btnBackgroundView) {
        _btnBackgroundView = [UIView new];
        _btnBackgroundView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_btnBackgroundView];
    }
    return _btnBackgroundView;
}

// -----
-(UIImageView *)successImgView
{
    if (!_successImgView) {
        _successImgView = [[UIImageView alloc] init];
//        _successImgView.layer.cornerRadius = successImgWidth/2;
//        _successImgView.layer.masksToBounds = YES;
        _successImgView.image = [UIImage imageNamed:@"order_sucess_icon"];
        [self.imgBackgroundV addSubview:_successImgView];
    }
    return _successImgView;

}


-(UILabel *)payOrderSuccessLab
{
    if (!_payOrderSuccessLab) {
        _payOrderSuccessLab = [[UILabel alloc] init];
        [self.imgBackgroundV addSubview:_payOrderSuccessLab];
        _payOrderSuccessLab.text = @"订单支付成功";
        _payOrderSuccessLab.font = XYFont_15;
        _payOrderSuccessLab.textAlignment = NSTextAlignmentCenter;
        _payOrderSuccessLab.textColor = XYMainColor;
    }
    return _payOrderSuccessLab;
}

-(UILabel *)payStyleLab
{
    if (!_payStyleLab) {
        _payStyleLab = [[UILabel alloc] init];
        _payStyleLab.font = XYFont_14;
        _payStyleLab.textColor = XYGrayColor;
        _payStyleLab.text = @"支付方式";
        [self.payBackgroundImgV addSubview:_payStyleLab];
    }

    return _payStyleLab;
}

-(UILabel *)showPayStyleLab
{
    if (!_showPayStyleLab) {
        _showPayStyleLab = [UILabel new];
        [self.payBackgroundImgV addSubview:_showPayStyleLab];
        _showPayStyleLab.text = self.paymentType;
        _showPayStyleLab.font = XYFont_14;
        _showPayStyleLab.textColor = XYGrayColor;
        _showPayStyleLab.textAlignment = NSTextAlignmentRight;
    }
    return _showPayStyleLab;

}

-(UILabel *)paymentAmountLab
{
    if (!_paymentAmountLab) {
        _paymentAmountLab = [UILabel new];
        _paymentAmountLab.textColor = XYBlackColor;
        _paymentAmountLab.text = @"支付金额";
        _paymentAmountLab.font = XYFont_14;
        [self.payBackgroundImgV addSubview:_paymentAmountLab];
        
        
        
    }
    return _paymentAmountLab;
}


-(UILabel *)showPaymentAmountLab
{

    if (!_showPaymentAmountLab) {
        _showPaymentAmountLab = [UILabel new];
        _showPaymentAmountLab.textColor = XYBlackColor;
        _showPaymentAmountLab.font = XYFont_14;
        _showPaymentAmountLab.textAlignment = NSTextAlignmentRight;
//        _showPaymentAmountLab.text = @"￥888.00";
        [self.payBackgroundImgV addSubview:_showPaymentAmountLab];
    }
    return _showPaymentAmountLab;
}

//按钮点击效果用图片设置
-(UIButton *)checkOrderBtn
{
    if (!_checkOrderBtn) {
        _checkOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_checkOrderBtn setTitle:@"查看订单" forState:UIControlStateNormal];
        _checkOrderBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_checkOrderBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];

        _checkOrderBtn.layer.cornerRadius = 5;
        _checkOrderBtn.layer.masksToBounds = YES;
        
        _checkOrderBtn.layer.borderWidth = 0.5;
        _checkOrderBtn.layer.borderColor = XYGrayColor.CGColor;
        
        [_checkOrderBtn addTarget:self action:@selector(clickCheckOrderBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnBackgroundView addSubview:_checkOrderBtn];
    }
    return _checkOrderBtn;

}
-(UIButton *)backHomeBtn
{
    if (!_backHomeBtn) {
        _backHomeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backHomeBtn setTitle:@"回到首页" forState:UIControlStateNormal];
        _backHomeBtn.titleLabel.font = XYFont_14;
        [_backHomeBtn setTitleColor:XYMainColor forState:UIControlStateNormal];
        
        _backHomeBtn.layer.cornerRadius = 5;
        _backHomeBtn.layer.masksToBounds = YES;
        
        _backHomeBtn.layer.borderWidth = 0.5;
        _backHomeBtn.layer.borderColor = XYMainColor.CGColor;
        


        [_backHomeBtn addTarget:self action:@selector(clickBackHomeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnBackgroundView addSubview:_backHomeBtn];
    }
    return _backHomeBtn;
}

#pragma mark - 点击事件

- (void)leftButtonClick:(UIButton*)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//查看订单
-(void)clickCheckOrderBtn:(UIButton *)sender
{
    XYMineOrderListVCViewController * orderListVC = [[XYMineOrderListVCViewController alloc]init];
    orderListVC.isPaySuccessPush = YES;
    [self.navigationController pushViewController:orderListVC animated:YES];
}
//回到首页
-(void)clickBackHomeBtn:(UIButton *)sender
{
//    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController.tabBarController setSelectedIndex:0];
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
