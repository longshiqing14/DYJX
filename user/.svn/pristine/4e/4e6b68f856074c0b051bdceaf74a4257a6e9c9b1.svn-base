//
//  XYOrderDetailTelephoneVC.m
//  user
//
//  Created by xingyun on 2017/11/30.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailTelephoneVC.h"

#import "XYOrderDetailModel.h"

@interface XYOrderDetailTelephoneVC ()

/**  */
@property (nonatomic, strong) UILabel * titleLB;

@end

@implementation XYOrderDetailTelephoneVC

/** view  高度 */
const CGFloat order_Detail_telephone_height = 45.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = XYWhiteColor;
    
    
    [self.view addSubview:self.titleLB];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
}




- (void)setSellerInfoModel:(XYOrderDetailSellerInfoModel *)sellerInfoModel
{
    _sellerInfoModel = sellerInfoModel;
    
    [self updateTitleData];
}

- (void)updateTitleData
{
    if (_sellerInfoModel.mobile != nil) {
        self.titleLB.text = [NSString stringWithFormat:@"商家电话：%@",_sellerInfoModel.mobile];
    }
    
    
}




#pragma mark - 懒加载

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textColor = XYFontTitleColor;
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLB;
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
