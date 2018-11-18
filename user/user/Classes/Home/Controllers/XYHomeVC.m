//
//  XYHomeVC.m
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//  

#import "XYHomeVC.h"
#import "XYLocationModel.h"
#import "XYHomeTVCell.h"           // 列表cell
#import "XYHomeTVCHeaderView.h"    // 列表头
#import "XYHomeHotGoodsModel.h"  // 推销商品 model

#import "SDCycleScrollView.h"  //轮播
#import "XYCycleImageModel.h"  // 轮播 model

#import "XYHomeAllNet.h"    //请求
#import "XYCycleScrollViewNet.h"  //banner 请求
#import "XYLoginAndRegisterNet.h"  // 个人信息 更新

#import "XYShoppingCartNet.h"  // 购物车 数量 请求

#import "XYSystemLocation.h" //定位

#import "XYBestWebVC.h"  // web
//#import "XYGoodsDetailWebVC.h"  //
#import "XYGoodsDetailVC.h"

#import "XYQRCodePushCommon.h"  //  扫描二维码

#import "XYHomePopAdsView.h" //广告弹出框

#import "XYPickView.h"  //选择框
#import "XYPickCityModel.h"

#import "XYClassificationVC.h"

#import "XYNotificationCenterWebVC.h" //信息中心

#import "UIColor+Extension.h"//

#import "XYNoticePush.h"   //
#import "XYNoticePushModel.h"



@interface XYHomeVC () <UITableViewDelegate, UITableViewDataSource,XYSystemLocationDelegate,SDCycleScrollViewDelegate,XYHomeTVCellDelegate,XYPickViewDelegate>

/** 地址选择 按钮  */
@property (nonatomic, strong) UIButton * navAddressBT;

/** 导航 左 按钮  */
@property (nonatomic, strong) UIButton * navLeftBT;

/** 导航 右 按钮  */
@property (nonatomic, strong) UIButton * navRightBT;

/** 列表  */
@property (nonatomic, strong) UITableView * tableView;

/** 列表  */
@property (nonatomic, strong) UIView * headerView;

/** 轮播 */
@property (nonatomic, strong) SDCycleScrollView * cycleScrollView;

/** 定位  */
@property (nonatomic, strong) XYSystemLocation * systemLocation;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * BannersDataSource;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * dataSource;

/** 气泡数据 */
@property (nonatomic, strong) XYCycleImageModel * popModel;

/** 城市 数据 */
@property (nonatomic, strong) NSMutableArray * cityArray;

/** 暂存的  通知数据 */
@property (nonatomic, strong) XYNoticePushModel * notiPushModel;

/** 暂存的 定位的城市 */
@property (nonatomic, copy) NSString * locationCityString;

/** 数据请求 次数限制 */
@property (nonatomic, assign) BOOL isFirstLocationNet;

/** 导航中间按钮是否可以点击 */
@property (nonatomic, assign) BOOL isNavAddressButton;

/** 显示 气泡  只显示一次 */
@property (nonatomic, assign) BOOL isShowPop;

/** 导航按钮点击次 次数限制 */
@property (nonatomic, assign) BOOL isNavButtonNet;

/** 信息上的红点 */
@property(strong,nonatomic) UIView *redPointView ;

@end
static CGFloat const redPointWidth = 8.f;
@implementation XYHomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.title = @"";
    self.view.backgroundColor = XYGlobalBg;
    
    //进入时 导航不能点击
    self.isNavAddressButton = YES;
//    [self setLeftImageButtonWith:@"nav_btn_ewm" target:self action:@selector(leftClick:)];
//    [self setRightImageButtonWith:@"nav_btn_imessage" target:self action:@selector(rightClick:)];
    [self addNavLeftButton];
    [self addNavRightRedPoint];
    
    [self addNavBotton];
    
    [self addViewAndLayout];
    

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticePushData:) name:XY_notification_notice object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XY_notification_notice object:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundColor:XYRGBAColor(255, 255, 255, 0.1)];
    
    //该页面呈现时手动调用计算导航栏此时应当显示的颜色
