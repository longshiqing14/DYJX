//
//  XYPreDepositOrderPaySuccessVC.m
//  user
//
//  Created by xingyun on 2017/9/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositOrderPaySuccessVC.h"

#import "XYBoardBandNet.h"
#import "XYBoardBandEditDetailVC.h" // 补充 宽带信息

#import "XYMyBoardBandVC.h"

#import "XYPreDepositNet.h"
#import "XYPreWarnInfoModel.h"

@interface XYPreDepositOrderPaySuccessVC ()<XYBoardBandEditDetailVCDelegate>

@property(strong,nonatomic) XYPreWarnInfoModel *model ;
/** 订单支付成功图片背景视图 */
@property(nonatomic,strong) UIView * bgView;

/** 按钮所在背景视图 */
//@property(strong,nonatomic) UIView * buttonBGView ;

/*************** 上面背景图  **************************/

/** 支付成功图片 */
@property(strong,nonatomic) UIImageView *successImageView ;
/** 订单支付成功标签 */
@property(strong,nonatomic) UILabel * paySuccessLB ;
/** 支付 */
@property(strong,nonatomic) UILabel * payTitleLab ;


/** 支付成功图片 */
@property(strong,nonatomic) UIImageView *buttonBGImageView ;
/** 订单支付成功标签 */
@property(strong,nonatomic) UIButton * perfectinformationBT ;

/** 提示按钮 */
@property(strong,nonatomic) UIButton *warnBtn ;

/** 左边按钮 */
@property(strong,nonatomic) UIButton *leftBtn ;
/** 需要补充宽带安装信息 */
@property(assign,nonatomic) BOOL needBoardBandEdit ;

@end

@implementation XYPreDepositOrderPaySuccessVC

static CGFloat const successImgWidth = 77.f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"充值成功";
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self setLeftImageButtonWith:@"nav_btn_goback" target:self action:@selector(leftButtonClick:)];


    [self addViewAndLayout];
    
    [self warnThingFromSever];
    self.needBoardBandEdit = NO;
    if ([self.isProductList isEqualToString:@"Y"]) {
        [self dataFromSever];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   

}

-(void)warnThingFromSever{
    WeakSelf;
    [XYPreDepositNet netGetWarnInfo:self.orderId Block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
      
            weakSelf.model = [XYPreWarnInfoModel mj_objectWithKeyValues: blockDictionary[@"orderInfo"]];
            [weakSelf.warnBtn setTitle:weakSelf.model.rechargeGiveTimesTip forState:UIControlStateNormal];
            weakSelf.paySuccessLB.text = weakSelf.model.rechargePriceTip;
            weakSelf.payTitleLab.text = weakSelf.model.rechargeReminder;
            
        }
    }];
    
    
}




-(void)dataFromSever{
    WeakSelf;
    [XYBoardBandNet netMyBoardBandWithParam:[NSMutableDictionary dictionary] block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
        
            [weakSelf tableWithError:error];
        }else
        {
            [weakSelf tableWithError:error];
        }
        
        
    }];
}

-(void)tableWithError:(NSError *) error{
    
    
    
    
    //上面用来测试
    if (error == nil) {
        
        
    }else
    {
        /**
         E1070002: {
         code: 'E1070002',
         msg: '该用户未办理宽带业务'
         },
         E1070010: {
         code: 'E1070010',
         msg: '该用户未完善宽带安装信息'
         }
         
         */
        if ([error.domain isEqualToString:@"E1070002"]) {
            
            
        }else if ([error.domain isEqualToString:@"E1070010"])
        {
     
            self.needBoardBandEdit = YES;
            [self changBtnTitleWithBool:self.needBoardBandEdit];
        }
        
        
    }
    
    if (!self.needBoardBandEdit) {

        [self changBtnTitleWithBool:self.needBoardBandEdit];
    }
    
    
   
    
    
}



- (void)addViewAndLayout
{

    [self.view addSubview:self.bgView];
    if ([self.isProductList isEqualToString:@"1"]) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(205);
        }];
    }else
    {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(181);
        }];
        
    }
  

    [self.bgView addSubview:self.successImageView];
    [self.successImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView.mas_centerX);
        make.top.mas_equalTo(23);
        make.height.width.mas_equalTo(successImgWidth);
    }];

    [self.bgView addSubview:self.paySuccessLB];
    [self.paySuccessLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_successImageView.mas_bottom).offset(15);
        make.height.mas_equalTo(14);
    }];
    if ([self.isProductList isEqualToString:@"1"]) {
        [self.bgView addSubview:self.payTitleLab];
        
        [self.payTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(_paySuccessLB.mas_bottom).offset(12);
            make.height.mas_equalTo(12);
        }];
        
        [self.bgView addSubview:self.warnBtn];
        [self.warnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(_payTitleLab.mas_bottom).offset(15);
            make.height.mas_equalTo(30);
        }];
    }else
    {
        [self.bgView addSubview:self.payTitleLab];
        
        [self.payTitleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(_paySuccessLB.mas_bottom).offset(12);
            make.height.mas_equalTo(12);
        }];
  
        
    }
   
 

    if ([self.isProductList isEqualToString:@"Y"]) {
        [self.view addSubview:self.buttonBGImageView];
        [self.buttonBGImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_bgView.mas_bottom).offset(1);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        [self.buttonBGImageView addSubview:self.leftBtn];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.centerY.mas_equalTo(_buttonBGImageView.mas_centerY);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(XYScreenW/2 - 24);
        }];
        
        [self.buttonBGImageView addSubview:self.perfectinformationBT];
        [self.perfectinformationBT mas_updateConstraints:^(MASConstraintMaker *make) {
            //            make.centerX.mas_equalTo(_buttonBGImageView.mas_centerX);
            make.right.mas_equalTo(-16);
            make.centerY.mas_equalTo(_buttonBGImageView.mas_centerY);
            make.width.mas_equalTo(XYScreenW/2 - 24);
            make.height.mas_equalTo(30);
        }];
    }
}


