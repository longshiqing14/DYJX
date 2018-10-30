//
//  XYMyBoardBandSecondChildVC.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandSecondChildVC.h"
#import "XYBoardBandEditDetailVC.h"
@interface XYMyBoardBandSecondChildVC ()<XYBoardBandEditDetailVCDelegate>
/** 图片 */
@property(nonatomic,strong) UIImageView *imgV;
@property(strong,nonatomic) UILabel *descLab; ;
/** 完善信息 */
@property(strong,nonatomic) UIButton *chargeBtn ;
@end

@implementation XYMyBoardBandSecondChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WeakSelf;
    //215*117
    
    self.view.backgroundColor = XYWhiteColor;
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_offset(150);
        make.width.mas_offset(215);
        make.height.mas_offset(117);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(_imgV.mas_bottom).offset(17);
    }];
    
    [self.chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(47);
        make.right.mas_equalTo(-47);
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(_descLab.mas_bottom).offset(17);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
        _descLab.text = @"您的宽带安装信息未完善，无法查看宽带信息~";
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
        [_chargeBtn setTitle:@"完善信息" forState:UIControlStateNormal];
        _chargeBtn.titleLabel.font = XYFont_15;
        [_chargeBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_chargeBtn addTarget:self action:@selector(chargeBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_chargeBtn];
    }
    
    return _chargeBtn;
}

-(void)chargeBtnHandler:(UIButton *)sender{
    XYBoardBandEditDetailVC *detailVC = [[XYBoardBandEditDetailVC alloc] init];
    detailVC.delegate = self;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

-(void)needRefreshData
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(needFatherVCRefreshData)]) {
        [self.delegate needFatherVCRefreshData];
    }
}


@end