//    WeakSelf;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [weakSelf scrollViewDidScroll:weakSelf.tableView];
//    });
    
   
    if ([XYUserDefaults readAppDlegateOfUser_cityOfMerchantId] == nil) {
        
        self.isNavButtonNet = NO;
        [self.navAddressBT setTitle:@"请选择城市" forState:UIControlStateNormal];
        
        
        [self beginLocation];
        
//        [self netGetSessionIdData];
    }else{
        NSLog(@"---");
    }
    
    if ([XYUserDefaults readUserDefaultsRegistered].count != 0) {
        [self netMsgUnread];
    }else{
        self.redPointView.hidden = YES;
    }
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    WeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf scrollViewDidScroll:weakSelf.tableView];
    });
    
    if (self.notiPushModel != nil) {
        [XYNoticePush noticePushWithNoticeModel:self.notiPushModel PushNavi:self];
        self.notiPushModel = nil;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    UIColor * navColor = XYNavMainColor;
    [self.navigationController.navigationBar setBackgroundImage:[navColor imageWithColor] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundColor:navColor];
}


#pragma mark - add button
-(void)addNavRightRedPoint{

    
    self.redPointView.frame = CGRectMake(44/2.0+21/2.0-redPointWidth/2+5,44/2.0-33/2.0+redPointWidth/2 , redPointWidth, redPointWidth);
    [self.navRightBT addSubview:self.redPointView];
  
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:self.navRightBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItem = rightBar;
    
}

-(void)addNavLeftButton{
    
    UIBarButtonItem * leftBar = [[UIBarButtonItem alloc]initWithCustomView:self.navLeftBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -20;
    self.navigationItem.leftBarButtonItem = leftBar;
    
}

#pragma mark - add view

- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    
    WeakSelf;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_topLayoutGuideTop);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
    }];
    
}
/** 气泡 */
-(void)addPopAds{
    
    if (self.isShowPop) {
        return;
    }else{
        self.isShowPop = YES;
    }
    
    if (self.popModel == nil || [self.popModel.imgUrl isEqualToString:@""]) {
        return;
    }
    
    if (![[XYCommon getCurrentVC] isKindOfClass:[self class]]) {
        return;
    }
    
    XYHomePopAdsView *popAdsView = [[XYHomePopAdsView alloc] initWithModel:self.popModel];
    [popAdsView show];

    WeakSelf;
    popAdsView.popBackBlcok = ^(BOOL clickImg , NSString * url) {
        if (clickImg) {
            if (url == nil || [url isEqualToString:@""]) {
                return;
            }
            
            XYBestWebVC * webVC = [[XYBestWebVC alloc]init];
            webVC.webURLstr = url;
            [weakSelf.navigationController pushViewController:webVC animated:YES];
        }
    };
}
/** 导航中间 城市选择按钮 */
- (void)addNavBotton
{
    self.navigationItem.titleView = self.navAddressBT;

    [self btnImgRightTitleLeft:self.navAddressBT];
}

#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = header;
    
}

- (void)loadNewData
{
    if ([XYUserDefaults readAppDlegateOfUser_cityOfMerchantId] == nil) {
        [self endHeaderWithFootRefresh:YES];
        return;
    }
    [self netHomeBannerList];
}

- (void)endHeaderWithFootRefresh:(BOOL)refresh
{
    if (refresh) {
        [self.tableView.mj_header endRefreshing];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
}

#pragma  mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, XYScreenH) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate =self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        
        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 180)];
        
        [_headerView addSubview:self.cycleScrollView];
    }
    return _headerView;
}

- (SDCycleScrollView*)cycleScrollView
{
    if (_cycleScrollView == nil) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, XYScreenW, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _cycleScrollView.backgroundColor = XYWhiteColor;
        _cycleScrollView.autoScrollTimeInterval = 3;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = XYWhiteColor; // 自定义分页控件小圆标颜色
        
    }
    return _cycleScrollView;
}


- (XYSystemLocation*)systemLocation
{
    if (_systemLocation == nil) {
        _systemLocation = [[XYSystemLocation alloc]init];
        _systemLocation.delegate = self;
    }
    return _systemLocation;
}

- (UIButton*)navAddressBT
{
    if (_navAddressBT == nil) {
        _navAddressBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _navAddressBT.frame = CGRectMake(0, 7, 180, 30);
        _navAddressBT.layer.masksToBounds = YES;
        _navAddressBT.layer.cornerRadius = 30/2;
        
        _navAddressBT.backgroundColor = XYBlackColor;
        _navAddressBT.alpha = 0.3;
        
        [_navAddressBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_navAddressBT setTitle:@"请选择城市" forState:UIControlStateNormal];
        [_navAddressBT setImage:[UIImage imageNamed:@"nav_address_up_white"] forState:UIControlStateNormal];
        [_navAddressBT.titleLabel setFont:XYFont_16];
        [_navAddressBT addTarget:self action:@selector(navAddressButton:) forControlEvents:UIControlEventTouchUpInside];
        [self btnImgRightTitleLeft:_navAddressBT];
    }
    return _navAddressBT;
}

