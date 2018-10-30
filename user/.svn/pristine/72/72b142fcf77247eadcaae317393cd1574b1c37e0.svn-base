//
//  XYClassificationVC.m
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationVC.h"

//#import "XYBestWebVC.h"

#import "XYPreDepositVC.h"

/** 分类 列表 */
#import "XYClassificationGoodsLeftTVC.h"
#import "XYClassificationGoodsRightCVC.h"

#import "XYClassificationNet.h" // 请求
#import "XYQRCodePushCommon.h"
#import "XYClassificationModel.h" //数据模型
#import "JXSearchHistoryPage.h"

static CGFloat const KSearchFieldHeight = 32;
static CGFloat const KSearchFieldEdge = 30;

@interface XYClassificationVC () <XYClassificationGoodsLeftDelegate>

@property(nonatomic,strong) XYClassificationGoodsLeftTVC * goodsLeftTVC;

@property(nonatomic,strong) XYClassificationGoodsRightCVC * goodsRightCVC;

@property(nonatomic,strong) NSMutableArray <XYClassificationModel*>* dataList;

@property (nonatomic,strong) UITextField *searchTextField;

@property (nonatomic,strong) UIButton *scanBtn;
@end

@implementation XYClassificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"活动";
    self.view.backgroundColor = XYGlobalBg;
    
    [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    
    [self addViewAndLayout];
    [self initNavigation];
    
    
    [self netCategoryListData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.searchTextField endEditing:YES];
}
- (void)initNavigation{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.scanBtn];
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
//    if (merchantId == nil) {
//        self.webURLstr = [NSString stringWithFormat:@"%@butler/activity/activity_page.html",BEST_H5_URL];
//    }else{
//        self.webURLstr = [NSString stringWithFormat:@"%@butler/activity/activity_page.html?merchantId=%@",BEST_H5_URL,merchantId];
//    }
//
//    [self loadRequestUrl];
//}

- (void)addViewAndLayout
{
    
    self.navigationItem.titleView = self.searchTextField;
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.placeholder = @"请输入商品、品牌名称进行搜索";
    
    [self.view addSubview:self.goodsLeftTVC.tableView];
    WeakSelf;
    [self.goodsLeftTVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
        make.width.mas_equalTo(96);
    }];
    
    [self.view addSubview:self.goodsRightCVC.collectionView];
    [self.goodsRightCVC.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
        make.left.mas_equalTo(_goodsLeftTVC.tableView.mas_right);
    }];
    
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


- (XYClassificationGoodsLeftTVC*)goodsLeftTVC
{
    if (_goodsLeftTVC == nil) {
        _goodsLeftTVC = [[XYClassificationGoodsLeftTVC alloc]init];
        _goodsLeftTVC.tableView.frame = CGRectZero;
        
        _goodsLeftTVC.delegate = self;
    }
    return _goodsLeftTVC;
}

- (XYClassificationGoodsRightCVC*)goodsRightCVC
{
    if (_goodsRightCVC == nil) {
        _goodsRightCVC = [[XYClassificationGoodsRightCVC alloc]init];
        _goodsRightCVC.collectionView.frame = CGRectZero;
         [self addChildViewController:_goodsRightCVC];
    }
    return _goodsRightCVC;
}

- (NSMutableArray*)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
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
#pragma mark - web delegate

//- (void)webViewLoadingEnd
//{
//    self.navigationItem.title = @"活动";
//    [XYWebViewJavaScript javaScriptUpdateUserNameWithWebView:self.myWebView];
//
//    [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
//    [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
//
//}
//
//- (void)webViewGoFormActivityVC
//{
//    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
//        [XYCommon setPresentViewControllerWithLoginView];
//        return;
//    }
//    XYPreDepositVC * preDepositVC = [[XYPreDepositVC alloc]init];
//    preDepositVC.isProductList = @"Y";
//    [self.navigationController pushViewController:preDepositVC animated:YES];
//}

#pragma mark - XYClassificationGoodsLeftDelegate

- (void)classificationGoodsLeftSelectdataList:(NSMutableArray *)rightList
{
    if (rightList == nil) {
        self.goodsRightCVC.dataSource = [NSMutableArray array];
        return;
    }
    self.goodsRightCVC.dataSource = rightList;
}


#pragma mark - button click
- (void)rightClick
{
    
}



#pragma mark - data net

- (void)netCategoryListData
{
    WeakSelf;
    [XYClassificationNet netCategoryListBlock:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {

            if (weakSelf.dataList.count != 0) {
                [weakSelf.dataList removeAllObjects];
            }
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"category"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYClassificationModel * newModel = [XYClassificationModel mj_objectWithKeyValues:butesdict];
                
                [weakSelf.dataList addObject:newModel];
            }
            weakSelf.goodsLeftTVC.dataSource = weakSelf.dataList;
        }
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    JXSearchHistoryPage * searchHistoryPage = [[JXSearchHistoryPage alloc]init];
    [self.navigationController pushViewController:searchHistoryPage animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
