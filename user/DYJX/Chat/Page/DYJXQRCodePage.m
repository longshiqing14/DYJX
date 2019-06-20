//
//  DYJXQRCodePage.m
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXQRCodePage.h"

@interface DYJXQRCodePage ()
@property (nonatomic, strong)UIImageView *qrCodeImageView;
@property (nonatomic, strong)UILabel     *companyNumberLb;
@property (nonatomic, strong)UILabel     *companyNameLb;

@end

@implementation DYJXQRCodePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    [self.view addSubview:self.qrCodeImageView];
    [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-120);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    [self.qrCodeImageView setImage:[YWDTools createNonInterpolatedUIImageFormCIImage:[YWDTools createQRForString:self.userIdOrCompanyId] withSize:160]];
    
    [self.view addSubview:self.companyNumberLb];
    [self.companyNumberLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.qrCodeImageView.mas_bottom).mas_equalTo(20);
        make.centerX.mas_equalTo(0);
    }];
    self.companyNumberLb.text = [NSString stringWithFormat:@"商号：%@",self.companyNumber];
    
    [self.view addSubview:self.companyNameLb];
    [self.companyNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.companyNumberLb.mas_bottom).mas_equalTo(20);
        make.centerX.mas_equalTo(0);
    }];
    self.companyNameLb.text = [NSString stringWithFormat:@"名称：%@",self.companyName];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)qrCodeImageView{
    if (!_qrCodeImageView) {
        _qrCodeImageView = [[UIImageView alloc]init];
    }
    return _qrCodeImageView;
}

- (UILabel *)companyNameLb{
    if (!_companyNameLb) {
        _companyNameLb = [[UILabel alloc]init];
        _companyNameLb.font = [UIFont systemFontOfSize:14];
        _companyNameLb.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _companyNameLb;
}

- (UILabel *)companyNumberLb{
    if (!_companyNumberLb) {
        _companyNumberLb = [[UILabel alloc]init];
        _companyNumberLb.font = [UIFont systemFontOfSize:14];
        _companyNumberLb.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _companyNumberLb;
}

@end