- (UIButton*)navLeftBT
{
    if (_navLeftBT == nil) {
        _navLeftBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _navLeftBT.frame = CGRectMake(0, 0, 40, 40);
        _navLeftBT.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        [_navLeftBT setImage:[UIImage imageNamed:@"nav_btn_gray_ewm"] forState:UIControlStateNormal];
        [_navLeftBT addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navLeftBT;
}

- (UIButton*)navRightBT
{
    if (_navRightBT == nil) {
        _navRightBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _navRightBT.frame = CGRectMake(0, 0, 40, 40);
        _navRightBT.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);

        [_navRightBT setImage:[UIImage imageNamed:@"nav_btn_gray_imessage"] forState:UIControlStateNormal];
        
        [_navRightBT addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navRightBT;
}

- (NSMutableArray*)BannersDataSource
{
    if (_BannersDataSource == nil) {
        _BannersDataSource = [NSMutableArray array];
    }
    return _BannersDataSource;
}


- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray*)cityArray
{
    if (_cityArray == nil) {
        _cityArray = [NSMutableArray array];
    }
    return _cityArray;
}

-(UIView *)redPointView
{
    if (!_redPointView) {
        _redPointView = [[UIView alloc] init];
        _redPointView.layer.cornerRadius = redPointWidth/2;
        _redPointView.layer.masksToBounds = YES;
        _redPointView.backgroundColor = [UIColor redColor];
    }
    return _redPointView;

}
/** 按钮图片居右，文字居左 **/
-(void)btnImgRightTitleLeft:(UIButton *)button{

    CGFloat spacing = 2.5;

    // 文字左移
    CGSize titleSize = button.titleLabel.frame.size;
    button.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width, 0.0, - titleSize.width  - spacing);
    
    // 图片右移
    CGSize imageSize = button.imageView.frame.size;
    button.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width  - spacing, 0.0, imageSize.width);
    
}

#pragma - mark - Location
/** 开始定位 */
- (void)beginLocation
{
    self.isFirstLocationNet = YES;
    [self.systemLocation beginUpdatingLocation];
    
}

#pragma mark - XYSystemLocationDelegate

/** 定位的 地址 */
- (void)locationDidEndUpdatingCoordinate:(CLLocationCoordinate2D)coordinate
{
//    if (self.isFirstLocationNet) {
//        self.isFirstLocationNet = NO;
//    }else{
//        return;
//    }
//    NSString * lat = [NSString stringWithFormat:@"%g",coordinate.latitude];
//    NSString * lng = [NSString stringWithFormat:@"%g",coordinate.longitude];
//
//    [XYHomeAllNet netCommuityListWithLat:lat lng:lng block:^(NSDictionary *blockDictionary, NSError *error) {
//
//        if (error == nil) {
//            XYLog(@" Commuity List %@",blockDictionary);
//        }
//    }];
    
}
/** 定位的城市 */
- (void)locationDidEndUpdatingCity:(XYLocationModel *)locationModel
{
    //字条串是否包含有某字符串
    if ([locationModel.city rangeOfString:@"市"].location == NSNotFound) {
        NSLog(@"string 不存在 martin");
    } else {
        
        locationModel.city=[locationModel.city stringByReplacingOccurrencesOfString:@"市"withString:@""];
        NSLog(@"string 包含 martin");
    }
    NSLog(@"%@",locationModel.city);
    self.locationCityString = locationModel.city;
    
//    self.locationCityString = locationModel.city;
    [self netGetSessionIdData];
}
/** 定位失败 */
- (void)locationDidEndUpdatingError
{
    [self netGetSessionIdData];
}

