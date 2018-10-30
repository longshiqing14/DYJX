//
//  XYBestRequest.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYBestRequest : NSObject

/** 请求 组装 */
+ (NSMutableDictionary*)requestAllDataWithApi_ID:(NSString*)api_ID
                         request_data:(NSDictionary*)request_data;

@end
