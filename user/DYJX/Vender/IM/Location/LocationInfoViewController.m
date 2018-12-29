//
//  LocationInfoViewController.m
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "LocationInfoViewController.h"

#import <QMapKit/QMapKit.h>
#import <QMapSearchKit/QMapSearchKit.h>
#import "SearchResultsController.h"
#import "NIMKitTitleView.h"
#import "DYLocationTableViewCell.h"
#import "myAnnotation.h"
#import "MyAnnotationView.h"


#define SCREEN_WIDTH (self.view.bounds.size.width)
#define SCR_H (self.view.bounds.size.height)

#define SearchBarH 30
#define MapViewH 240

#define StatusBar_HEIGHT 20
#define NavigationBar_HEIGHT 44

@interface LocationInfoViewController ()<UITableViewDelegate,UITableViewDataSource,QMapViewDelegate,UISearchResultsUpdating,UISearchControllerDelegate,QMSSearchDelegate>
@property (nonatomic,strong)UISearchController *searchController;
@property (nonatomic,strong)SearchResultsController *searchResultsController;
@property (nonatomic,strong)QMapView *mapView;
@property (nonatomic,strong)UITableView *topTableView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray <QMSPoiData*>* dataList;
@property (nonatomic,strong)QMSSearcher *searcher;
@property (nonatomic,strong)UIImageView *imageViewAnntation;
@property (nonatomic,strong)NSObject *object;
@property (nonatomic,assign)NSInteger pageIndex;
@property (nonatomic,strong)NSNumber *secondPageIndex;
@property (nonatomic,assign)BOOL isNeedLocation;
@property (nonatomic,assign)NSInteger isSearchPage; //1:YES  2:NO
@property (nonatomic,strong)QMSReGeoCodeAdInfo *currentAddressInfo;
@end

@implementation LocationInfoViewController

- (SearchResultsController *)searchResultsController {
    if (_searchResultsController == nil) {
        _searchResultsController = [[SearchResultsController alloc]init];
    }
    return _searchResultsController;
}

- (UISearchController *)searchController {
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchResultsController];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = YES;
        _searchController.delegate = self;
        [_searchController.searchBar sizeToFit];
        _searchController.searchBar.placeholder = @"搜索地点";
    }
    return _searchController;
}

- (NSMutableArray<QMSPoiData *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setNavigationBar];
    [self setTopTableView];
    [self setMapView];
    [self setMainTableView];
    _isSubmit = NO;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData:) name:SearchResultsControllerDidSelectRow object:nil];

    __weak typeof (self) weakSelf = self;
    self.searchResultsController.searchResultsPage = ^(NSInteger page) {
        weakSelf.secondPageIndex = @(page);
        weakSelf.isSearchPage = 1;
        QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
        poiSearchOption.keyword = weakSelf.searchController.searchBar.text;
        NSString *boundary = [NSString stringWithFormat:@"%@%@%@",@"region(",weakSelf.currentAddressInfo.province,@",1)"];
        poiSearchOption.boundary = boundary;   //@"region(北京,1)"
        poiSearchOption.page_size = 20;
        poiSearchOption.page_index = weakSelf.secondPageIndex == nil ? 1 : [weakSelf.secondPageIndex integerValue];
        [weakSelf.searcher searchWithPoiSearchOption:poiSearchOption];
    };

    [self baseUI];
    [self setUpTitleView];
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(dismiss:)];
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(onSend:)];

    self.navigationItem.leftBarButtonItem=item;
    if (self.isSubmit) {
        self.navigationItem.rightBarButtonItem=rightitem;
    }
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];
}

- (void)onSend:(id)sender{
    //    if ([self.delegate respondsToSelector:@selector(onSendLocation:)]) {
    //        [self.delegate onSendLocation:self.locationPoint];
    //    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismiss:(id)sender
{
    if (self.navigationController.presentingViewController) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }

}

- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;

        titleView.titleLabel.text = @"GPS定位";
    }

    [titleView sizeToFit];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.isNeedLocation = YES;
    self.object = [[NSObject alloc] init];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.isNeedLocation = NO;
    self.object = nil;
    [self.dataList removeAllObjects];
    [self.mapView.delegate mapViewDidStopLocatingUser:self.mapView];
}

- (void)setNavigationBar
{
    self.navigationController.navigationBar.translucent = YES;
    self.pageIndex = 1;
    //    UIBarButtonItem *submitItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBarButtonItem)];
    if (self.isSubmit) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBarButtonItem)];
    }
}

- (void)clickRightBarButtonItem
{
    //发送位置时截图
    //    [self.mapView takeSnapshotInRect:self.mapView.bounds withCompletionBlock:^(UIImage *resultImage, CGRect rect) {
    //resultImage是截取好的图片
    //同时发送当前位置数据
    //self.mapView.centerCoordinate.latitude,self.mapView.centerCoordinate.longitude
    self.centerPoint.coordinate = self.mapView.centerCoordinate;
    if (_delegate && [_delegate respondsToSelector:@selector(onSendLocation:)]) {
        [_delegate onSendLocation:self.centerPoint];
    }
    //    }];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)setTopTableView
{
    //topTableView(专门放置搜索框)
    self.topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110) style:UITableViewStylePlain];
    self.topTableView.tableFooterView = [[UIView alloc] init];
    self.topTableView.scrollEnabled = NO;
    self.topTableView.tableHeaderView = self.searchController.searchBar;
    [self.view addSubview:self.topTableView];

    //QMSSearcher
    self.searcher = [[QMSSearcher alloc] init];
    [self.searcher setDelegate:self];
}

- (void)setMapView
{
    //mapView
    if (self.isSubmit) {
        self.mapView = [[QMapView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, MapViewH)];
    }
    else {
        self.mapView = [[QMapView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, kScreenHeight - 64 - 60)];
    }
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    [self.mapView setShowsUserLocation:YES];
    self.mapView.showsScale = YES;
    self.mapView.zoomLevel = 15;
    self.mapView.forceUpdatingHeading = YES;
    [self.mapView setUserTrackingMode:QUserTrackingModeFollowWithHeading animated:YES];
    _mapView.distanceFilter = kCLLocationAccuracyNearestTenMeters;
    UIButton *buttonReset = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, self.mapView.frame.size.height - 50, 30, 30)];
    buttonReset.backgroundColor = [UIColor clearColor];
    [buttonReset setBackgroundImage:[UIImage imageNamed:@"dyjx_map_user_locate"] forState:UIControlStateNormal];
    //    [buttonReset setTitle:@"复位" forState:UIControlStateNormal];
    buttonReset.titleLabel.font = [UIFont systemFontOfSize:14];
    //    if (self.isSubmit) {
    [buttonReset addTarget:self action:@selector(clickResetButton) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:buttonReset];
    //    }
}

- (void)setMainTableView
{
    if (self.isSubmit) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mapView.frame), self.view.bounds.size.width, self.view.bounds.size.height - MapViewH - NavigationBar_HEIGHT - StatusBar_HEIGHT) style:UITableViewStylePlain];
    }
    else {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mapView.frame), self.view.bounds.size.width, 60) style:UITableViewStylePlain];
    }
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    if (self.isSubmit) {
        self.centerPoint.coordinate =  self.dataList.firstObject.location;
    }
    [self.view addSubview:self.tableView];

    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadPastData)];
    self.tableView.mj_footer = footer;
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在刷新数据" forState:MJRefreshStateRefreshing];
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    footer.stateLabel.textColor = [UIColor blackColor];
    [self.tableView.mj_header beginRefreshing];



    myAnnotation *annotation = [[myAnnotation alloc] initWithAnnotationModelWithDict:@{@"latitute":@(self.centerPoint.coordinate.latitude),@"longitude":@(self.centerPoint.coordinate.longitude)}];
    [self.mapView addAnnotation:annotation];

    // 设置中心
    CLLocationCoordinate2D center = self.centerPoint.coordinate;
    [self.mapView setCenterCoordinate:center animated:YES];