#pragma mark - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if ([[XYCommon getCurrentVC] isKindOfClass:[XYHomeVC class]]) {
//        XYLog(@"  y    %f ",scrollView.contentOffset.y);
        float alpha = 1 - ((60 - scrollView.contentOffset.y) / 60);
        UIColor * navColor = XYRGBAColor(255, 255, 255, alpha);
        [self.navigationController.navigationBar setBackgroundImage:[navColor imageWithColor] forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setBackgroundColor:navColor];
        
        if (alpha >= 1) {
            [self.navLeftBT setImage:[UIImage imageNamed:@"nav_btn_ewm"] forState:UIControlStateNormal];
            [self.navRightBT setImage:[UIImage imageNamed:@"nav_btn_imessage"] forState:UIControlStateNormal];
            self.navAddressBT.backgroundColor = [UIColor clearColor];
            [self.navAddressBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            self.navAddressBT.alpha = 1.0;
            if (self.isNavAddressButton) {
                [self.navAddressBT setImage:[UIImage imageNamed:@"nav_address_ok_black"] forState:UIControlStateNormal];
            }else{
                [self.navAddressBT setImage:[UIImage imageNamed:@"nav_address_up_white"] forState:UIControlStateNormal];
            }
            
        }else{
            [self.navLeftBT setImage:[UIImage imageNamed:@"nav_btn_gray_ewm"] forState:UIControlStateNormal];
            [self.navRightBT setImage:[UIImage imageNamed:@"nav_btn_gray_imessage"] forState:UIControlStateNormal];
            self.navAddressBT.backgroundColor = XYBlackColor;
            [self.navAddressBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.navAddressBT.alpha = 0.4;
            if (self.isNavAddressButton) {
                [self.navAddressBT setImage:[UIImage imageNamed:@"nav_address_ok_white"] forState:UIControlStateNormal];
            }else{
                [self.navAddressBT setImage:[UIImage imageNamed:@"nav_address_up_white"] forState:UIControlStateNormal];
            }
        }
    }
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 49;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYHomeTVCell * cell = [XYHomeTVCell cellWithTableView:tableView];
    cell.delegate = self;
    if (self.dataSource.count > indexPath.section ) {
        XYHomeHotGoodsModel * model = self.dataSource[indexPath.section];

        cell.dataSource = model.products;
    }
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XYHomeTVCHeaderView * headerView = [XYHomeTVCHeaderView headerWithTableView:tableView];
    
    if (self.dataSource.count > section) {
        XYHomeHotGoodsModel * model = self.dataSource[section];
        
        headerView.headerModel = model;
        
        [headerView updataTitleColorAndImageNum:section];

    }
    return headerView;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (index < self.BannersDataSource.count) {
        XYCycleImageModel * model = self.BannersDataSource[index];

        if (model.url == nil || [model.url isEqualToString:@""]) {
            return;
        }else if ([model.url rangeOfString:@"#"].location !=NSNotFound){
            NSString *str=[model.url stringByReplacingOccurrencesOfString:@"#"withString:@""];
            str=[str stringByReplacingOccurrencesOfString:@"product_details&productId="withString:@""];
            [self pushcontroller:str];
        }else{
            XYBestWebVC * webVC = [[XYBestWebVC alloc]init];
            webVC.webURLstr = model.url;
            
//            webVC.webURLstr = [NSString stringWithFormat:@"%@?merchantId=%@",model.url,[XYUserDefaults readAppDlegateOfUser_cityOfMerchantId]];
//            NSLog(@"%@",[NSString stringWithFormat:@"%@?merchantId=%@",model.url,[XYUserDefaults readAppDlegateOfUser_cityOfMerchantId]]);
            
            [self.navigationController pushViewController:webVC animated:YES];
        }//#product_details&productId=p_50019#
        
        
    }
}

#pragma mark - XYHomeTVCellDelegate
/**  */
- (void)homeTVCellpushGoodsDetailWithProductId:(NSString *)productId
{
    [self pushcontroller:productId];
    
}

