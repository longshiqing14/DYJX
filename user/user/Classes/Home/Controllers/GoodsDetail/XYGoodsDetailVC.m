//
//  XYGoodsDetailVC.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsDetailVC.h"

#import "TYTabPagerBar.h"
#import "TYPagerController.h"

/** 子页面 */
#import "XYGoodsDetailWebVC.h"
#import "XYGoodsDetailParameterWebVC.h"
#import "XYGoodsDetailEvaluateWebVC.h"



#import "XYGoodsDetailBottomVC.h" // 商品 详情 底部

#import "XYUMSocialShareView.h" //分享

#import "JXCouponActivityWebPage.h"//优惠券点击跳转到活动页
#import "JXFullReduceGoodsPage.h"//优惠券点击跳转到满减商品列表页
#import "JXShareManager.h"

@interface XYGoodsDetailVC ()<TYTabPagerBarDataSource,TYTabPagerBarDelegate,TYPagerControllerDataSource,TYPagerControllerDelegate,XYGoodsDetailWebVCDelegate>

@property (nonatomic, weak) TYTabPagerBar *tabBar;
@property (nonatomic, weak) TYPagerController *pagerController;


@property (nonatomic, strong) XYGoodsDetailBottomVC * goodsDetailBottomVC;


@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYGoodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"activityCouponViewClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"fullReduceCouponViewClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"homePageCouponViewClick" object:nil];
//    self.title = @"PagerControllerDmeoController";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(turnToCommentList:) name:@"turnToCommentList" object:nil];
    self.view.backgroundColor = XYGlobalBg;
    
    [self addTabPageBar];
    
    [self addPagerController];
    
    [self loadData];
    
    [self setRightImageButtonWith:@"nav_btn_share" target:self action:@selector(rightButtonClick:)];
    
    [self.view addSubview:self.goodsDetailBottomVC.view];
}


- (void)receiveCouponViewClick:(NSNotification*)sender{
    if ([sender.name isEqualToString:@"activityCouponViewClick"]) {
        JXCouponActivityWebPage *couponActivityWebPage = [[JXCouponActivityWebPage alloc]init];
        couponActivityWebPage.webURLstr = sender.object;
        [self.navigationController pushViewController:couponActivityWebPage animated:NO];
    }else if ([sender.name isEqualToString:@"fullReduceCouponViewClick"]){
        
        JXFullReduceGoodsPage *fullReduceGoodsPage = [[JXFullReduceGoodsPage alloc]init];
        fullReduceGoodsPage.activeId = sender.object;
        [self.navigationController pushViewController:fullReduceGoodsPage animated:NO];
        
    }else if ([sender.name isEqualToString:@"homePageCouponViewClick"]){
        [self.navigationController.tabBarController setSelectedIndex:0];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

- (void)turnToCommentList:(NSNotification*)sender{
    [self.pagerController scrollToControllerAtIndex:self.tabBar.countOfItems - 1 animate:YES];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
//    _pagerController.view.frame = CGRectMake(0, 0, XYScreenW, XYScreenH);
//    _tabBar.frame = CGRectZero;

    
    [_pagerController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-49);
    }];
    
    WeakSelf;
    [self.goodsDetailBottomVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(goodsDetail_buttom_height);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
    }];
    
}


- (void)addTabPageBar {
    TYTabPagerBar *tabBar = [[TYTabPagerBar alloc]init];
    tabBar.layout.barStyle = TYPagerBarStyleProgressBounceView;
    
    tabBar.layout.normalTextFont = XYFont_16;
    tabBar.layout.selectedTextFont = XYFont_16;
    
    tabBar.layout.normalTextColor = XYBlackColor;
    tabBar.layout.selectedTextColor = XYBlackColor;
    
    tabBar.layout.progressColor = XYBlackColor;
    
//    tabBar.layout.adjustContentCellsCenter = YES;
    
    tabBar.dataSource = self;
    tabBar.delegate = self;
    
    tabBar.frame = CGRectMake(0, 0, 120, 44);
    
    [tabBar registerClass:[TYTabPagerBarCell class] forCellWithReuseIdentifier:[TYTabPagerBarCell cellIdentifier]];
    self.navigationItem.titleView = tabBar;
    _tabBar = tabBar;
}

- (void)addPagerController {
    TYPagerController *pagerController = [[TYPagerController alloc]init];
    pagerController.layout.prefetchItemCount = 1;
    //pagerController.layout.autoMemoryCache = NO;
    // 只有当scroll滚动动画停止时才加载pagerview，用于优化滚动时性能
    pagerController.layout.addVisibleItemOnlyWhenScrollAnimatedEnd = YES;
    pagerController.dataSource = self;
    pagerController.delegate = self;
    [self addChildViewController:pagerController];
    [self.view addSubview:pagerController.view];
    _pagerController = pagerController;
}



