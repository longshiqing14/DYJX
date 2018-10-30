//
//  JXGoToShopCartControl.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXGoToShopCartControl.h"
#import "XYShoppingCartVC.h"

static NSInteger kCartImageView = 22;
static NSInteger kNumberViewHeight = 17;

@interface JXGoToShopCartControl ()
@property (nonatomic,strong)UIImageView *cartImageView;
@property (nonatomic,strong)UIView *numberView;
@property (nonatomic,strong)UILabel *numberLab;
@property (nonatomic,assign)BOOL isTopItem;
@property (nonatomic) UIViewController *currentVC;
@end

@implementation JXGoToShopCartControl

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        WeakSelf;
        self.isTopItem = YES;
        [self addSubview];
        [self addTarget:self action:@selector(gotoShopCart) forControlEvents:UIControlEventTouchUpInside];
        weakSelf.shoppingCartNumber = [[XYUserDefaults readAppDlegateOfCartCountStr] integerValue]  ;
//        [self.KVOController observe:[EABABadgeManager sharedInstance] keyPath:@keypath2([EABABadgeManager sharedInstance],numInCart) block:^(id observer, id object, id newValue, id oldValue) {
//            weakSelf.shoppingCartNumber = [newValue integerValue];
//        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItemsBadge:) name:XY_notification_ItemsBadge object:nil];

    }
    return self;
}

+(instancetype)goToShopCartControllerWithCurrentVC:(UIViewController *)currentVC
{
    JXGoToShopCartControl *cart = [[JXGoToShopCartControl alloc] initWithFrame:CGRectMake(AutoSize(16), kScreenHeight - AutoSize(55 + 46) - 64, AutoSize(46), AutoSize(46))];
    //
    [currentVC.view addSubview:cart];
    [currentVC.view bringSubviewToFront:cart];
    [cart.cartImageView setImage:[UIImage imageNamed:@"ic_search_buy"]];
    cart.currentVC = currentVC;
    cart.isTopItem = YES;
    return cart;
}

-(void)addSubview{
    [self addSubview:self.cartImageView];
    [self addSubview:self.numberView];
    [self.numberView addSubview:self.numberLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.isTopItem) {
        [self.cartImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    else
    {
//        [self.cartImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self);
//            make.right.top.left.bottom.equalTo(self);
//        }];
    }
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.numberView.mas_centerY);
        make.centerX.mas_equalTo(self.numberView.mas_centerX);
        make.height.mas_equalTo(11);
    }];
    
    [self.numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kNumberViewHeight , kNumberViewHeight));
    }];
    self.numberView.backgroundColor = [UIColor colorWithHexString:@"#FA5D56"];
    self.numberView.layer.cornerRadius = kNumberViewHeight / 2;
    self.numberView.layer.masksToBounds = YES;
    
}
-(void)setShoppingCartNumber:(NSInteger)shoppingCartNumber{
    if (shoppingCartNumber <= 0) {
        self.numberView.hidden = YES;

        return;
    }
    else if  (shoppingCartNumber > 99) {
        self.numberLab.text = @"99";
        self.numberView.hidden = NO;
        
    }
    else {
        self.numberView.hidden = NO;
        
        self.numberLab.text = [NSString stringWithFormat:@"%zi", shoppingCartNumber];
    }
    
}

-(void)getRoundNumberView{
    CGRect size = [self.numberLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 11) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
    CGFloat width = ceilf(size.size.width);
    [self.numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(width + 3, width + 3));
    }];
    self.numberView.layer.cornerRadius = (width + 3) / 2;
    self.numberView.layer.masksToBounds = YES;
    
}
-(void)gotoShopCart{
//    XYShoppingCartVC *shopingCart = [[XYShoppingCartVC alloc]init];
//    [self.currentVC.navigationController pushViewController:shopingCart animated:NO ];
    [self.currentVC.navigationController.tabBarController setSelectedIndex:2];
    [self.currentVC.navigationController popToRootViewControllerAnimated:YES];
}

-(UIImageView *)cartImageView{
    if (!_cartImageView) {
        _cartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search_buy"]];
    }
    return _cartImageView;
}
-(UIView *)numberView{
    if (!_numberView) {
        _numberView = [[UIView alloc] init];
        _numberView.hidden = YES;
        _numberView.backgroundColor = [UIColor colorWithHexString:@"#fe3f35"];
       
        _numberView.userInteractionEnabled = NO;
    }
    return _numberView;
}
-(UILabel *)numberLab{
    if (!_numberLab) {
        _numberLab = [[UILabel alloc] init];
        _numberLab.font = [UIFont systemFontOfSize:11];
        _numberLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        
        _numberLab.textAlignment = NSTextAlignmentCenter;
        [_numberLab sizeToFit];
        _numberLab.userInteractionEnabled = NO;
    }
    return _numberLab;
}
////
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    CGFloat clickableArea =  AutoSize(45);
    
    CGFloat widthDelta = MAX(clickableArea - bounds.size.width, 0);
    CGFloat heightDelta = MAX(clickableArea - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

- (void)updateItemsBadge:(NSNotification*)noti
{
    int count = [[noti object] intValue];
    [self setShoppingCartNumber:count];
    
}


- (UIViewController *)currentVC{
    if (!_currentVC) {
        _currentVC = [[UIViewController alloc]init];
    }
    return _currentVC;
}
@end
