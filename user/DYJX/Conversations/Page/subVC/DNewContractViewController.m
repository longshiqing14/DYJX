//
//  DNewContractViewController.m
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DNewContractViewController.h"
#import "JSExtension.h"
#import "MutableSelectCell.h"
#import "HeadSearchView.h"
#import "NIMKitTitleView.h"
#import "DYSelecteContractsPage.h"
#import "CQColorfulAlertView.h"
#import "IMSDK.h"
#import "DLHeadScanView.h"
#import "DYJXQRCodePage.h"
#import "SWQRCodeViewController.h"

@interface DNewContractViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)DLHeadScanView *scanView;

@end

@implementation DNewContractViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.headView];
    [self.view addSubview:self.scanView];
    [self.view addSubview:self.tableView];

    [self baseUI];
    [self setUpTitleView];

    // 已读
}

- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;

        titleView.titleLabel.text = @"新增联系人";
    }

    [titleView sizeToFit];
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MutableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MutableSelectCell"];
    if (!cell) {
        cell = [[MutableSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MutableSelectCell"];
    }

    return (RCConversationBaseCell *)cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Action

-(void)buttonClick:(UIButton *)sender {
    if (sender.tag == 1) {
        NSLog(@"添加手机联系人");
    }
    else if(sender.tag == 2) {
        NSLog(@"扫一扫");
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;

        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        [self.navigationController pushViewController:qrcodeVC animated:YES];
    }
    else if(sender.tag == 3) {
        NSLog(@"二维码");
        DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
        qrCodePage.userIdOrCompanyId = [UserManager shared].getUserModel.UserID;
        qrCodePage.companyNumber = [UserManager shared].getUserModel.Result.NumberString;
        qrCodePage.companyName = [UserManager shared].getUserModel.Result.UserName;
        [self.navigationController pushViewController:qrCodePage animated:YES];
    }
}

-(void)black_controller {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchClick:(UIButton *)sender {
    [self.view resignFirstResponder];
}

#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, kScreenHeight - 64 - 150) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delaysContentTouches = NO;
    }
    return _tableView;
}

-(DLHeadScanView *)scanView {
    if (!_scanView) {
        _scanView = [[DLHeadScanView alloc] initWithFrame:CGRectMake(0, 60, kScreenWidth, 90)];
        [_scanView.contractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scanView.scanButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scanView.qrCodeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanView;
}

@end