//    QAnnotationView *annotationView = [[QAnnotationView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
//
//    annotationView.center = CGPointMake(self.mapView.center.x, self.mapView.center.y - 64);
//    annotationView.image = [UIImage imageNamed:@"greenPin_lift"];
//    [self.mapView addAnnotation:annotation];
//
//    self.imageViewAnntation = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
//    if (self.isSubmit) {
//        self.imageViewAnntation.center = self.mapView.center;
//        [self.view addSubview:self.imageViewAnntation];
//    }
//    else {
//        CLLocationCoordinate2D center = self.centerPoint.coordinate;
//        self.imageViewAnntation.center = [self.mapView convertCoordinate:center toPointToView:self.mapView];
//        [self.mapView setCenterCoordinate:center animated:YES];
//        self.imageViewAnntation.center = CGPointMake(self.mapView.center.x, self.mapView.center.y - 64);
//        [self.mapView addAnnotation:<#(id<QAnnotation>)#>]
//        [self.mapView addSubview:self.imageViewAnntation];
//    }
//
//    self.imageViewAnntation.image = [UIImage imageNamed:@"greenPin_lift"];
//    self.imageViewAnntation.backgroundColor = [UIColor clearColor];


}

//复位
- (void)clickResetButton
{
    CLLocationCoordinate2D center = self.mapView.userLocation.coordinate;
    [self.mapView setCenterCoordinate:center animated:YES];
}

- (void)loadPastData
{
    [self.tableView.mj_footer endRefreshing];
    QCoordinateRegion region;
    CLLocationCoordinate2D centerCoordinate = self.mapView.region.center;
    region.center= centerCoordinate;
    self.isSearchPage = 2;
    QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
    poiSearchOption.page_size = 20;
    self.pageIndex ++;
    poiSearchOption.page_index = self.pageIndex;
    [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:centerCoordinate radius:1000];
    [self.searcher searchWithPoiSearchOption:poiSearchOption];
}

- (void)refreshData:(NSNotification *)notification
{
    QMSSuggestionPoiData *data = (notification.userInfo[@"data"]);
    CLLocationCoordinate2D center = data.location;
    [self.mapView setCenterCoordinate:center animated:YES];
    self.searchController.searchBar.text = nil;
    self.isSearchPage = 2;
    QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
    poiSearchOption.page_size = 20;
    [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:data.location radius:1000];
    [self.searcher searchWithPoiSearchOption:poiSearchOption];
    [self willDismissSearchController:self.searchController];
    //    [self.searchController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITabelViewDataSource / UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Identifier"];
        UIImageView *rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"record_icon_selected"]];
        rightImageView.tag = 100;
        rightImageView.frame = CGRectMake(SCREEN_WIDTH - 35, 25, 20, 20);
        [cell addSubview:rightImageView];
    }
    cell.textLabel.text = self.dataList[indexPath.row].title;
    cell.detailTextLabel.text = self.dataList[indexPath.row].address;
    CLLocationCoordinate2D center = [self.dataList objectAtIndex:indexPath.row].location;
    UIImageView *img = (UIImageView *)[cell viewWithTag:100];
    if ((self.centerPoint.coordinate.latitude == center.latitude && self.centerPoint.coordinate.longitude == center.longitude)) {
        img.hidden = NO;
    }
    else {
        img.hidden = YES;
    }

    return cell;

    //    DYLocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    //    if (!cell) {
    //        cell = [[DYLocationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
    //    }
    //    cell.title.text = self.dataList[indexPath.row].title;
    //    cell.subTitle.text = self.dataList[indexPath.row].address;
    //    CLLocationCoordinate2D center = [self.dataList objectAtIndex:indexPath.row].location;
    //    if ( self.centerPoint.coordinate.latitude == center.latitude && self.centerPoint.coordinate.longitude == center.longitude) {
    //        cell.rightImageView.image = [UIImage imageNamed:@"record_icon_selected"];
    //    }
    //    else {
    //        cell.rightImageView.image = [UIImage imageNamed:@""];
    //    }
    //    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CLLocationCoordinate2D center = [self.dataList objectAtIndex:indexPath.row].location;
    self.centerPoint.coordinate = center;
    self.centerPoint.title = [self.dataList objectAtIndex:indexPath.row].title;
    [self.mapView setCenterCoordinate:center animated:YES];
    self.object = [[NSObject alloc] init];
    [tableView reloadData];
}

