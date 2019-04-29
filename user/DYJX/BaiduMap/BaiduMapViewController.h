//
//  BaiduMapViewController.h
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaiduMapViewController : UIViewController

-(instancetype)initWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate poiAddressBlock:(void(^)(CLLocationCoordinate2D centerCoordinate, NSString *name))poiAddressBlock;

@end
