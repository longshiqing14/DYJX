//
//  XYOrderDetailSubClassOrderDetailHeaderVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailHeaderVC.h"

#import "XYOrderDetailModel.h"

@interface XYOrderDetailSubClassOrderDetailHeaderVC ()

/** 背景 图片 */
@property (nonatomic, strong) UIImageView * bgImageView;

/** 居中 透明 背景 */
@property (nonatomic, strong) UIView * bgView;

/** 图片 */
@property (nonatomic, strong) UIImageView * iconImageView;
/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;

@end

@implementation XYOrderDetailSubClassOrderDetailHeaderVC

/** view  高度 */
const CGFloat sub_order_Detail_Header = 60.0;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];
    
    

}





- (void)setStateInfoModel:(XYOrderDetailProcessStateInfoModel *)stateInfoModel
{
    _stateInfoModel = stateInfoModel;
    
    
//    p100:待付款,p101:待发货,p102:待收货,p112:已完成,p111:已取消
    
//    order_detail_header_close
//    order_detail_header_success
//    order_detail_header_wait
    
    if ([_stateInfoModel.state isEqualToString:@"p100"]){
        self.iconImageView.image = [UIImage imageNamed:@"order_detail_header_wait"];
    }else if ([_stateInfoModel.state isEqualToString:@"p101"]) {
        self.iconImageView.image = [UIImage imageNamed:@"order_detail_header_wait"];
    }else if ([_stateInfoModel.state isEqualToString:@"p102"]){
        self.iconImageView.image = [UIImage imageNamed:@"order_detail_header_wait"];
    }else if ([_stateInfoModel.state isEqualToString:@"p111"]){
        self.iconImageView.image = [UIImage imageNamed:@"order_detail_header_close"];
    }else if ([_stateInfoModel.state isEqualToString:@"p112"]){
        self.iconImageView.image = [UIImage imageNamed:@"order_detail_header_success"];
    }
    
    self.titleLB.text = _stateInfoModel.name;
    
    CGSize size = [XYStringHandle sizeWithString:_stateInfoModel.name font:XYFont_14 viewWidth:1000];
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(21 + size.width + 10);
    }];
    
}



/** 添加 view */
- (void)addViewAndLayout
{
//    UIView * supperView = self.view;
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(sub_order_Detail_Header);
    }];
    
    [self.bgImageView addSubview:self.bgView];
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_bgImageView.center);
        make.height.mas_equalTo(sub_order_Detail_Header);
        make.width.mas_equalTo(21);
    }];
    
    [self.bgView addSubview:self.iconImageView];
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.width.height.mas_equalTo(21);
        make.left.mas_equalTo(0);
    }];
    
    [self.bgView addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.right.mas_equalTo(0);
    }];
    
}



#pragma mark - 懒加载

- (UIImageView*)bgImageView
{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImageView.image = [UIImage imageNamed:@"order_detail_header_bg"];
    }
    return _bgImageView;
}

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
    }
    return _iconImageView;
}


- (UILabel *)titleLB
{
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYWhiteColor;
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        
        _titleLB.text = @"";
        
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
