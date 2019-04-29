//
//  BaiduLocation.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "BaiduLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface BaiduLocation ()<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>

@property (nonatomic, strong) BMKLocationService* locService;
@property (nonatomic, copy) LocationdResultBlock locationdResultBlock;

@end

@implementation BaiduLocation

+ (BaiduLocation*)sharedInstance {
    static dispatch_once_t once;
    static BaiduLocation *sharedHelper;
    dispatch_once(&once, ^{
        sharedHelper = [[self alloc] init]; });
    return sharedHelper;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self locService];
    }
    return self;
}

+ (void)requestAuthorizationWithCompletionHandler:(void (^)(BOOL granted))completionHandler {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (([CLLocationManager locationServicesEnabled] &&
         (status == kCLAuthorizationStatusAuthorizedAlways ||
          status == kCLAuthorizationStatusAuthorizedWhenInUse))||
         status == kCLAuthorizationStatusNotDetermined) {
        completionHandler(YES);
        NSLog(@"已经打开了定位服务");
    }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        NSLog(@"定位功能不可用");
        completionHandler(NO);
    }
}

+ (void)getLocationPositionCompletionHandler:(LocationdResultBlock)completionHandler {
    [self sharedInstance].locationdResultBlock = completionHandler;
    [self requestAuthorizationWithCompletionHandler:^(BOOL granted) {
        [[self sharedInstance].locService startUserLocationService];
        if (granted) {
//            [[self sharedInstance].locService startUserLocationService];
        }else {
            // 没有开启定位
            if ([self sharedInstance].locationdResultBlock) {
                [self sharedInstance].locationdResultBlock(nil, NO, @"无法定位当前位置，去设置");
            }
        }
    }];
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    
      [self.locService stopUserLocationService];
    
    // 获取当前所在的城市名
    //初始化地理编码类
    //注意：必须初始化地理编码类
    BMKGeoCodeSearch *geoCodeSearch = [[BMKGeoCodeSearch alloc]init];
    geoCodeSearch.delegate = self;
    //初始化逆地理编码类
    BMKReverseGeoCodeSearchOption *reverseGeoCodeOption= [[BMKReverseGeoCodeSearchOption alloc] init];
    //需要逆地理编码的坐标位置
    reverseGeoCodeOption.location = userLocation.location.coordinate;
    [geoCodeSearch reverseGeoCode:reverseGeoCodeOption];
}

/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeSearchResult *)result errorCode:(BMKSearchErrorCode)error {
    
    BMKReverseGeoCodeSearchResult *resultobj;
    BOOL granted;
    if (error == BMK_SEARCH_NO_ERROR) {
        resultobj = result;
        granted = YES;
    }else {
        resultobj = nil;
        granted = NO;
    }
    if (self.locationdResultBlock) {
        NSString *errorStr;
        if (error != BMK_OPEN_NO_ERROR) { // 授权
            errorStr = @"网络出错，无法定位当前位置";
        }
        self.locationdResultBlock(resultobj,granted,errorStr);
    }
    
    //BMKReverseGeoCodeResult是编码的结果，包括地理位置，道路名称，uid，城市名等信息
//    NSLog(@"ok --- :%@ -- %@ -- %@ -- %@",result.address,result.businessCircle,result.sematicDescription,result.addressDetail.streetNumber);
}

-(BMKLocationService *)locService {
    if (!_locService) {
        _locService = [[BMKLocationService alloc]init];
        _locService.distanceFilter = 20;
//        _locService.headingFilter = 4;
//        _locService.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
//        _locService.pausesLocationUpdatesAutomatically = YES;
//        _locService.allowsBackgroundLocationUpdates = NO;
        _locService.delegate = self;
    }
    return _locService;
}

@end
