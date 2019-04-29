//
//  BaiduMapViewController.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "BaiduMapViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import "BaiduPlaceModel.h"

@interface BaiduMapViewController ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate,BMKLocationServiceDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) BMKPinAnnotationView *annotation;

@property (nonatomic, strong) BMKGeoCodeSearch *geoCodeSearch;

@property (nonatomic, strong) BMKReverseGeoCodeSearchOption *reverseGeoCodeOption;

@property (nonatomic, strong) BMKLocationService *locService;

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) UIButton *mapPin;

@property (nonatomic, strong) UITableView *placeTableview;
@property (nonatomic,strong) NSMutableArray *placeDataArray;

@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;

@property (nonatomic, copy) void (^poiAddressBlock)(CLLocationCoordinate2D centerCoordinate, NSString *name);
@property (nonatomic, assign) CLLocationCoordinate2D oldcenterCoordinate;
@property (nonatomic, strong) BMKUserLocation *userLocation;
@property (nonatomic, strong) UIButton *centerLocationBtn;
@property (nonatomic, assign) BOOL isClickCenterBtn;

@end

@implementation BaiduMapViewController

-(instancetype)initWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate poiAddressBlock:(void(^)(CLLocationCoordinate2D centerCoordinate, NSString *name))poiAddressBlock {
    self = [super init];
    if (self) {
        self.centerCoordinate = centerCoordinate;
        self.poiAddressBlock = poiAddressBlock;
        self.oldcenterCoordinate = centerCoordinate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择地址";
    self.view.backgroundColor = [UIColor whiteColor];
    [self locService];
    [self mapView];
    [self mapPin];
    [self.mapView bringSubviewToFront:self.mapPin];
    [self.mapView bringSubviewToFront:self.centerLocationBtn];
    [self placeTableview];
    if (self.centerCoordinate.latitude != 0) {
        [self setLocationCenterCoordinate:self.centerCoordinate];
        self.isClickCenterBtn = NO;
    }else {
        self.isClickCenterBtn = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.centerCoordinate.latitude != 0) {
        [self setInverseAddressCoding];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.placeDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    BaiduPlaceModel*model = self.placeDataArray[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.address;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.poiAddressBlock) {
        self.poiAddressBlock(self.centerCoordinate, [NSString stringWithFormat:@"%@%@",((BaiduPlaceModel *)self.placeDataArray[indexPath.row]).address,((BaiduPlaceModel *)self.placeDataArray[indexPath.row]).name]);
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark 设置cell分割线做对齐
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews {

    if ([self.placeTableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.placeTableview setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.placeTableview respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.placeTableview setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark BMKLocationServiceDelegate
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    self.mapView.showsUserLocation = YES;//显示定位图层
    NSLog(@"111");
    self.userLocation = userLocation;
    //设置地图中心为用户经纬度
    if (self.isClickCenterBtn) {
       [self.mapView updateLocationData:userLocation];
    }
    self.centerCoordinate = _mapView.centerCoordinate;
    [self setLocationCenterCoordinate:_mapView.centerCoordinate];
}

- (void)setLocationCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate {
    
    //设置地图中心为用户经纬度
    
//        _mapView.centerCoordinate = self.userLocation.location.coordinate;
    BMKCoordinateRegion region ;//表示范围的结构体
    region.center = centerCoordinate;//中心点
    region.span.latitudeDelta = 0.004;//经度范围（设置为0.1表示显示范围为0.2的纬度范围）
    region.span.longitudeDelta = 0.004;//纬度范围
    [self.mapView setRegion:region animated:YES];
}

#pragma mark BMKMapViewDelegate
- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    [self setInverseAddressCoding];
}

- (void)setInverseAddressCoding{
    //屏幕坐标转地图经纬度
    CLLocationCoordinate2D MapCoordinate=[_mapView convertPoint:_mapPin.center toCoordinateFromView:_mapView];
    self.centerCoordinate = _mapView.centerCoordinate;
    NSLog(@"222 -- %f --- %f",MapCoordinate.latitude,MapCoordinate.longitude);
    if (self.geoCodeSearch==nil) {
        //初始化地理编码类
        self.geoCodeSearch = [[BMKGeoCodeSearch alloc]init];
        self.geoCodeSearch.delegate = self;
        
    }
    if (self.reverseGeoCodeOption==nil) {
        
        //初始化反地理编码类
        self.reverseGeoCodeOption= [[BMKReverseGeoCodeSearchOption alloc] init];
    }
    
    //需要逆地理编码的坐标位置
    self.reverseGeoCodeOption.location =MapCoordinate;
    [self.geoCodeSearch reverseGeoCode:self.reverseGeoCodeOption];
}


#pragma mark BMKGeoCodeSearchDelegate

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeSearchResult *)result errorCode:(BMKSearchErrorCode)error {
    
    NSLog(@"33 -- %lu",(unsigned long)result.poiList.count);
    //获取周边用户信息
    if (error==BMK_SEARCH_NO_ERROR) {
        [self.placeDataArray removeAllObjects];
        for(BMKPoiInfo *poiInfo in result.poiList)
        {
            BaiduPlaceModel *model=[[BaiduPlaceModel alloc]init];
            model.name=poiInfo.name;
            model.address=poiInfo.address;
            
            [self.placeDataArray addObject:model];
            [self.placeTableview reloadData];
            [self setAnimate];
        }
    }else{
        NSLog(@"BMKSearchErrorCode: %u",error);
    }
}

- (void)setAnimate {
    if (self.placeTableview.frame.origin.y == self.mapView.size.height) {
        __weak typeof (self)weakSelf = self;
        self.mapPin.center = CGPointMake(self.mapView.size.width/2.0, self.mapView.size.height/2.0 - __X(75)/2.0);
        self.centerLocationBtn.center = CGPointMake(__X(100), self.mapView.size.height - __X(100));
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.mapView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, __X(750));
            weakSelf.placeTableview.frame = CGRectMake(0, weakSelf.mapView.size.height, [UIScreen mainScreen].bounds.size.width, weakSelf.view.frame.size.height - weakSelf.mapView.size.height);
        }];
    }
}

- (void)centerLocationBtnClick:(UIButton *)btn {
    self.isClickCenterBtn = YES;
//    self.mapView.showsUserLocation = NO;
    self.mapView.userTrackingMode = BMKUserTrackingModeFollow;
    self.mapView.showsUserLocation = YES;
    [self.mapView updateLocationData:self.userLocation];
    [self setInverseAddressCoding];
    [self setCenterCoordinate:self.userLocation.location.coordinate];
}

-(BMKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.size.height)];
        [self.view addSubview:_mapView];
        [_mapView setMapType:BMKMapTypeStandard];// 地图类型 ->卫星／标准、
        _mapView.zoomLevel=17;
        _mapView.delegate=self;
        _mapView.showsUserLocation = YES;
        _mapView.showsUserLocation = NO;//先关闭显示的定位图层
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
        _mapView.showsUserLocation = YES;//显示定位图层
    }
    return _mapView;
}

