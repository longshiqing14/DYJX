//
//  NetWorkTool.h
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : NSObject


+(instancetype) shareInstance;
//网络请求数据
//post请求
//parse字典类型的参数
//请求的url
+ (void)postRequest:(NSDictionary *)parse relativePath:(NSString *)url ShowAndDismiss:(BOOL)showAndDismiss success:(void (^)(id responseObject))success failure:(void (^)())failure  UnusualFailure:(void (^)())unusualFailure;

//+ (void)getParameter:(id )parse relativePath:(NSString *)url success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
//
//+(void)uplod;
//
//-(void)second;
//
//+(NSAttributedString *)contextAttributedString:(NSString *)AttributedString;

+(NSString *)stringManipulation:(NSString *)manipulation;

+(NSString *)stringfilter:(NSString *)filterStr;
@end
