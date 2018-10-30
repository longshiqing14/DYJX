//
//  XYEWalletPreDepositReturnHeaderVC.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositReturnHeaderVC.h"

@interface XYEWalletPreDepositReturnHeaderVC ()

/** 底层 */
@property (nonatomic, strong) UIView * bgView;
/** 黑色图 */
@property (nonatomic, strong) UIImageView * blackImageView;

/** 内容 底图 */
@property (nonatomic, strong) UIImageView * contentImageView;


/** 金额 */
@property (nonatomic, strong) UILabel * amountsLB;
/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
/** 时间 */
@property (nonatomic, strong) UILabel * timeLB;
/** 副标题 */
@property (nonatomic, strong) UILabel * subLB;

@property(strong,nonatomic) UIView *lineView ;


@end

@implementation XYEWalletPreDepositReturnHeaderVC

const CGFloat ewallet_PreDeposit_header_height = 225.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYGlobalBg;
    
    [self creatGui];
    
    
    
}




-(void)creatGui{

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(ewallet_PreDeposit_header_height);
    }];
    
    [self.blackImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(135);
    }];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(23);
        make.right.mas_equalTo(-23);
        make.height.mas_equalTo(176);
    }];
    
    [self.amountsLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(31);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(24);
    }];
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_offset(-20);
        make.height.mas_equalTo(37);
        make.top.mas_equalTo(_amountsLB.mas_bottom).offset(12);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(105);
        make.left.right.mas_offset(0);
        make.height.mas_offset(0.5);
    }];
    [self.timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-44);
        make.height.mas_equalTo(12);
    }];
    
    [self.subLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_timeLB.mas_left);
        make.right.mas_equalTo(_timeLB.mas_right);
        make.bottom.mas_equalTo(-25);
        make.height.mas_equalTo(13);
    }];
    
    
    
    
}

-(void)setDataModel:(XYEWalletPreDepositDetailModel *)dataModel
{
    _dataModel = dataModel;
    self.amountsLB.text = [NSString stringWithFormat:@"￥%@",dataModel.totalPrice];
    self.titleLB.text = dataModel.productName;
    self.timeLB.text = [NSString stringWithFormat:@"充值时间：%@",dataModel.formatCreateTime];
    self.subLB.text = [NSString stringWithFormat:@"预存%@元分%@月返还",dataModel.totalPrice,dataModel.priceTimes];
}



#pragma mark - 懒加载
-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = XYLineColor;
        [self.contentImageView addSubview:_lineView];
    }
    return _lineView;
}
- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYGlobalBg;
        [self.view addSubview:_bgView];
    }
    return _bgView;
}

- (UIImageView*)blackImageView
{
    if (_blackImageView == nil) {
        _blackImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _blackImageView.backgroundColor = XYBlackColor;
        [self.view addSubview:_blackImageView];
    }
    return _blackImageView;
}

- (UIImageView*)contentImageView
{
    if (_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _contentImageView.contentMode = UIViewContentModeScaleToFill;
        _contentImageView.image = [UIImage imageNamed:@"ewallet_revert_price_bg"];
        [self.view addSubview:_contentImageView];
    }
    return _contentImageView;
}



- (UILabel*)amountsLB
{
    if (_amountsLB == nil) {
        _amountsLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _amountsLB.textAlignment = NSTextAlignmentCenter;
        _amountsLB.textColor = XYMainColor;
        _amountsLB.font = XYFont(24);
        [self.contentImageView addSubview:_amountsLB];
    }
    return _amountsLB;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        _titleLB.font = XYFont_12;
        _titleLB.numberOfLines = 3;
        _titleLB.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentImageView addSubview:_titleLB];
    }
    return _titleLB;
}

- (UILabel*)timeLB
{
    if (_timeLB == nil) {
        _timeLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _timeLB.textAlignment = NSTextAlignmentLeft;
        _timeLB.textColor = XYGrayColor;
        _timeLB.font = XYFont_12;
        
        [self.contentImageView addSubview:_timeLB];
    }
    return _timeLB;
}

- (UILabel*)subLB
{
    if (_subLB == nil) {
        _subLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _subLB.textAlignment = NSTextAlignmentLeft;
        _subLB.textColor = XYGrayColor;
        _subLB.font = XYFont_12;
        [self.contentImageView addSubview:_subLB];
    }
    return _subLB;
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
