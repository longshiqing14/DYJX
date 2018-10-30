//
//  XYSystemLocation.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYSystemLocation.h"


#import <AMapLocationKit/AMapLocationKit.h>



#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5
@interface XYSystemLocation () <AMapLocationManagerDelegate>

@property (nonatomic, strong) AMapLocationManager * locationManager;
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

@end

@implementation XYSystemLocation

#pragma mark - public 

- (void)beginUpdatingLocation
{

//    // kCLAuthorizationStatusAuthorizedWhenInUse  用户已经授权按需使用
//    // kCLAuthorizationStatusAuthorizedAlways  用户已经授权一直使用
//    // kCLAuthorizationStatusNotDetermined  用户未选择
//    CLAuthorizationStatus authStatus = [CLLocationManager  authorizationStatus];
//    if (authStatus == kCLAuthorizationStatusAuthorizedWhenInUse || authStatus == kCLAuthorizationStatusAuthorizedAlways || authStatus == kCLAuthorizationStatusNotDetermined) {
////        self.locationManager.locatingWithReGeocode=YES;
//        //授权成功，执行后续操作
//        [self.locationManager startUpdatingLocation];
//    }else {
//        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(locationDidEndUpdatingError)]) {
//            [self.delegate locationDidEndUpdatingError];
//        }
//    }
    [self configLocationManager];
    [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
}

#pragma mark - AMapLocationManagerDelegate

/** 定位 错误 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(locationDidEndUpdatingError)]) {
        [self.delegate locationDidEndUpdatingError];
    }
}



- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    XYLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);

    if (location != nil) {
        
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(locationDidEndUpdatingCoordinate:)]){
            [self.delegate locationDidEndUpdatingCoordinate:location.coordinate];
        }
    }
    
    if (reGeocode) {
        
        [self.locationManager stopUpdatingLocation];
        
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(locationDidEndUpdatingCity:)]){
            XYLocationModel *locationModel=[[XYLocationModel alloc]init];
            locationModel.city=reGeocode.city;
            locationModel.district=reGeocode.district;
            [self.delegate locationDidEndUpdatingCity:locationModel];
        }
    }
}


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
        
        
        //根据定位信息，添加annotation
        
        
        
    };
}









@end
