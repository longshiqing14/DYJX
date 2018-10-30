//
//  LocationTool.m
//  ARP
//
//  Created by liu_yakai on 2017/12/9.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "JXLocationTool.h"
#import <MapKit/MapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
//#import <AMapSearchKit/AMapSearchKit.h>


#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5
@interface JXLocationTool ()<AMapLocationManagerDelegate>//,AMapSearchDelegate>

@property (nonatomic, strong) AMapLocationManager * locationManager;
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
//@property (nonatomic, strong) AMapSearchAPI *search;


@end

static JXLocationTool *locationTool;

@implementation JXLocationTool

+(JXLocationTool *)shar{
    if (locationTool==nil) {
        locationTool=[[JXLocationTool alloc]init];
        
    }
    [locationTool configLocationManager];
//    [locationTool mapSeach];
    return locationTool;
    
}

//-(void)mapSeach{
//    if (_search==nil) {
//        self.search = [[AMapSearchAPI alloc] init];
//        self.search.delegate = self;
//    }
//}

//-(void)cleaa{
////    self.search.delegate=nil;
//    self.search=nil;
//}


- (void)configLocationManager
{
    [self initCompleteBlock];
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:YES];
    
    //设置允许在后台定位
    //    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
    
    //设置开启虚拟定位风险监测，可以根据需要开启
    [self.locationManager setDetectRiskOfFakeLocation:NO];
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
}

- (void)initCompleteBlock
{
    __weak typeof(self)weakSelf = self;
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error != nil && error.code == AMapLocationErrorLocateFailed)
        {
            //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"定位错误:{%ld - %@};", (long)error.code, error.localizedDescription);
            if (weakSelf.LocationLaLn) {
                weakSelf.LocationLaLn(nil);
            }
            if (weakSelf.Location) {
                weakSelf.Location(nil);
            }
            return;
        }
        else if (error != nil
                 && (error.code == AMapLocationErrorReGeocodeFailed
                     || error.code == AMapLocationErrorTimeOut
                     || error.code == AMapLocationErrorCannotFindHost
                     || error.code == AMapLocationErrorBadURL
                     || error.code == AMapLocationErrorNotConnectedToInternet
                     || error.code == AMapLocationErrorCannotConnectToHost))
        {
            //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
            NSLog(@"逆地理错误:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        else if (error != nil && error.code == AMapLocationErrorRiskOfFakeLocation)
        {
            //存在虚拟定位的风险：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"存在虚拟定位的风险:{%ld - %@};", (long)error.code, error.localizedDescription);
            return;
        }
        else
        {
            //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
        }
//        NSLog(@"%f    %f",location.coordinate.latitude, location.coordinate.longitude);
//        if (weakSelf.Location) {
//            weakSelf.Location(location.coordinate.latitude,location.coordinate.longitude);
//        }
        //根据定位信息，添加annotation
        
        XYLocationModel *locationModel;
        if(regeocode){
            
            locationModel=[[XYLocationModel alloc]init];
            locationModel.city=regeocode.city;
            locationModel.district=regeocode.district;
            if (weakSelf.Location) {
                weakSelf.Location(locationModel);
            }
        }
        XYlatModel *latModel;
        if(location){
            latModel=[[XYlatModel alloc]init]; latModel.lat=location.coordinate.latitude;
            latModel.lon=location.coordinate.longitude;
            if (weakSelf.LocationLaLn) {
                weakSelf.LocationLaLn(latModel);
            }
        }
        
    };
}


//#pragma mark - AMapSearchDelegate
//- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
//{
//    NSLog(@"Error: %@", error);
//}
//
///* POI 搜索回调. */
//- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
//{
////    [self.mapView removeAnnotations:self.mapView.annotations];
//
//    if (response.pois.count == 0)
//    {
//        return;
//    }
//    if (self.SeachFish) {
//        self.SeachFish(response.pois);
//    }
//    NSMutableArray *poiAnnotations = [NSMutableArray arrayWithCapacity:response.pois.count];
//
//    [response.pois enumerateObjectsUsingBlock:^(AMapPOI *obj, NSUInteger idx, BOOL *stop) {
//
////        [poiAnnotations addObject:[[POIAnnotation alloc] initWithPOI:obj]];
//
//    }];
//
//    /* 将结果以annotation的形式加载到地图上. */
////    [self.mapView addAnnotations:poiAnnotations];
//
////    /* 如果只有一个结果，设置其为中心点. */
////    if (poiAnnotations.count == 1)
////    {
////        [self.mapView setCenterCoordinate:[poiAnnotations[0] coordinate]];
////    }
////    /* 如果有多个结果, 设置地图使所有的annotation都可见. */
////    else
////    {
////        [self.mapView showAnnotations:poiAnnotations animated:NO];
////    }
//}
//
//#pragma mark - Utility
///* 根据关键字来搜索POI. */
//- (void)searchPoiByKeyword:(NSString *)keyword City:(NSString *)city
//{
//    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
//    request.keywords = keyword;
//    //    request.keywords            = @"北京大学";
//        request.city                = city;
//    //    request.types               = @"高等院校";
//    //    request.requireExtension    = YES;
//    //
//    //    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
//        request.cityLimit           = YES;
//    request.requireSubPOIs      = YES;
//
//    [self.search AMapPOIKeywordsSearch:request];
//}





@end
