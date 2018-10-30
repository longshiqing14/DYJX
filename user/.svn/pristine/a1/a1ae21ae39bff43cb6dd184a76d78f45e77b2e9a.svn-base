//
//  XYGoodsDetailBottomVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsDetailBottomVC.h"

#import "XYShoppingCartVC.h" //  购物车

#import "XYGoodsDetailVC.h"
#import "XYShoppingCartNet.h" // 购物车 请求
#import "XYOrderAllNet.h"     //
//#import "XYOrderConfirmOrderVC.h" // 结算页面
#import "JXOrderSettlementViewController.h"

#import "ShoppingCartTool.h"  // 加入购物车 动画

@interface XYGoodsDetailBottomVC ()


/** 购物车 商品数量 */
@property (nonatomic, strong) UILabel * shoppingCartNumLB;
/** 购物车 */
@property (nonatomic, strong) UIButton * shoppingCartBT;
/** 加入 购物车 */
@property (nonatomic, strong) UIButton * joinCartBT;
/** 立即购买 */
@property (nonatomic, strong) UIButton * buyNowBT;

/**  */
@property (nonatomic, strong) UILabel * sellOutLB;


@end

@implementation XYGoodsDetailBottomVC

const CGFloat goodsDetail_buttom_height = 49.0;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYWhiteColor;
    
    
    [self addViewAndLayout];
    [self updateCartNum];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCartNum) name:XY_notification_ItemsBadge object:nil];
    
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [XYShoppingCartNet netCartCountWithCartType:@"common" theMerchantId:[XYUserDefaults readAppDlegateOfUser_cityOfMerchantId]];
  
    
}


#pragma mark - set

- (void)setProductId:(NSString *)productId
{
    _productId = productId;
}



#pragma mark - update cart num

- (void)updateCartNum
{
    
  
    
    NSString * cartNum = [XYUserDefaults readAppDlegateOfCartCountStr];
    
    if ([cartNum isEqualToString:@"0"] || [cartNum isEqualToString:@""] || cartNum == nil) {
        _shoppingCartNumLB.hidden = YES;
    }else{
        _shoppingCartNumLB.text = cartNum;
        _shoppingCartNumLB.hidden = NO;
    }
    
    
}


#pragma mark - add view

/** 添加 view */
- (void)addViewAndLayout
{
    
    [self.view addSubview:self.shoppingCartBT];
    [self.shoppingCartBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    
    [self.shoppingCartBT addSubview:self.shoppingCartNumLB];
    [self.shoppingCartNumLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.width.height.mas_equalTo(18);
    }];
    
    
    [self.view addSubview:self.joinCartBT];
    [self.joinCartBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_shoppingCartBT.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo((XYScreenW-60)/2);
    }];

    [self.view addSubview:self.buyNowBT];
    [self.buyNowBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_joinCartBT.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo((XYScreenW-60)/2);
    }];
    
}


#pragma mark - show sell out label

- (void)showSellOutLB
{

    if (_sellOutLB == nil) {
        [self addSellOutLBView];
    }
    _sellOutLB.hidden = NO;
    
}

- (void)addSellOutLBView
{
    [self.view addSubview:self.sellOutLB];
    [self.sellOutLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_shoppingCartBT.mas_right);
        make.right.mas_equalTo(0);
    }];
}


#pragma mark - button click

/** 购物车 */
- (void)shoppingCartButtonClick:(UIButton*)sender
{
    XYShoppingCartVC * shoppingCartVC = [[XYShoppingCartVC alloc]init];
    shoppingCartVC.isPushCartView = YES;
    [self.navigationController pushViewController:shoppingCartVC animated:YES];
    
}
/** 加入 购物车 */
- (void)joinCartButtonClick:(UIButton*)sender
{
    if (_productId == nil) {
        return;
    }
    
    WeakSelf;
     [XYShoppingCartNet netCartAddWithProductId:_productId block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
//            XYLog(@" ShoppingCart  %@  ",blockDictionary);
            [weakSelf addCartAnimation];
            
            
        }
        
        
    }];
    
}
/** 立即购买 */
- (void)buyNowButtonClick:(UIButton*)sender
{
    if (_productId == nil) {
        return;
    }
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    WeakSelf;
    [XYOrderAllNet netCartBuyNowWithProductId:_productId Block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
//            XYOrderConfirmOrderVC * confirmOrderVC = [[XYOrderConfirmOrderVC alloc]init];
//            [weakSelf.navigationController pushViewController:confirmOrderVC animated:YES];
            JXOrderSettlementViewController *orderSettlementViewController=[[JXOrderSettlementViewController alloc]init];
            [weakSelf.navigationController pushViewController:orderSettlementViewController animated:YES];
        }
    }];
}

