//
//  XYShoppingCartBottomVC.m
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYShoppingCartBottomVC.h"

#import "XYShoppingCartTotalModel.h" //


@interface XYShoppingCartBottomVC ()

/** 选择按钮 */
//@property (strong,nonatomic ) UIButton   * selectBT;

/** 合计 标题 */
@property (strong,nonatomic ) UILabel    * totalTitleLB;
/** 合计  */
@property (strong,nonatomic ) UILabel    * totalLB;

//总额立减多少
@property(strong,nonatomic)UILabel *totalOrderDiscountLB;

@end

@implementation XYShoppingCartBottomVC


const CGFloat ShoppingCart_Bottom_height = 45.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
    
    
}

- (void)setTotalModel:(XYShoppingCartTotalModel *)totalModel
{
    _totalModel = totalModel;

    self.totalLB.text = [NSString stringWithFormat:@"￥%@",_totalModel.totalPayPrice];
    NSLog(@"%@   %@",_totalModel.totalOrderProductPrice,_totalModel.totalOrderDiscount);
    
    
    if ([_totalModel.totalOrderDiscount containsString:@"-"]) {
        _totalModel.totalOrderDiscount=[_totalModel.totalOrderDiscount stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
    }
    self.totalOrderDiscountLB.text=@"";
    if ([_totalModel.totalOrderDiscount floatValue]>0) {
//        if ([_totalModel.totalPayPrice isEqualToString:@"0.00"]) {
//            self.totalOrderDiscountLB.text=@"";
//        }else{
            self.totalOrderDiscountLB.text=[NSString stringWithFormat:@"总额:¥%@ 立减:¥%@",_totalModel.totalOrderProductPrice,_totalModel.totalOrderDiscount];
//        }
        
    }
    
    [self addViewAndLayout];
}




/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.selectBT];
    [self.selectBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(50);
    }];
        
    [self.view addSubview:self.settlementBT];
    [self.settlementBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(95);
        make.right.top.bottom.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.totalOrderDiscountLB];
//    self.totalOrderDiscountLB.backgroundColor=[UIColor redColor];
    [self.totalOrderDiscountLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_settlementBT.mas_left).offset(-10);
        make.bottom.mas_equalTo(0).mas_offset(-5);
    }];
    
    [self.view addSubview:self.totalLB];
//    self.totalLB.backgroundColor=[UIColor greenColor];
    [self.totalLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_settlementBT.mas_left).offset(-10);
//        make.centerX.mas_equalTo(0);
//        make.top.mas_equalTo(0);
        if ([_totalModel.totalOrderDiscount floatValue]>0) {
            make.bottom.mas_equalTo(_totalOrderDiscountLB.mas_top).mas_offset(-3);
        }else{
            make.bottom.mas_equalTo(_totalOrderDiscountLB.mas_top).mas_offset(-10);;
        }
    }];
    
    [self.view addSubview:self.totalTitleLB];
//    self.totalTitleLB.backgroundColor=[UIColor redColor];
    [self.totalTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(_totalLB.mas_left).offset(-10);
//        make.centerY.mas_equalTo(0);
//        //        make.top.mas_equalTo(0);
//        make.bottom.mas_equalTo(_totalOrderDiscountLB.mas_top);
        make.right.mas_equalTo(_totalLB.mas_left);
//        make.centerY.mas_equalTo(0);
        //        make.top.mas_equalTo(0);
        
        NSLog(@"%@",_totalModel.totalOrderDiscount);
        if ([_totalModel.totalOrderDiscount floatValue]>0) {
            make.bottom.mas_equalTo(_totalOrderDiscountLB.mas_top).mas_offset(-3);
        }else{
            make.bottom.mas_equalTo(_totalOrderDiscountLB.mas_top).mas_offset(-10);
        }
    }];
    
    

}




#pragma mark - button click

/** 全选 按钮 点击事件 */
- (void)selectButtonClick:(UIButton*)sender
{
    sender.selected = !sender.selected;
    
    NSString * checked;
    if (sender.selected) {
        checked = @"t";
    }else{
        checked = @"n";
    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(cartBottomCheckAllwithCheck:)]) {
        [self.delegate cartBottomCheckAllwithCheck:checked];
    }
    
    
}

/** 结算 编辑 按钮 */
- (void)settlementButtonClick:(UIButton*)sender
{
    if (self.isCartBottomEdit) {

        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(cartBottomRemove)]) {
            [self.delegate cartBottomRemove];
        }
        
        
    }else{

        
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(cartBottomPushOrderConfirmOrderVC)]) {
            [self.delegate cartBottomPushOrderConfirmOrderVC];
        }
    }
}


#pragma mark - 懒加载

-(UILabel *)totalOrderDiscountLB{
    if (!_totalOrderDiscountLB) {
        _totalOrderDiscountLB=[[UILabel alloc]init];
        _totalOrderDiscountLB.textColor=XYRGBAColor(236,59,44, 1);
        _totalOrderDiscountLB.font=[UIFont systemFontOfSize:11];
        _totalOrderDiscountLB.textAlignment=NSTextAlignmentRight;
    }
    return _totalOrderDiscountLB;
}

- (UIButton *)selectBT {
    if (_selectBT == nil) {
        _selectBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBT.frame = CGRectZero;
        
        [_selectBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_selectBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        
        [_selectBT setTitle:@"全选" forState:UIControlStateNormal];
        [_selectBT setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_selectBT setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
        [_selectBT.titleLabel setFont:XYFont_15];
        
        [_selectBT addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBT;
}

- (UILabel *)totalTitleLB {
    if (_totalTitleLB == nil) {
        _totalTitleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _totalTitleLB.font          = XYFont_15;
        _totalTitleLB.textAlignment = NSTextAlignmentRight;
        _totalTitleLB.textColor     = XYFontTitleColor;
        
        _totalTitleLB.text = @"合计:";
        
    }
    return _totalTitleLB;
}


- (UILabel *)totalLB {
    if (_totalLB == nil) {
        _totalLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _totalLB.font          = [UIFont boldSystemFontOfSize:15];
        _totalLB.textAlignment = NSTextAlignmentRight;
        _totalLB.textColor     = XYBlackColor;
        
        
    }
    return _totalLB;
}

- (UIButton *)settlementBT {
    if (_settlementBT == nil) {
        _settlementBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _settlementBT.frame = CGRectZero;
        
        
        [_settlementBT setTitle:@"结算" forState:UIControlStateNormal];
        
        [_settlementBT.titleLabel setFont:XYFont_15];
        
//        _settlementBT.layer.cornerRadius = 5;
//        _settlementBT.layer.masksToBounds = YES;
        
        [_settlementBT addTarget:self action:@selector(settlementButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [_settlementBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
    _settlementBT.backgroundColor = XYRGBAColor(236,59,44, 1);
    return _settlementBT;
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