-(void)pushcontroller:(NSString *)productId{
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId = productId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - XYPickViewDelegate


-(void)closePickView{
    NSLog(@"%@",_navAddressBT.titleLabel.text);
    [self settitle];
}

-(void)settitle{
    if ([XYUserDefaults readAppDlegateOfUser_cityOfMerchantId] == nil) {
        if (self.cityArray.count>0) {
            XYPickCityModel * newModel=self.cityArray[0];
            [_navAddressBT setTitle:newModel.cityName forState:UIControlStateNormal];
            [self btnImgRightTitleLeft:_navAddressBT];
            [self netSelectSelectCommuity:newModel.cityId theMerchantId:newModel.theMerchantId];
        }
    }else{
        NSLog(@"--");
    }
}

-(void)toobarDonBtnHaveClick:(XYPickView *)pickView resultString:(NSString *)resultString resultIDString:(NSString *)resultIDString
{
    XYLog(@"  resultString  %@",resultString);
    
//    [self.navAddressBT setTitle:resultString forState:UIControlStateNormal];
//    [self netSelectSelectCommuity:resultIDString];
    for (XYPickCityModel * newModel in self.cityArray) {
        if ([newModel.cityName isEqualToString:resultString]) {
            
            [_navAddressBT setTitle:resultString forState:UIControlStateNormal];
            [self btnImgRightTitleLeft:_navAddressBT];
            [self netSelectSelectCommuity:newModel.cityId theMerchantId:newModel.theMerchantId];
        }
    }
}

#pragma mark - 

- (void)noticePushData:(NSNotification*)noti
{
    if (![[noti object] isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    NSDictionary * dict = [noti object];
    
    NSDictionary * butesdict = [XYCommon removeNull:dict];
    self.notiPushModel = [XYNoticePushModel mj_objectWithKeyValues:butesdict];
}


#pragma mark - button click

/** 导航左按钮 扫描二维码 */
- (void)leftClick:(UIButton*)sender
{
    [XYQRCodePushCommon pushToQRCodeTarget:self];
}


/** 导航右按钮 信息 */
- (void)rightClick:(UIButton*)sender
{

    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    XYNotificationCenterWebVC *noteWebVC = [[XYNotificationCenterWebVC alloc] init];
    
    [self.navigationController pushViewController:noteWebVC animated:YES];
    
}

- (void)navAddressButton:(UIButton*)sender
{
    if (self.isNavButtonNet) {
        
    }else{
//        XYSelectCommuityModel * model = [XYUserDefaults readAppDlegateOfUser_city];
//        if (model.merchantId == nil) {
//
//            self.isNavButtonNet = YES;
//            [self netCommuityListData];
//
//        }else{
        
            if (self.isNavAddressButton) {
                
            }else{
                self.isNavButtonNet = YES;
                [self netCommuityListData];
            }
            

//        }
    }
}

#pragma mark - data

/** 获取 首页 banners  和 列表 */
- (void)netHomeBannerList
{
//    if (![self.tableView.mj_header isRefreshing]) {
//        [self.tableView.mj_header beginRefreshing];
//    }
    
    WeakSelf;
    [XYCycleScrollViewNet netHomeBannerListblock:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf endHeaderWithFootRefresh:YES];
        if (error == nil) {

            
            if ([[blockDictionary objectForKey:@"adImageUrl"] isKindOfClass:[NSDictionary class]])  {
                weakSelf.popModel = [XYCycleImageModel mj_objectWithKeyValues:[blockDictionary objectForKey:@"adImageUrl"]];
            }
            
            
            if (weakSelf.BannersDataSource.count != 0) {
                [weakSelf.BannersDataSource removeAllObjects];
            }
            NSMutableArray * bannerImageArray = [NSMutableArray array];
            NSArray * bannersFromResponse = [blockDictionary objectForKey:@"banners"];
            for (NSDictionary * attributes in bannersFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYCycleImageModel * newModel = [XYCycleImageModel mj_objectWithKeyValues:butesdict];
                [bannerImageArray addObject:newModel.imgUrl];
                
                [weakSelf.BannersDataSource addObject:newModel];
            }
            weakSelf.cycleScrollView.imageURLStringsGroup = bannerImageArray;
            
            
            if (weakSelf.dataSource.count != 0) {
                [weakSelf.dataSource removeAllObjects];
            }
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"categories"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYHomeHotGoodsModel * newModel = [XYHomeHotGoodsModel mj_objectWithKeyValues:butesdict];
                
                [weakSelf.dataSource addObject:newModel];
            }
            [weakSelf.tableView reloadData];
            
            [weakSelf addPopAds];
            
        }
        
    }];
}

#pragma mark - data
/** 消息 红点 */
-(void)netMsgUnread{
    [XYHomeAllNet netMessageUnreadBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            NSString *msgNum = [blockDictionary objectForKey:@"totalCount"];
            if ([msgNum integerValue] <= 0) {
                self.redPointView.hidden = YES;
            }else
            {
                self.redPointView.hidden = NO;
            }
        }
    }];
}

