//
//  XYSystemLocation.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYLocationModel.h"
#import <MapKit/MapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#import <AMapSearchKit/AMapSearchKit.h>

@protocol XYSystemLocationDelegate <NSObject>

/** 定位成功返回坐标 */
- (void)locationDidEndUpdatingCoordinate:(CLLocationCoordinate2D)coordinate;

/** 定位失败 */
- (void)locationDidEndUpdatingError;

@optional
/** 定位成功返回 城市 */
- (void)locationDidEndUpdatingCity:(XYLocationModel*)locationModel;

@end

@interface XYSystemLocation : NSObject


@property (nonatomic, weak) id<XYSystemLocationDelegate> delegate;
@property(nonatomic,copy)void (^ Success)(XYlatModel *latModel);
@property(nonatomic,copy)void (^ POISearch)(XYlatModel *latModel);
//点位返回对象
@property(nonatomic,copy)void (^ Location)(XYLocationModel *locationModel);
//@property(nonatomic,copy)void (^ Failure)(BaseResp *baseResp);

//点位返回对象
@property(nonatomic,copy)void (^ LocationLaLn)(XYlatModel *latModel);

- (void)beginUpdatingLocation;


- (void)configLocationManager;

@end