#pragma mark - 动画

/** 添加 购物车的动画 */
- (void)addCartAnimation
{
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"goodsDetailImageData"];
    UIImage *image = nil;
    if (data == nil) {
        image = [UIImage imageNamed:@"placeholder"];
    }else{
        image = [UIImage imageWithData:data];
    }
    
    CGPoint startPoint = [self.view convertPoint:self.joinCartBT.center toView:XYKeyWindow.rootViewController.view];
    CGPoint endPoint = [self.view convertPoint:self.shoppingCartBT.center toView:XYKeyWindow.rootViewController.view];
    
    WeakSelf;
    [ShoppingCartTool addToShoppingCartWithGoodsImage:image
                                           startPoint:startPoint
                                             endPoint:endPoint
                                           completion:^(BOOL finished) {
                                               
                                               [weakSelf updateCartNum];
                                               
                                           }];
}

#pragma mark - 懒加载

- (UILabel*)shoppingCartNumLB
{
    if (_shoppingCartNumLB == nil) {
        _shoppingCartNumLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _shoppingCartNumLB.font = XYFont_10;
        _shoppingCartNumLB.textAlignment = NSTextAlignmentCenter;
        _shoppingCartNumLB.textColor = XYWhiteColor;
        
        _shoppingCartNumLB.backgroundColor = [UIColor redColor];
        
        _shoppingCartNumLB.layer.cornerRadius = 18/2;
        _shoppingCartNumLB.layer.masksToBounds = YES;
        
        _shoppingCartNumLB.hidden = YES;
        
    }
    return _shoppingCartNumLB;
}


- (UIButton *)shoppingCartBT {
    if (_shoppingCartBT == nil) {
        _shoppingCartBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _shoppingCartBT.frame = CGRectZero;
        _shoppingCartBT.backgroundColor = XYWhiteColor;
        
        [_shoppingCartBT setTitle:@"购物车" forState:UIControlStateNormal];
        [_shoppingCartBT setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_shoppingCartBT.titleLabel setFont:XYFont_10];
        
        [_shoppingCartBT setImage:[UIImage imageNamed:@"tabbar_buy_n"] forState:UIControlStateNormal];

        
        /** 设置图片在上 文字在下 左右居中  */
        CGSize imageSize = CGSizeMake(22, 21); //
        CGSize titleSize = [XYStringHandle sizeWithString:@"购物车" font:XYFont_10 viewWidth:1000];
        
        _shoppingCartBT.titleEdgeInsets = UIEdgeInsetsMake(0,-imageSize.width,-imageSize.height-10,0);
        _shoppingCartBT.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height,0,0,-titleSize.width);
        
        
        [_shoppingCartBT addTarget:self action:@selector(shoppingCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shoppingCartBT;
}

- (UIButton *)joinCartBT {
    if (_joinCartBT == nil) {
        _joinCartBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _joinCartBT.frame = CGRectZero;
        _joinCartBT.backgroundColor = XYBlackColor;
        
        [_joinCartBT setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_joinCartBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_joinCartBT.titleLabel setFont:XYFont_15];
        
        [_joinCartBT addTarget:self action:@selector(joinCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _joinCartBT;
}


- (UIButton *)buyNowBT {
    if (_buyNowBT == nil) {
        _buyNowBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyNowBT.frame = CGRectZero;
        _buyNowBT.backgroundColor = BALANCEColor;
        
        [_buyNowBT setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyNowBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_buyNowBT.titleLabel setFont:XYFont_15];
        
        [_buyNowBT addTarget:self action:@selector(buyNowButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyNowBT;
}

- (UILabel*)sellOutLB
{
    if (_sellOutLB == nil) {
        _sellOutLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _sellOutLB.backgroundColor = XYGrayColor;
        _sellOutLB.textAlignment = NSTextAlignmentCenter;
        _sellOutLB.font = XYFont_15;
        
        _sellOutLB.hidden = YES;
        
    }
    return _sellOutLB;
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
