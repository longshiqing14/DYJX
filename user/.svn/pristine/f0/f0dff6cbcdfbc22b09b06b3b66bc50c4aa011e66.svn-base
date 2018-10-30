//
//  XYAppDotNetAPIClient.m
//  myText
//
//  Created by xingyun on 16/7/22.
//  Copyright © 2016年 xingyun. All rights reserved.
//

#import "XYAppDotNetAPIClient.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"";

@implementation XYAppDotNetAPIClient

+ (instancetype)sharedClient
{
    static XYAppDotNetAPIClient * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[XYAppDotNetAPIClient alloc]initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
//        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
//        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];

        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        
        _sharedClient.requestSerializer.timeoutInterval = 30;
        
    });
    
    return _sharedClient;
}


@end
