//
//  XYFindMainVC.m
//  user
//
//  Created by xingyun on 2017/10/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYFindMainVC.h"

#import "TYTabPagerBar.h"
#import "TYPagerController.h"
#import "XYFindVC.h"
#import "XYFindBestVC.h"
#import "XYFindVideoVC.h"
@interface XYFindMainVC ()<TYTabPagerBarDataSource,TYTabPagerBarDelegate,TYPagerControllerDataSource,TYPagerControllerDelegate>

@property(nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic, weak) TYTabPagerBar *tabBar;
@property (nonatomic, weak) TYPagerController *pagerController;

@property(strong,nonatomic) XYFindVC *findVC ;//拍拍
@property(strong,nonatomic) XYFindBestVC *findBestVC ;//精选
@property(strong,nonatomic) XYFindVideoVC *findVideoVC ;//视频
@end

static CGFloat const navH = 44;

//static CGFloat const topToNavSecond = 60;

@implementation XYFindMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"小朋发现";
    self.view.backgroundColor = XYGlobalBg;

    [self addTabPageBar];
    [self addPagerController];
    [self reloadData];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //    _pagerController.view.frame = CGRectMake(0, 0, XYScreenW, XYScreenH);
    //    _tabBar.frame = CGRectZero;
    
    
    [_pagerController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-50);
        make.top.mas_equalTo(navH);
    }];


}

- (void)addTabPageBar {
    TYTabPagerBar *tabBar = [[TYTabPagerBar alloc]init];
    tabBar.layout.barStyle = TYPagerBarStyleProgressBounceView;
    
    tabBar.layout.normalTextFont = XYFont_14;
    tabBar.layout.selectedTextFont = XYFont_14;
    
    tabBar.layout.normalTextColor = XYBlackColor;
    tabBar.layout.selectedTextColor = XYMainColor;
    
    tabBar.layout.progressColor = XYMainColor;
    tabBar.layout.progressWidth = XYScreenW/3;
    //    tabBar.layout.adjustContentCellsCenter = YES;
    
    tabBar.dataSource = self;
    tabBar.delegate = self;
    
    
    tabBar.layout.cellEdging = 0;
    tabBar.layout.cellSpacing = 0;
    
    tabBar.frame = CGRectMake(0, 0, XYScreenW, navH);
    tabBar.backgroundColor = XYWhiteColor;
    [tabBar registerClass:[TYTabPagerBarCell class] forCellWithReuseIdentifier:[TYTabPagerBarCell cellIdentifier]];
    
    [self.view addSubview:tabBar];
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

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:@"精选"];
        [_dataSource addObject:@"视频"];
        [_dataSource addObject:@"拍拍"];
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(XYFindVC *)findVC
{
    if (!_findVC) {
        _findVC = [[XYFindVC alloc] init];
        [self addChildViewController:_findVC];
    }
    return _findVC;
}

-(XYFindBestVC *)findBestVC
{
    if (!_findBestVC) {
        _findBestVC = [[XYFindBestVC alloc] init];
        [self addChildViewController:_findBestVC];
    }
    return _findBestVC;

}

-(XYFindVideoVC *)findVideoVC
{
    if (!_findVideoVC) {
        _findVideoVC = [[XYFindVideoVC alloc] init];
        [self addChildViewController:_findVideoVC];
    }
    return _findVideoVC;

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
//    NSString *title = self.dataSource[index];
    return XYScreenW/3;
}

- (void)pagerTabBar:(TYTabPagerBar *)pagerTabBar didSelectItemAtIndex:(NSInteger)index {
    [_pagerController scrollToControllerAtIndex:index animate:YES];
}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController {
    return self.dataSource.count;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    if (index%3 == 0) {

        return self.findBestVC;
    }else if (index%3 == 1) {

        return self.findVideoVC;
    }else {

        return self.findVC;
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



@end