-(NIMKitLocationPoint *)centerPoint {
    if (!_centerPoint) {
        _centerPoint = [[NIMKitLocationPoint alloc] init];
    }
    return _centerPoint;
}

#pragma mark - UISearchControllerDelegate / UISearchResultsUpdating
//将要输入
- (void)willPresentSearchController:(UISearchController *)searchController
{
    [UIView animateWithDuration:0.25 animations:^{
        self.mapView.frame = CGRectMake(0, 64, self.view.bounds.size.width, MapViewH);
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.mapView.frame), self.view.bounds.size.width, self.view.bounds.size.height - MapViewH - 64);
//        self.imageViewAnntation.center = self.mapView.center;
    }];
}

//将要退出搜索框
- (void)willDismissSearchController:(UISearchController *)searchController
{
    [UIView animateWithDuration:0.25 animations:^{
        self.mapView.frame = CGRectMake(0, self.searchController.searchBar.frame.size.height + 64, self.view.bounds.size.width, MapViewH);
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.mapView.frame), self.view.bounds.size.width, self.view.bounds.size.height - MapViewH - SearchBarH - 64);
//        self.imageViewAnntation.center = self.mapView.center;
    }];
}

//搜索框正在输入
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    self.isSearchPage = 1;
    QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
    poiSearchOption.keyword = searchController.searchBar.text;
    NSString *boundary = [NSString stringWithFormat:@"%@%@%@",@"region(",self.currentAddressInfo.province,@",1)"];
    poiSearchOption.boundary = boundary;   //@"region(北京,1)"
    poiSearchOption.page_size = 20;
    poiSearchOption.page_index = 1;
    self.searchResultsController.pageIndex = 1;
    [self.searcher searchWithPoiSearchOption:poiSearchOption];
}

#pragma mark - QMapViewDelegate
-(QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    if ([annotation isKindOfClass:[myAnnotation class]])
    {
        static NSString *customReuseIndetifier = @"customReuseIndetifier";

        QAnnotationView *annotationView = (QAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];

        if (annotationView == nil)
        {
            annotationView = [[QAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
            // must set to NO, so we can show the custom callout view.
            annotationView.canShowCallout = NO;
            annotationView.draggable = YES;
            annotationView.image = [UIImage imageNamed:@"greenPin_lift"];
        }
        [annotationView setSelected:YES animated:YES];

        __block QAnnotationView *blockView = annotationView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blockView.superview bringSubviewToFront:blockView];
        });

        return annotationView;
    }

    return nil;
}
//开始定位
- (void)mapViewWillStartLocatingUser:(QMapView *)mapView
{
    NSLog(@"%f--%f--%f--%f",mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude,mapView.region.center.latitude,mapView.region.center.longitude);
    QMSReverseGeoCodeSearchOption *regeocoder = [[QMSReverseGeoCodeSearchOption alloc] init];
    regeocoder.location = [NSString stringWithFormat:@"%f,%f",mapView.region.center.latitude,mapView.region.center.longitude];
    //    if (!self.isSubmit) {
    //        regeocoder.location = [NSString stringWithFormat:@"%f,%f",self.centerPoint.coordinate.latitude,self.centerPoint.coordinate.longitude];
    //    }
    [regeocoder setCoord_type:QMSReverseGeoCodeCoordinateTencentGoogleGaodeType];
    [self.searcher searchWithReverseGeoCodeSearchOption:regeocoder];
}

