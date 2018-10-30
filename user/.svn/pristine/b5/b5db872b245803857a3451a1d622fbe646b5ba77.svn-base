//
//  XYMineHeaderVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineHeaderVC.h"

#import "XYUserInfoModel.h"

#import "XYEWalletVC.h"

#import "XYLoginVC.h"

#import "XYPersonalInfoVC.h"

#import "JXMinePointsControl.h"
#import "JXPointsVC.h"
@interface XYMineHeaderVC ()


/** 背景图 */
@property (nonatomic, strong) UIImageView * bgImageView;

/** 头像 */
@property (nonatomic, strong) UIImageView * iconImageView;

/** 名字 */
@property (nonatomic, strong) UILabel * nameLB;

/** 余额 背景 */
@property (nonatomic, strong) UIImageView * titleBgImageView;

/** 余额  */
@property (nonatomic, strong) UILabel * titleLB;

/** 余额 按钮 */
//@property (nonatomic, strong) UIButton * titleBT;
@property (nonatomic, strong) JXMinePointsControl * titleBT;

/** 积分 按钮 */
@property (nonatomic, strong) JXMinePointsControl * pointsBT;

/** 优惠券 按钮 */
@property (nonatomic, strong) JXMinePointsControl * couponsBT;

/** 登录为空时，覆盖头部  */
@property(strong,nonatomic) UIButton *maskBtn ;
@end

@implementation XYMineHeaderVC

const CGFloat mine_header_height = 214.0;

static CGFloat const iconImageHeight = 59;
static CGFloat const titleImageHeight = 61;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
//    [self addViewAndLayout];
    
    [self.view addSubview:self.bgImageView];
    
    [self.view addSubview:self.iconImageView];
    
    [self.view addSubview:self.nameLB];
    
//    [self.view addSubview:self.titleBgImageView];
//    
//    [self.titleBgImageView addSubview:self.titleLB];
    
    [self.view addSubview:self.titleBT];
    
    [self.view addSubview:self.pointsBT];
    [self.view addSubview:self.couponsBT];
    
    [self addViewAndLayout];
    
//    [self updateHeaderData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateHeaderData];
}


- (void)updateHeaderData
{
    
    NSDictionary * userinfoDict = [XYUserDefaults readUserDefaultsInfo];
   
    if (userinfoDict.count == 0) {
        
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"placeholder_person"] options:0];
        
        self.nameLB.text = @"未登录，请点击登录";
        
//        NSString * titleStr = [NSString stringWithFormat:@"余额：￥0.00"];
        
//        [self.titleBT setTitle:titleStr forState:UIControlStateNormal];
        self.titleBT.titleLb.text = @"余额";
        self.titleBT.valueLb.text = @"￥0.00";
        self.pointsBT.titleLb.text = @"积分";
        self.pointsBT.valueLb.text = @"0";
        self.couponsBT.titleLb.text = @"优惠券";
        self.couponsBT.valueLb.text = @"0";
        
        self.maskBtn.frame = CGRectMake(0, 0, XYScreenW, mine_header_height);
    
    }else{
        
        self.maskBtn.frame = CGRectZero;
        XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:userinfoDict];
       
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",infoModel.userImage]] placeholderImage:[UIImage imageNamed:@"placeholder_person"] options:0];
        
        self.nameLB.text = infoModel.nickName;

        
        
//        NSString * titleStr = [NSString stringWithFormat:@"余额：￥%@",infoModel.depositBalance];
//
//        [self.titleBT setTitle:titleStr forState:UIControlStateNormal];
        
        self.titleBT.titleLb.text = @"余额";
        self.titleBT.valueLb.text = [NSString stringWithFormat:@"￥%@",infoModel.depositBalance];
        self.pointsBT.titleLb.text = @"积分";
        self.pointsBT.valueLb.text = infoModel.points;
        self.couponsBT.titleLb.text = @"优惠券";
        self.couponsBT.valueLb.text = infoModel.couponCount;
    }
    
 
    
    
    [self addViewAndLayout];
    
}



/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    
    [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(39);
        make.centerX.mas_equalTo(supperView.mas_centerX);
        make.width.height.mas_equalTo(iconImageHeight);
    }];
    
    [self.nameLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(9);
        make.left.right.mas_equalTo(0);
    }];
    
    
//    CGSize size;
//
//    size = [XYStringHandle sizeWithString:self.titleBT.titleLabel.text font:XYFont_16 viewWidth:1000];
//    size.width += 20;
    
    
    [self.titleBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(titleImageHeight);
        make.width.mas_equalTo(kScreenWidth/3);
    }];
    
    [self.pointsBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(titleImageHeight);
        make.width.mas_equalTo(kScreenWidth/3);
    }];
    
    [self.couponsBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(titleImageHeight);
        make.width.mas_equalTo(kScreenWidth/3);
    }];
   
    

