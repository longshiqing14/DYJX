//
//  JXClassificationByWebVC.m
//  user
//
//  Created by 岩  熊 on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXClassificationByWebVC.h"
#import "XYQRCodePushCommon.h"
#import "JXSearchHistoryPage.h"

static CGFloat const KSearchFieldHeight = 32;
static CGFloat const KSearchFieldEdge = 30;
@interface JXClassificationByWebVC ()<UITextFieldDelegate>{
    BOOL isOpen;
}
@property (nonatomic,strong) UITextField *searchTextField;

@property (nonatomic,strong) UIButton *scanBtn;
@end

@implementation JXClassificationByWebVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (isOpen) {
        [self loadRequestUrl];
        isOpen = NO;
    }

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.myWebView.scrollView.bounces = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange:) name:@"cityIDNotification" object:nil];
    self.view.backgroundColor = XYGlobalBg;
    [self.searchTextField resignFirstResponder];
    //    [self setRightTitleButtonWith:@"" selectedTitle:nil target:self action:@selector(rightClick)];
    
    [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    
    self.webURLstr = [NSString stringWithFormat:@"%@search/#/",BEST_H5_URL];
    [self initNav];
    [self loadRequestUrl];
    self.myWebView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
}

- (void)cityChange:(NSNotification*)sender{
    NSNumber *boolisOpen=(NSNumber *)sender.object;
    isOpen=[boolisOpen boolValue];
}

- (void)headerRefresh{
    [self loadRequestUrl];
}

- (void)webViewLoadingEnd{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [self endRefresh];
}

- (void)endRefresh{

    [self.myWebView.scrollView.mj_header endRefreshing];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.searchTextField resignFirstResponder];
    [self.view resignFirstResponder];
}

-(void)initNav{
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.scanBtn];
    
    self.navigationItem.titleView = self.searchTextField;
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.placeholder = @"请输入商品、品牌名称进行搜索";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - AutoSize(KSearchFieldEdge), KSearchFieldHeight)];
        _searchTextField.delegate = self;
        _searchTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSearchFieldHeight, KSearchFieldHeight)];
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search"]];
        iconView.center = _searchTextField.leftView.center;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.tintColor = [UIColor colorWithHexString:@"FA5E71"];
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
        _searchTextField.layer.cornerRadius = 4;
        _searchTextField.font = [UIFont systemFontOfSize:13];
        [_searchTextField.leftView addSubview:iconView];
        _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _searchTextField;
}

- (UIButton*)scanBtn
{
    if (_scanBtn == nil) {
        _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _scanBtn.frame = CGRectMake(0, 0, 22, 22);
        _scanBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, -8);
        [_scanBtn setImage:[UIImage imageNamed:@"nav_btn_ewm"] forState:UIControlStateNormal];
        [_scanBtn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanBtn;
}

- (void)leftClick:(UIButton*)sender
{
    [XYQRCodePushCommon pushToQRCodeTarget:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    JXSearchHistoryPage * searchHistoryPage = [[JXSearchHistoryPage alloc]init];
    [self.navigationController pushViewController:searchHistoryPage animated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"cityIDNotification" object:nil];
}
@end
