//
//  XYOrderConfirmCouponVC.m
//  user
//
//  Created by xingyun on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmCouponVC.h"

@interface XYOrderConfirmCouponVC ()
@property(nonatomic,strong)NSString *clockConfirm;
@end



@implementation XYOrderConfirmCouponVC

/** view  高度 */
const CGFloat orderConfirm_coupon_height = 45.0;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    self.numberOupons.text=@"已选择21张";
//    self.price.text=@"- ¥50.00";
//    [self.price setImage:SETIMAGENAME(@"order_icon_more") forState:UIControlStateNormal];
    
//    self.view.backgroundColor=[UIColor redColor];
}

-(void)layer{
    [self.view addSubview:self.coupon];
    [self.view addSubview:self.numberOupons];
    [self.view addSubview:self.price];
    [self.view addSubview:self.imageView];
    WeakSelf
    [self.coupon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.width.mas_equalTo(50);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.numberOupons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.coupon.mas_right);
        make.width.mas_equalTo(69);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin-5);
//        make.width.mas_equalTo(8);
//        make.height.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        
    }];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_imageView.mas_left);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
        
    }];
    
    
    
    
}

-(UILabel *)coupon{
    if (!_coupon) {
        _coupon =[[UILabel alloc]init];
        
        _coupon.font=[UIFont systemFontOfSize:14];
        _coupon.textColor=XYRGBAColor(51,51,51, 1);
    }
    return _coupon;
}

-(UILabel *)numberOupons{
    if (!_numberOupons) {
        _numberOupons =[[UILabel alloc]init];
        [_numberOupons reat:5];
        [_numberOupons sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
        _numberOupons.font=[UIFont systemFontOfSize:12];
        _numberOupons.textColor=XYRGBAColor(236,59,44, 1);
        _numberOupons.textAlignment=NSTextAlignmentCenter;
    }
    return _numberOupons;
}

-(void)hide:(NSString *)numberoupons{
    NSLog(@"%@",numberoupons);
    self.coupon.text=@"优惠券";
    
    [self layer];
    _clockConfirm=numberoupons;
    if ([numberoupons integerValue]!=0) {
        [_numberOupons sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
        _numberOupons.textColor=XYRGBAColor(236,59,44, 1);
        self.price.textColor=XYRGBAColor(236,59,44, 1);
        self.imageView.image=SETIMAGENAME(@"order_icon_more");
    }else{
        [_numberOupons sideLine:1 SideLineColor:XYRGBAColor(255,255,255, 1)];
        _numberOupons.textColor=XYRGBAColor(255,255,255, 1);
//        self.imageView.image=SETIMAGENAME(@"");
//        self.price.text=@"暂无可用优惠券";
        self.price.textColor=XYRGBAColor(255,255,255, 1);
    }
    
}

-(UILabel *)price{
    if (!_price) {
        _price =[[UILabel alloc]init];;
        _price.font=[UIFont systemFontOfSize:14];
        _price.textColor=XYRGBAColor(236,59,44, 1);
        _price.textAlignment=NSTextAlignmentRight;
//        _price.backgroundColor=[UIColor redColor];
        
    }
    
    return _price;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        
    }
    return _imageView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([_clockConfirm integerValue]!=0) {
        if (self.Clock) {
            self.Clock();
        }
    }else{
        
    }
    
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
