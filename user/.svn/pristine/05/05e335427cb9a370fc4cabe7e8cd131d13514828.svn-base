//
//  XYMyBoardBandFirstChildVC.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandFirstChildVC.h"

#import "XYBoardBandRenewalDetailVC.h"
#import "XYPreDepositVC.h"
#import "XYBindingBoardBandVC.h"

@interface XYMyBoardBandFirstChildVC ()
/** 图片 */
@property(nonatomic,strong) UIImageView *imgV;
@property(strong,nonatomic) UILabel *descLab; ;
/** 充值送宽带 */
@property(strong,nonatomic) UIButton *chargeBtn ;

/** 注册 */
@property(strong,nonatomic) UILabel *topTitleLab ;
/** 注册描述 */
@property(strong,nonatomic) UILabel *topDescLab ;
/** 图标 */
@property(strong,nonatomic) UIImageView *topIconView ;
/** 上边的下一页 */
//@property(strong,nonatomic) UIImageView *topNextImgV ;

@property(strong,nonatomic) UIImageView *topCoverView ;

@property(strong,nonatomic) UIImageView *sepcialLineV ;
@property(strong,nonatomic) UILabel *bottomTitleLab ;

@property(strong,nonatomic) UILabel *bottomDescribeLab ;

@property(strong,nonatomic) UIImageView *bottomIconView ;

//@property(strong,nonatomic) UIImageView *bottomNextImgV;

@property(strong,nonatomic) UIImageView *bottomCoverView ;
@end

@implementation XYMyBoardBandFirstChildVC

- (void)viewDidLoad {
    [super viewDidLoad];

    WeakSelf;
    //215*117
    
    self.view.backgroundColor = XYWhiteColor;
    
    [self.topTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_topLayoutGuide).offset(40);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];
    [self.topDescLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_topTitleLab.mas_bottom).offset(10);
        make.height.mas_equalTo(15);
    }];
    [self.topIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_topDescLab.mas_bottom).offset(19);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX).offset(10);
        make.height.mas_equalTo(85);
        make.width.mas_equalTo(100);
    }];
    [self.topCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.mas_topLayoutGuide);
        make.height.mas_equalTo(199);
    }];
    [self.sepcialLineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_topIconView.mas_bottom).offset(18);
        make.height.mas_equalTo(20);
    }];
    [self.bottomTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_sepcialLineV.mas_bottom).offset(24);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];
    
    [self.bottomDescribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_bottomTitleLab.mas_bottom).offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];
    
    [self.bottomIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_bottomDescribeLab.mas_bottom).offset(19);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX).offset(10);
        make.height.mas_equalTo(85);
        make.width.mas_equalTo(100);
    }];
    
    
    
    [self.bottomCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(_sepcialLineV.mas_bottom);
        make.height.mas_equalTo(199);
        make.left.right.mas_equalTo(0);
    }];
    
    ///过期UI
//    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_offset(150);
//        make.width.mas_offset(215);
//        make.height.mas_offset(117);
//        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
//    }];
//
//    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(15);
//        make.top.mas_equalTo(_imgV.mas_bottom).offset(17);
//    }];
//
//    [self.chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(47);
//        make.right.mas_equalTo(-47);
//        make.height.mas_equalTo(45);
//        make.top.mas_equalTo(_descLab.mas_bottom).offset(17);
//    }];
    
}
#pragma mark - 最新UI
-(UILabel *)topTitleLab
{
    if (!_topTitleLab) {
        _topTitleLab = [UILabel new];
        _topTitleLab.font = XYFont_15;
        _topTitleLab.textColor = XYRGBColor(253, 135, 135);
        _topTitleLab.text = @"新用户注册，未办理过长城宽带";
        _topTitleLab.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_topTitleLab];
    }
    return _topTitleLab;
    
}

-(UILabel *)topDescLab
{
    if (!_topDescLab) {
        _topDescLab = [UILabel new];
        _topDescLab.font = XYFont_15;
        _topDescLab.textAlignment = NSTextAlignmentCenter;
        _topDescLab.text = @"充值送宽带";
        _topDescLab.textColor = XYGrayColor;
        [self.view addSubview:_topDescLab];
    }
    return _topDescLab;
    
}
-(UIImageView *)topIconView
{
    if (!_topIconView) {
        _topIconView = [[UIImageView alloc] init];
        _topIconView.image = [UIImage imageNamed:@"xy_broadband_recharge"];
        _topIconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:_topIconView];
    }
    return _topIconView;
}

