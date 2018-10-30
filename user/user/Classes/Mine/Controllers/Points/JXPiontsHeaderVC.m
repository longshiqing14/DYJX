//
//  JXPiontsHeaderVC.m
//  user
//
//  Created by 岩  熊 on 2017/12/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXPiontsHeaderVC.h"
#import "XYUserInfoModel.h"


@interface JXPiontsHeaderVC ()
/**  */
@property (nonatomic, strong) UIImageView * bgView;

/** 余额 */
@property (nonatomic, strong) UILabel * balanceLB;
/** 充值 */
@property (nonatomic, strong) UIButton * rechargeTB;
@end

@implementation JXPiontsHeaderVC

//const CGFloat ewallet_header_height = 200.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addViewAndLayout];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateHeaderData];
    
}

/** 添加 view */
- (void)addViewAndLayout
{
    
    [self.view addSubview:self.bgView];
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.bottom.right.mas_equalTo(-10);
//        make.height.mas_equalTo(200);
    }];
    
    [self.bgView addSubview:self.balanceLB];
    [self.balanceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(50);
    }];
    
    [self.view addSubview:self.rechargeTB];
    [self.rechargeTB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView.mas_centerX);
        make.bottom.mas_equalTo(-35);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(110);
    }];
}


- (void)updateHeaderData
{
    
    NSDictionary * userinfoDict = [XYUserDefaults readUserDefaultsInfo];
    
    if (userinfoDict.count == 0) {
        return;
    }
    
    XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:userinfoDict];
    
    self.balanceLB.text = infoModel.points;
    
    
}



#pragma mark - button click

//- (void)rechargeButtonClick:(UIButton*)sender
//{
//    XYPreDepositVC * preDepositVC = [[XYPreDepositVC alloc]init];
//    preDepositVC.isProductList = @"N";
//    [self.navigationController pushViewController:preDepositVC animated:YES];
    
//}

#pragma mark - 懒加载

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgView.image = [UIImage imageNamed:@"bg_integral"];
    }
    return _bgView;
}

- (UILabel*)balanceLB
{
    if (_balanceLB == nil) {
        _balanceLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _balanceLB.textColor = XYWhiteColor;
        _balanceLB.textAlignment = NSTextAlignmentCenter;
        _balanceLB.font = XYFont_60;
        
        self.balanceLB.text = @"0";
        
        
    }
    return _balanceLB;
}

- (UIButton*)rechargeTB
{
    if (_rechargeTB == nil) {
        _rechargeTB = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_rechargeTB setTitle:@"当前积分" forState:UIControlStateNormal];
        [_rechargeTB setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        _rechargeTB.titleLabel.font = XYFont_14;
        _rechargeTB.enabled = NO;
//        _rechargeTB.layer.cornerRadius = 5;
//        _rechargeTB.layer.masksToBounds = YES;
        
//        _rechargeTB.layer.borderWidth = 1;
//        _rechargeTB.layer.borderColor = XYWhiteColor.CGColor;
        
//        [_rechargeTB addTarget:self action:@selector(rechargeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rechargeTB;
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
