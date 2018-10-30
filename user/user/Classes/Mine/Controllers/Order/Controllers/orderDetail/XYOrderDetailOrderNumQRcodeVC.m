//
//  XYOrderDetailOrderNumQRcodeVC.m
//  user
//
//  Created by xingyun on 2017/9/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailOrderNumQRcodeVC.h"

#import "XYQRCodePushCommon.h"

@interface XYOrderDetailOrderNumQRcodeVC ()

@property (nonatomic , strong) UIImageView * QRcodeImageView;

@property (nonatomic, strong) UILabel * numLB;

@end

@implementation XYOrderDetailOrderNumQRcodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"提货码";
    self.view.backgroundColor = XYWhiteColor;
    
    
    [self addViewAndLayout];
    
    
    [self updateImageViewData];
    
}

- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.numLB];
    [self.numLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.right.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.QRcodeImageView];
    [self.QRcodeImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(supperView.mas_centerX);
        make.top.mas_equalTo(150);
        make.height.width.mas_equalTo(275);
    }];
    
    

    
}


- (void)updateImageViewData
{
    if (self.orderNum == nil) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }

    self.numLB.text = [NSString stringWithFormat:@"订单编号：%@",self.orderNum];
    
    self.QRcodeImageView.image = [XYQRCodePushCommon createQRCodeWithString:self.orderNum];
    
}





#pragma mark - button click

- (void)saveButtonClick:(UIButton*)sender
{
    if (self.QRcodeImageView.image == nil) {
        return;
    }
}

#pragma mark - 懒加载

- (UIImageView*)QRcodeImageView
{
    if (_QRcodeImageView == nil) {
        _QRcodeImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _QRcodeImageView;
}


- (UILabel*)numLB
{
    if (_numLB == nil) {
        _numLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _numLB.textAlignment = NSTextAlignmentCenter;
        _numLB.textColor = XYBlackColor;
        _numLB.font = XYFont_14;
        
    }
    return _numLB;
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