//    [self.titleBgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(supperView.mas_centerX);
//        make.bottom.mas_equalTo(-10);
//        make.height.mas_equalTo(titleImageHeight);
//        make.width.mas_equalTo(size.width+ 40);
//    }];
//
//    
//    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(_titleBgImageView.mas_centerX);
//        make.top.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(size.width);
//    }];
    
    
}

-(void)toPersonInfoVc:(id)sender
{
    XYPersonalInfoVC *personInfoVC = [[XYPersonalInfoVC alloc] init];
    [self.navigationController pushViewController:personInfoVC
                                         animated:YES];

}

#pragma mark - button click
- (void)titleButtonClick
{
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    XYEWalletVC * ewalletVC = [[XYEWalletVC alloc]init];
    [self.navigationController pushViewController:ewalletVC animated:YES];
}

- (void)pointsButtonClick{
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    JXPointsVC * pointsVC = [[JXPointsVC alloc]init];
    [self.navigationController pushViewController:pointsVC animated:YES];
}

- (void)couponsButtonClick{
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //这个字符串是你要跳转面板的名字
    UIViewController *main =[board instantiateViewControllerWithIdentifier:@"JXMyCouponsID"];
    [self.navigationController pushViewController:main animated:YES];
}
-(void)maskBtnHandler:(id)sender{
    
    [XYCommon setPresentViewControllerWithLoginView];

}

#pragma mark - 懒加载

- (UIImageView*)bgImageView
{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImageView.image = [UIImage imageNamed:@"info_header_bg"];
//        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        

        
    }
    return _bgImageView;
}

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        _iconImageView.image = [UIImage imageNamed:@"placeholder_person"];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        
    
        _iconImageView.layer.cornerRadius = iconImageHeight/2;
        _iconImageView.layer.masksToBounds = YES;
        
        _iconImageView.layer.borderWidth = 1;
        _iconImageView.layer.borderColor = XYWhiteColor.CGColor;
        _iconImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toPersonInfoVc:)];
        tap.numberOfTapsRequired = 1;
        [_iconImageView addGestureRecognizer:tap];
        
    }
    return _iconImageView;
}

- (UILabel*)nameLB
{
    if (_nameLB == nil) {
        
        _nameLB = [[UILabel alloc]initWithFrame:CGRectZero];
      
        _nameLB.textAlignment = NSTextAlignmentCenter;
        _nameLB.font = XYFont_14;
        _nameLB.textColor = XYWhiteColor;
        _nameLB.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toPersonInfoVc:)];
        tap.numberOfTapsRequired = 1;
        [_nameLB addGestureRecognizer:tap];
        
    }
    return _nameLB;
}

- (UIImageView*)titleBgImageView
{
    if (_titleBgImageView == nil) {
        _titleBgImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _titleBgImageView.image = [UIImage imageNamed:@"info_headerb_title_bg"];
        
        _titleBgImageView.layer.cornerRadius = titleImageHeight/2;
        _titleBgImageView.layer.masksToBounds = YES;
    }
    return _titleBgImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.font = XYFont_16;
        _titleLB.textColor = XYWhiteColor;
        
    }
    return _titleLB;
}

//- (UIButton*)titleBT
//{
//    if (_titleBT == nil) {
//        _titleBT = [UIButton buttonWithType:UIButtonTypeCustom];
//
//        _titleBT.frame = CGRectZero;
//
//        [_titleBT setBackgroundImage:[UIImage imageNamed:@"info_headerb_title_bg"] forState:UIControlStateNormal];
//
//        [_titleBT setImage:[UIImage imageNamed:@"info_header_title_money"] forState:UIControlStateNormal];
//        [_titleBT setTitle:@"余额：￥" forState:UIControlStateNormal];
//        [_titleBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
//        [_titleBT.titleLabel setFont:XYFont_16];
//
//        _titleBT.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
//
//        [_titleBT addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
//
//    }
//    return _titleBT;
//}

- (JXMinePointsControl *)titleBT{
    if (!_titleBT) {
        _titleBT = [[NSBundle mainBundle] loadNibNamed:@"JXMinePointsControl" owner:self options:nil].lastObject;
        [_titleBT addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _titleBT.lineView.hidden = YES;
    }
    return _titleBT;
}

- (JXMinePointsControl *)pointsBT{
    if (!_pointsBT) {
        _pointsBT = [[NSBundle mainBundle] loadNibNamed:@"JXMinePointsControl" owner:self options:nil].lastObject;
        [_pointsBT addTarget:self action:@selector(pointsButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pointsBT;
}

- (JXMinePointsControl *)couponsBT{
    if (!_couponsBT) {
        _couponsBT = [[NSBundle mainBundle] loadNibNamed:@"JXMinePointsControl" owner:self options:nil].lastObject;
        [_couponsBT addTarget:self action:@selector(couponsButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _couponsBT;
}

-(UIButton *)maskBtn
{
    if (!_maskBtn) {
        _maskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_maskBtn addTarget:self action:@selector(maskBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_maskBtn];
    }
    return _maskBtn;

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
