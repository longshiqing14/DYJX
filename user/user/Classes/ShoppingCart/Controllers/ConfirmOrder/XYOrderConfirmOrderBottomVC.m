//
//  XYOrderConfirmOrderBottomVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmOrderBottomVC.h"


#import "XYOrderAllNet.h"  //  订单 请求


@interface XYOrderConfirmOrderBottomVC () 
{
    
}

/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
/** 总价 */
@property (nonatomic, strong) UILabel * totalLB;
/** 提交订单 */
@property (nonatomic, strong) UIButton * placeOrderBT;
//@property(nonatomic,strong)UILabel *totalDiscountLb;


@end

@implementation XYOrderConfirmOrderBottomVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYWhiteColor;

    
    [self addViewAndLayout];
    
}

- (void)setTotalString:(NSString *)totalString
{
    _totalString = totalString;
    
    if (totalString== nil || [totalString isEqualToString:@""]) {
        return;
    }
    
    if ([totalString hasPrefix:@"￥"]) {
        self.totalLB.text = totalString;
    }else{
        self.totalLB.text = [NSString stringWithFormat:@"￥%@",totalString];
    }
}


//- (void)setTotalDiscountLbStr:(NSString *)totalString
//{
//
//    if (totalString== nil || [totalString isEqualToString:@""]) {
//        return;
//    }
//
//    if ([totalString hasPrefix:@"￥"]) {
//        self.totalDiscountLb.text = totalString;
//    }else{
//        self.totalDiscountLb.text = [NSString stringWithFormat:@"￥%@",totalString];
//    }
//}

/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(80);
    }];
    
    [self.view addSubview:self.placeOrderBT];
    [self.placeOrderBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(128);
    }];
    
    [self.view addSubview:self.totalLB];
    [self.totalLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLB.mas_right);
        make.right.mas_equalTo(_placeOrderBT.mas_left).offset(-10);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
//    [self.view addSubview:self.totalDiscountLb];
//    [self.totalDiscountLb mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_totalLB.mas_right).offset(10);
//        make.right.mas_equalTo(_placeOrderBT.mas_left).offset(-10);
//        make.top.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//    }];
    
    
}




#pragma mark - button click

/** 提交 订单  点击事件 */
- (void)placeOrderBTButtonClick:(UIButton*)sender
{
    if (_totalString == nil) {
        return;
    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(orderConfirmOrderBottomButtonClick)]) {
        [self.delegate orderConfirmOrderBottomButtonClick];
    }
    
    
}





#pragma mark - 懒加载

- (UILabel *)totalLB {
    if (_totalLB == nil) {
        _totalLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _totalLB.font          = XYFont_15;
        _totalLB.textAlignment = NSTextAlignmentLeft;
        _totalLB.textColor     = XYMainColor;
        
    }
    return _totalLB;
}

////订单优惠总金额
//-(UILabel *)totalDiscountLb{
//    if (!_totalDiscountLb) {
//        _totalDiscountLb               = [[UILabel alloc] initWithFrame:CGRectZero];
//        _totalDiscountLb.backgroundColor=[UIColor greenColor];
//        _totalDiscountLb.font          = XYFont_15;
//        _totalDiscountLb.textAlignment = NSTextAlignmentLeft;
//        _totalDiscountLb.textColor     = XYMainColor;
//    }
//    return _totalDiscountLb;
//}

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.font          = XYFont_15;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.textColor     = XYBlackColor;
        
        _titleLB.text = @"应付金额：";
    }
    return _titleLB;
}

- (UIButton *)placeOrderBT {
    if (_placeOrderBT == nil) {
        _placeOrderBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _placeOrderBT.frame = CGRectZero;
        _placeOrderBT.backgroundColor = BALANCEColor;
        
        [_placeOrderBT setTitle:@"提交订单" forState:UIControlStateNormal];
        [_placeOrderBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_placeOrderBT.titleLabel setFont:XYFont_15];

        
        [_placeOrderBT addTarget:self action:@selector(placeOrderBTButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _placeOrderBT;
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