-(UIButton *)mapPin {
    if (!_mapPin) {
        _mapPin = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _mapPin.frame = CGRectMake(0, 0, __X(75), __X(75));
        _mapPin.center = CGPointMake(self.mapView.size.width/2.0, self.mapView.size.height/2.0 - __X(75)/2.0);
        [self.mapView addSubview:_mapPin];
        NSString *mapPinImage = [[NSBundle mainBundle]pathForResource:@"serach_Map.png" ofType:nil];
        [_mapPin setBackgroundImage:[UIImage imageNamed:mapPinImage] forState:(UIControlStateNormal)];
    }
    return _mapPin;
}

-(UIButton *)centerLocationBtn {
    if (!_centerLocationBtn) {
        _centerLocationBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _centerLocationBtn.frame = CGRectMake(0, 0, __X(75), __X(75));
        _centerLocationBtn.center = CGPointMake(__X(100), self.view.size.height - __X(100) - 64);
        [self.mapView addSubview:_centerLocationBtn];
        [_centerLocationBtn setBackgroundImage:[UIImage imageNamed:@"e_baifang1"] forState:(UIControlStateNormal)];
        [_centerLocationBtn addTarget:self action:@selector(centerLocationBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _centerLocationBtn;
}

-(BMKLocationService *)locService {
    if (!_locService) {
        _locService = [[BMKLocationService alloc]init];
        [_locService setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
        _locService.delegate = self;
        [_locService startUserLocationService];
    }
    return _locService;
}

-(UITableView *)placeTableview {
    if (!_placeTableview) {
        _placeTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, self.mapView.size.height, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height - self.mapView.size.height) style:(UITableViewStylePlain)];
        [self.view addSubview:_placeTableview];
        _placeTableview.delegate = self;
        _placeTableview.dataSource = self;
        [_placeTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _placeTableview;
}


-(NSMutableArray *)placeDataArray {
    if (!_placeDataArray) {
        _placeDataArray = [[NSMutableArray alloc]init];
    }
    return _placeDataArray;
}

@end
