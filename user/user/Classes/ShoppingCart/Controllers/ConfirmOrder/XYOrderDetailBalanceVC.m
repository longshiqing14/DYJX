//
//  XYOrderDetailBalanceVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailBalanceVC.h"

#import "XYUserInfoModel.h"

@interface XYOrderDetailBalanceVC ()

/** 商品名称 */
@property (strong,nonatomic ) UILabel     * titleLB;

/** 余额 */
@property (nonatomic, strong) UILabel     * balanceLB;

@end

@implementation XYOrderDetailBalanceVC

/** view  高度 */
const CGFloat payment_balance_height = 45.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
    
    [self addViewAndLayout];
    
    [self updateViewData];
}

- (void)updateViewData
{
    NSDictionary * userinfoDict = [XYUserDefaults readUserDefaultsInfo];
    
    if (userinfoDict.count == 0) {
        return;
    }
    
    XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:userinfoDict];
    
    NSString * depositBalance ;
    if ([infoModel.depositBalance isEqualToString:@"0"] || infoModel.depositBalance == nil) {
        depositBalance = @"0.00";
    }else{
        depositBalance = infoModel.depositBalance;
    }
    
    self.balanceLB.text = [NSString stringWithFormat:@"￥%@",depositBalance];
}



/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.balanceLB];
    [self.balanceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(XY_Right_Margin);
        make.width.mas_equalTo(150);
    }];
    
}

#pragma mark - 懒加载

- (UILabel *)titleLB
{
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYBlackColor;
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        
        _titleLB.text          = @"账户余额";
    }
    return _titleLB;
}

- (UILabel *)balanceLB
{
    if (_balanceLB == nil) {
        _balanceLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _balanceLB.font          = XYFont_14;
        _balanceLB.textAlignment = NSTextAlignmentRight;
        _balanceLB.textColor     = XYBlackColor;
        
    }
    return _balanceLB;
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