#pragma mark - 懒加载

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


- (void)loadData {

    
    NSArray * array = @[@"商品",@"详情",@"评价"];
    
    [self.dataSource addObjectsFromArray:array];
    
    [self reloadData];
}


#pragma mark -

- (XYGoodsDetailBottomVC*)goodsDetailBottomVC
{
    if (_goodsDetailBottomVC == nil) {
        _goodsDetailBottomVC = [[XYGoodsDetailBottomVC alloc]init];
        _goodsDetailBottomVC.view.frame = CGRectZero;
        
        _goodsDetailBottomVC.productId = self.productId;
        [self addChildViewController:_goodsDetailBottomVC];
    }
    return _goodsDetailBottomVC;
}





#pragma mark - button click

- (void)rightButtonClick:(UIButton*)sender
{
    /*请求参数  type : 0 首页 1 活动页 3 商品详情页
    type = 3 需要传productId*/
    
    //商品详情分享
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"3" forKey:@"type"];
    [param setObject:self.productId forKey:@"productId"];
    [JXShareManager getShareInfoFromSeveiceParam:param Success:^(JXShareModel *model) {
        if (model.shares.count == 0) {
            return ;
        }
        XYUMSocialShareView * shareView = [[XYUMSocialShareView alloc] initWithTitle:nil cancelButtonTitle:nil shareContent:model.shares[0].content shareTitle:model.shares[0].title iconUrl:model.shares[0].iconUrl shareUrl:model.shares[0].shareUrl];
        [shareView show];
    } fail:^{
        
    }];

}


#pragma mark - TYTabPagerBarDataSource

- (NSInteger)numberOfItemsInPagerTabBar {
    return self.dataSource.count;
}

- (UICollectionViewCell<TYTabPagerBarCellProtocol> *)pagerTabBar:(TYTabPagerBar *)pagerTabBar cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell<TYTabPagerBarCellProtocol> *cell = [pagerTabBar dequeueReusableCellWithReuseIdentifier:[TYTabPagerBarCell cellIdentifier] forIndex:index];
    cell.titleLabel.text = self.dataSource[index];
    return cell;
}

#pragma mark - TYTabPagerBarDelegate

- (CGFloat)pagerTabBar:(TYTabPagerBar *)pagerTabBar widthForItemAtIndex:(NSInteger)index {
    NSString *title = self.dataSource[index];
    return [pagerTabBar cellWidthForTitle:title];
}

- (void)pagerTabBar:(TYTabPagerBar *)pagerTabBar didSelectItemAtIndex:(NSInteger)index {
    [_pagerController scrollToControllerAtIndex:index animate:YES];
}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController {
    return 3;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    if (index%3 == 0) {
        XYGoodsDetailWebVC *VC = [[XYGoodsDetailWebVC alloc]init];
//        VC.RollDown = ^{
////            [_pagerController.scrollView setContentOffset:CGPointMake(XYScreenW, 0) animated:YES];
//        };
        VC.goodsDetailDelegate = self;
        VC.productId = self.productId;
        return VC;
    }else if (index%3 == 1) {
        XYGoodsDetailParameterWebVC *VC = [[XYGoodsDetailParameterWebVC alloc]init];
        VC.productId = self.productId;
        return VC;
    }else {
        XYGoodsDetailEvaluateWebVC *VC = [[XYGoodsDetailEvaluateWebVC alloc]init];
        VC.productId = self.productId;
        return VC;
    }
}

#pragma mark - TYPagerControllerDelegate

- (void)pagerController:(TYPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex animated:(BOOL)animated {
    [_tabBar scrollToItemFromIndex:fromIndex toIndex:toIndex animate:animated];
}

-(void)pagerController:(TYPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress {
    [_tabBar scrollToItemFromIndex:fromIndex toIndex:toIndex progress:progress];
}

- (void)reloadData {
    [_tabBar reloadData];
    [_pagerController reloadData];
}

#pragma mark - XYGoodsDetailWebVCDelegate
- (void)goodsDetailPushGoodsDetailParameterWeb
{
    [_pagerController scrollToControllerAtIndex:1 animate:YES];
    
}

- (void)goodsDetailBottomButton
{
    [_goodsDetailBottomVC showSellOutLB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"activityCouponViewClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"fullReduceCouponViewClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"homePageCouponViewClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveCouponViewClick:) name:@"turnToCommentList" object:nil];
    
}
@end