/** 选择的 城市列表 */
- (void)netCommuityListData
{
    if (self.cityArray.count != 0) {
        XYPickView *pick = [[XYPickView sharedInstance] initPickviewWithArray:self.cityArray key:@"cityName" idkey:@"cityId" andSelectString:self.navAddressBT.titleLabel.text];
        pick.delegate = self;
        [pick show];
        self.isNavButtonNet = NO;
        return;
    }
    
    WeakSelf;
    [XYHomeAllNet netCommuityListWithLat:@"" lng:@"" block:^(NSDictionary *blockDictionary, NSError *error) {
        
        weakSelf.isNavButtonNet = NO;
        if (error == nil) {
            
            if (weakSelf.cityArray.count != 0) {
                [weakSelf.cityArray removeAllObjects];
            }
            
            BOOL isSelectCity = NO;
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"communityList"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYPickCityModel * newModel = [XYPickCityModel mj_objectWithKeyValues:butesdict];
                NSLog(@"%@",newModel.cityName);
                NSLog(@"%@",_locationCityString);
                if ([weakSelf.locationCityString isEqualToString:newModel.cityName]) {
                    
                    [_navAddressBT setTitle:newModel.cityName forState:UIControlStateNormal];
                    
                    [weakSelf btnImgRightTitleLeft:_navAddressBT];
                    [weakSelf netSelectSelectCommuity:newModel.cityId theMerchantId:newModel.theMerchantId];
                    
                    isSelectCity = YES;
                }
                
                [weakSelf.cityArray addObject:newModel];
            }
            [self settitle];
            if (isSelectCity) {

            }else{
                if (weakSelf.cityArray.count != 0) {
                    XYPickView *pick = [[XYPickView sharedInstance] initPickviewWithArray:weakSelf.cityArray key:@"cityName" idkey:@"cityId" andSelectString:weakSelf.navAddressBT.titleLabel.text];
                    pick.delegate = weakSelf;
                    [pick show];
                }
            }
 

        }
    }];
}

/** 上传 选择的城市  */
- (void)netSelectSelectCommuity:(NSString*)cityid theMerchantId:(NSString*)theMerchantId
{
    WeakSelf;
    [XYHomeAllNet netSelectCommuityWithCityId:cityid theMerchantId:theMerchantId block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            
            XYSelectCommuityModel * newModel = [XYSelectCommuityModel mj_objectWithKeyValues:blockDictionary];
            
            if (![newModel.merchantId isEqualToString:@""]) {
                [weakSelf.navAddressBT setTitle:newModel.cityName forState:UIControlStateNormal];
                [weakSelf.navAddressBT layoutIfNeeded];
                [weakSelf btnImgRightTitleLeft:weakSelf.navAddressBT];
                
                if ([newModel.fixed isEqualToString:@"0"]) {
                    weakSelf.isNavAddressButton = NO;
                }else{
                    weakSelf.isNavAddressButton = YES;
                }
                
                //选择的城市写入本地
                [XYUserDefaults writeAppDlegateOfOrderMerchantId:[XYCommon removeNull:blockDictionary]];
                
                //更新 购物车数量
                [weakSelf netCartCountWithTheMerchantId:[XYUserDefaults readAppDlegateOfUser_cityOfMerchantId]];
                
//                [weakSelf netHomeBannerList];
                [weakSelf.tableView.mj_header beginRefreshing];
            }else{
                [weakSelf netCommuityListData];
            }
            
        }else{
            if ([error.domain isEqualToString:@"E0M00013"]) {
                [weakSelf netCommuityListData];
            }
        }
        
    }];
}
/** 购物车数量 */
- (void)netCartCountWithTheMerchantId:(NSString*)theMerchantId
{
    [XYShoppingCartNet netCartCountWithCartType:@"common" theMerchantId:theMerchantId];
}


/** 获取  SessionId  */
- (void)netGetSessionIdData
{
    
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (sessionId != nil) {
        [self netSelectSelectCommuity:@"" theMerchantId:@""];
        return;
    }
    
    WeakSelf;
    [XYLoginAndRegisterNet netGetSessionIdWithForce:nil  WithBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
            [weakSelf netSelectSelectCommuity:@"" theMerchantId:@""];
        }else{
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0/*延迟执行时间*/ * NSEC_PER_SEC));
            
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [weakSelf netGetSessionIdData];
            });
        }
    }];
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