//结束定位
- (void)mapViewDidStopLocatingUser:(QMapView *)mapView
{

}

//刷新定位,只要位置发生变化就会调用
- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (self.isNeedLocation) {
        if (updatingLocation) {
            if (!self.isSubmit) {
                self.isSearchPage = 2;
                QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
                poiSearchOption.page_size = 20;
                [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:self.centerPoint.coordinate radius:1000];
                [self.searcher searchWithPoiSearchOption:poiSearchOption];
                self.isNeedLocation = NO;
                return;
            }
            self.isSearchPage = 2;
            QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
            poiSearchOption.page_size = 20;
            [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:userLocation.location.coordinate radius:1000];
            [self.searcher searchWithPoiSearchOption:poiSearchOption];
        }
        self.isNeedLocation = NO;
    }
}

//定位失败
- (void)mapView:(QMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"didFailToLocateUserWithError--error--%@",error);

}

//查询出现错误
- (void)searchWithSearchOption:(QMSSearchOption *)searchOption didFailWithError:(NSError*)error
{
    NSLog(@"searchWithSearchOption--error--%@",error);
}

//mapView移动后执行
- (void)mapView:(QMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    //手动滑动地图定位
    if (self.object == nil) {
        if (!self.isSubmit) {
            self.pageIndex = 1;
            QCoordinateRegion region;
            CLLocationCoordinate2D centerCoordinate = self.centerPoint.coordinate;
            region.center= centerCoordinate;
            self.isSearchPage = 2;
            QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
            poiSearchOption.page_size = 20;
            [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:centerCoordinate radius:1000];
            [self.searcher searchWithPoiSearchOption:poiSearchOption];
            [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
            return;
        }
        self.pageIndex = 1;
        QCoordinateRegion region;
        CLLocationCoordinate2D centerCoordinate = mapView.region.center;
        region.center= centerCoordinate;
        self.isSearchPage = 2;
        QMSPoiSearchOption *poiSearchOption = [[QMSPoiSearchOption alloc] init];
        poiSearchOption.page_size = 20;
        [poiSearchOption setBoundaryByNearbyWithCenterCoordinate:centerCoordinate radius:1000];
        [self.searcher searchWithPoiSearchOption:poiSearchOption];
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
    } else {
        self.object = nil;
    }
}

//poi查询结果回调函数
- (void)searchWithPoiSearchOption:(QMSPoiSearchOption *)poiSearchOption didReceiveResult:(QMSPoiSearchResult *)poiSearchResult
{
    for (QMSPoiData *data in poiSearchResult.dataArray) {
        NSLog(@"%@-- %@-- %@",data.title,data.address,data.tel);
    }

    //根据本页地图返回的结果
    if (self.isSearchPage == 2) {
        //手滑动重新赋值数据源
        if (self.pageIndex == 1) {
            [self.dataList removeAllObjects];
            self.dataList = [NSMutableArray arrayWithArray:poiSearchResult.dataArray];
        } else {
            [self.dataList addObjectsFromArray:poiSearchResult.dataArray];
        }
        [self.tableView reloadData];
    }
    //搜索控制器根据关键词返回的结果
    if (self.isSearchPage == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:SearchResultGetPoiSearchResult object:nil userInfo:@{@"data":poiSearchResult.dataArray}];
    }
}

//根据定位当前的经纬度编码出当前位置信息
- (void)searchWithReverseGeoCodeSearchOption:(QMSReverseGeoCodeSearchOption *)reverseGeoCodeSearchOption didReceiveResult:(QMSReverseGeoCodeSearchResult *)reverseGeoCodeSearchResult
{
    self.currentAddressInfo = reverseGeoCodeSearchResult.ad_info;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
