//
//  BaiduLocation.h
//  user
//
//  Created by YP on 2019/4/29.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

typedef void(^LocationdResultBlock)(BMKReverseGeoCodeSearchResult *result,BOOL granted, NSString *errorStr);

typedef NS_ENUM(int, BaiduLocationType) {
    BaiduLocationType_Default = 0,           /** 默认为只定位为一次    */
    BaiduLocationType_Continuous = 1,        /** 持续定位            */
};

@interface BaiduLocation : NSObject

+ (BaiduLocation *)sharedInstance;

+ (void)requestAuthorizationWithCompletionHandler:(void (^)(BOOL granted))completionHandler;

+ (void)getLocationPositionCompletionHandler:(LocationdResultBlock)completionHandler;


@end