-(UIImageView *)topCoverView
{
    if (!_topCoverView ) {
        _topCoverView = [[UIImageView alloc] init];
        _topCoverView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chargeBtnHandler:)];
        tap.numberOfTapsRequired =1;
        [_topCoverView addGestureRecognizer:tap];
        [self.view addSubview:_topCoverView];
    }
    return _topCoverView;
}

-(UIImageView *)sepcialLineV
{
    if (!_sepcialLineV) {
        _sepcialLineV = [[UIImageView alloc] init];
        _sepcialLineV.image = [UIImage imageNamed:@"xy_broadband_sepcial_line"];
        [self.view addSubview:_sepcialLineV];
    }
    return _sepcialLineV;
}
-(UILabel *)bottomTitleLab
{
    if (!_bottomTitleLab) {
        _bottomTitleLab = [UILabel new];
        _bottomTitleLab.font = XYFont_15;
        _bottomTitleLab.textAlignment = NSTextAlignmentCenter;
        _bottomTitleLab.textColor = XYRGBColor(110, 192, 240);
        _bottomTitleLab.text = @"已通过其他渠道办理过长城宽带";
        [self.view addSubview:_bottomTitleLab];
    }
    return _bottomTitleLab;
    
}
-(UILabel *)bottomDescribeLab
{
    if (!_bottomDescribeLab) {
        _bottomDescribeLab = [UILabel new];
        _bottomDescribeLab.font =XYFont_15;
        _bottomDescribeLab.textAlignment = NSTextAlignmentCenter;
        _bottomDescribeLab.text = @"绑定已有宽带";
        _bottomDescribeLab.textColor = XYGrayColor;
        [self.view addSubview:_bottomDescribeLab];
    }
    return _bottomDescribeLab;
}
-(UIImageView *)bottomIconView
{
    if (!_bottomIconView) {
        _bottomIconView = [[UIImageView alloc] init];
        _bottomIconView.image = [UIImage imageNamed:@"xy_broadband_binding"];
        _bottomIconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:_bottomIconView];
    }
    return _bottomIconView;
}

-(UIImageView *)bottomCoverView
{
    if (!_bottomCoverView) {
        _bottomCoverView = [[UIImageView alloc] init];
        _bottomCoverView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bottomCoverViewHandler:)];
        tap.numberOfTapsRequired =1;
        [_bottomCoverView addGestureRecognizer:tap];
        [self.view addSubview:_bottomCoverView];
    }
    return _bottomCoverView;
}

#pragma mark ===============过期UI==============
-(UIImageView *)imgV{

    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        _imgV.image = [UIImage imageNamed:@"no-band"];
        [self.view addSubview:_imgV];
    }
    return _imgV;
}

-(UILabel *)descLab{

    if (!_descLab) {
        _descLab = [UILabel new];
        _descLab.font = XYFont_15;
        _descLab.textColor = XYGrayColor;
        _descLab.textAlignment = NSTextAlignmentCenter;
        _descLab.text = @"您暂未办理宽带业务哦~";
        [self.view addSubview:_descLab];
    }
    return _descLab;
    
}

-(UIButton *)chargeBtn
{
    if (!_chargeBtn) {
        _chargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chargeBtn setBackgroundColor:XYMainColor];
        _chargeBtn.layer.cornerRadius = 5;
        _chargeBtn.layer.masksToBounds = YES;
        [_chargeBtn setTitle:@"充值送宽带" forState:UIControlStateNormal];
        _chargeBtn.titleLabel.font = XYFont_15;
        [_chargeBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_chargeBtn addTarget:self action:@selector(chargeBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_chargeBtn];
    }

    return _chargeBtn;
}

-(void)chargeBtnHandler:(id )sender{
    XYPreDepositVC *detailVC = [[XYPreDepositVC alloc] init];
    detailVC.isProductList = @"Y";
    [self.navigationController pushViewController:detailVC animated:YES];

}
-(void)bottomCoverViewHandler:(id)sender{
    
    XYBindingBoardBandVC *bindVC = [[XYBindingBoardBandVC alloc] init];
    [self.navigationController pushViewController:bindVC animated:YES];
}

@end