#pragma mark - 点击事件

- (void)leftButtonClick:(UIButton*)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - button click

- (void)perfectinformationBtnClick:(UIButton*)sender
{
    if (self.needBoardBandEdit) {
        XYBoardBandEditDetailVC * editDetailVC = [[XYBoardBandEditDetailVC alloc]init];
        editDetailVC.delegate = self;
        [self.navigationController pushViewController:editDetailVC animated:YES];
    }else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }

    
}
-(void)leftBtnClick:(UIButton *)sender{

    if (self.needBoardBandEdit) {
         [self.navigationController popToRootViewControllerAnimated:YES];
 
    }else
    {
        [self.navigationController pushViewController:[XYMyBoardBandVC new] animated:YES];
       
    }

}

-(void)needRefreshData
{

    self.needBoardBandEdit = NO;
    

    [self changBtnTitleWithBool:self.needBoardBandEdit];
}


-(void)changBtnTitleWithBool:(BOOL)needEdit{

    if (needEdit) {
        [self.leftBtn setTitle:@"返回首页" forState:UIControlStateNormal];
        [self.perfectinformationBT setTitle:@"补充宽带安装信息" forState:UIControlStateNormal];
    }else
    {
        [self.leftBtn setTitle:@"我的宽带" forState:UIControlStateNormal];
        [self.perfectinformationBT setTitle:@"返回首页" forState:UIControlStateNormal];
    
    }

}

#pragma mark -  懒加载

-(UIButton *)warnBtn
{
    if (!_warnBtn) {
        _warnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _warnBtn.enabled = NO;
        _warnBtn.titleLabel.font = XYFont_13;
//        [_warnBtn setTitle:@"预存款将在十二月内分12期返还到您的账户" forState:UIControlStateNormal];
        [_warnBtn setTitleColor:XYRGBColor(250, 93, 86) forState:UIControlStateNormal];
        _warnBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_warnBtn setImage:[UIImage imageNamed:@"order_recharge_hint"] forState:UIControlStateNormal];
    }
    return _warnBtn;
}

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYWhiteColor;
    }
    return _bgView;
}

//- (UIView*)buttonBGView
//{
//    if (_buttonBGView == nil) {
//        _buttonBGView = [[UIView alloc]initWithFrame:CGRectZero];
//        _buttonBGView.backgroundColor = XYGlobalBg;
//    }
//    return _buttonBGView;
//}


- (UIImageView*)successImageView
{
    if (_successImageView == nil) {
        _successImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        _successImageView.image = [UIImage imageNamed:@"order_sucess_icon"];
    }
    return _successImageView;
}


-(UILabel *)paySuccessLB
{
    if (_paySuccessLB == nil) {
        _paySuccessLB = [[UILabel alloc] initWithFrame:CGRectZero];
        
//        _paySuccessLB.text = @"订单支付成功";
        _paySuccessLB.font = XYFont_14;
        _paySuccessLB.textAlignment = NSTextAlignmentCenter;
        _paySuccessLB.textColor = XYMainColor;
    }
    return _paySuccessLB;
}

-(UILabel *)payTitleLab
{
    if (_payTitleLab == nil) {
        _payTitleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _payTitleLab.font = XYFont_12;
        _payTitleLab.textColor = XYGrayColor;
//        _payTitleLab.text = [NSString stringWithFormat:@"已成功充值预存款￥%@元",self.totalPayPrice];
        _payTitleLab.textAlignment = NSTextAlignmentCenter;

    }
    
    return _payTitleLab;
}


- (UIImageView*)buttonBGImageView
{
    if (_buttonBGImageView == nil) {
        _buttonBGImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _buttonBGImageView.userInteractionEnabled = YES;
        
        _buttonBGImageView.image = [UIImage imageNamed:@"order_sucess_bg"];
    }
    return _buttonBGImageView;
}


//按钮点击效果用图片设置
-(UIButton *)perfectinformationBT
{
    if (_perfectinformationBT == nil) {
        _perfectinformationBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _perfectinformationBT.frame = CGRectZero;
        
//        [_perfectinformationBT setTitle:@"返回首页" forState:UIControlStateNormal];
        _perfectinformationBT.titleLabel.font = XYFont_14;
        [_perfectinformationBT setTitleColor:XYMainColor forState:UIControlStateNormal];
        
        _perfectinformationBT.layer.cornerRadius = 5;
        _perfectinformationBT.layer.masksToBounds = YES;
        
        _perfectinformationBT.layer.borderWidth = 0.5;
        _perfectinformationBT.layer.borderColor = XYMainColor.CGColor;
        
        [_perfectinformationBT addTarget:self action:@selector(perfectinformationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _perfectinformationBT;
    
}

-(UIButton *)leftBtn
{

    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectZero;
        
//        [_leftBtn setTitle:@"我的宽带" forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = XYFont_14;
        [_leftBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        
        _leftBtn.layer.cornerRadius = 5;
        _leftBtn.layer.masksToBounds = YES;
        
        _leftBtn.layer.borderWidth = 0.5;
        _leftBtn.layer.borderColor = XYGrayColor.CGColor;
        
        [_leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
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
