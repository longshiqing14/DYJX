//
//  XYQRCodeScanningVC.m
//  user
//
//  Created by xingyun on 2017/9/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYQRCodeScanningVC.h"

#import "XYBestWebVC.h"

#import "XYGoodsSearchVC.h"

#import "XYGoodsSearchResultVC.h"

@interface XYQRCodeScanningVC ()

@property (nonatomic, strong) UIView * navView;

@property (nonatomic, strong) UIButton * navLeftButton;

@property (nonatomic, strong) UILabel * navTitleLB;

@property (nonatomic, strong) UIButton * inputBT;

/** 避免重复加载 */
@property (nonatomic, assign) BOOL isFirstAddView;


@end

@implementation XYQRCodeScanningVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"扫一扫";

    
    self.isOpenInterestRect = YES;
    self.libraryType = SLT_Native;
    
    self.cameraInvokeMsg = @"相机启动中";
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.isFirstAddView) {
        
    }else{
        [self addViewAndLayout];
        self.isFirstAddView = YES;
    }
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}



/** 添加 view */
- (void)addViewAndLayout
{
    [self.view addSubview:self.navView];

//    WeakSelf;
    [self.navView addSubview:self.navLeftButton];
    [self.navView addSubview:self.navTitleLB];
    [self.navTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.navView.mas_centerX);
        make.bottom.mas_equalTo(-14);
    }];
    
    [self.view addSubview:self.inputBT];
    [self.inputBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
}





#pragma mark - button click

- (void)leftButtonClick:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)inputButtonClick:(UIButton*)sender
{
    
    XYGoodsSearchVC * searchVC = [[XYGoodsSearchVC alloc]init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - 懒加载

- (UIView*)navView
{
    if (_navView == nil) {
        
        
        if (XYScreenH == 812) { //适配iphone x
              _navView = [[UIView alloc]initWithFrame:CGRectMake(0,24, XYScreenW, 64)];
        }else
        {
              _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 64)];
        }
      
        
        _navView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
//        _navView.backgroundColor = [UIColor redColor];
    }
    return _navView;
}

- (UIButton*)navLeftButton
{
    if (_navLeftButton == nil) {
        
        _navLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _navLeftButton.frame = CGRectMake(10, 33, 20, 20);
        
        [_navLeftButton setImage:[UIImage imageNamed:@"qrcode_icon_goback"] forState:UIControlStateNormal];
        [_navLeftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _navLeftButton;
}

- (UILabel*)navTitleLB
{
    if (_navTitleLB == nil) {
        _navTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _navTitleLB.text = @"扫码找商品";
        _navTitleLB.textAlignment = NSTextAlignmentCenter;
        _navTitleLB.textColor = XYWhiteColor;
        _navTitleLB.font = XYFont_16;
        
    }
    return _navTitleLB;
}

- (UIButton*)inputBT
{
    if (_inputBT == nil) {
        _inputBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _inputBT.backgroundColor = XYRGBAColor(0, 0, 0, 0.6);
        
        [_inputBT setImage:[UIImage imageNamed:@"qrcode_icon_ewm_pen"] forState:UIControlStateNormal];
        
        [_inputBT setTitle:@"手动输入商品条形码" forState:UIControlStateNormal];
        [_inputBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_inputBT.titleLabel setFont:XYFont_17];
        
        _inputBT.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        
        [_inputBT addTarget:self action:@selector(inputButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _inputBT;
}



#pragma mark -实现类继承该方法，作出对应处理

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array ||  array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //经测试，可以ZXing同时识别2个二维码，不能同时识别二维码和条形码
    //    for (LBXScanResult *result in array) {
    //
    //        NSLog(@"scanResult:%@",result.strScanned);
    //    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //TODO: 这里可以根据需要自行添加震动或播放声音提示相关代码
    //...
    
    [self showNextVCWithScanResult:scanResult];
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
    
    WeakSelf;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:strResult message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf reStartDevice];
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
    
    XYLog(@"  strScanned   %@  ",strResult.strScanned);
    
    if ([strResult.strScanned hasPrefix:@"http://"] || [strResult.strScanned hasPrefix:@"https://"]) {
        XYBestWebVC * webVC = [[XYBestWebVC alloc]init];
//        detailModel.shareUrl=
        webVC.webURLstr = [[NSString stringWithFormat:@"%@",strResult.strScanned] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`%^{}\"[]|\\<> "].invertedSet];
        [self.navigationController pushViewController:webVC animated:YES];
    }else{
        XYGoodsSearchResultVC * searchResultVC = [[XYGoodsSearchResultVC alloc]init];
        searchResultVC.barcode = strResult.strScanned;
        [self.navigationController pushViewController:searchResultVC animated:YES];
        
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
