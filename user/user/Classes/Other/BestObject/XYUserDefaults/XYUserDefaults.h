//
//  XYUserDefaults.h
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYPickCityModel.h"
#import "DYJXUserModel.h"
#import "DYJXUserInfoModel.h"

@interface XYUserDefaults : NSObject


/** 读取 LoginedInfoModel  */
+ (DYJXUserModel*)readUserDefaultsLoginedInfoModel;
/** 写入 LoginedInfoModel  */
+ (void)writeUserDefaultsLoginedInfoModel:(DYJXUserModel*)model;
/** 删除 LoginedInfoModel  */
+ (void)deleteUserDefaultsLoginedInfoModel;



//RongToken
+ (DYJXUserInfoModel*)readLoginedInfoRongTokenModel;
/** 写入 DYJXUserInfoModel  */
+ (void)writeLoginedInfoRongTokenModel:(DYJXUserInfoModel*)model;


/** 读取 Registered  */
+ (NSDictionary*)readUserDefaultsRegistered;
/** 写入 Registered  */
+ (void)writeUserDefaultsRegisteredDict:(NSDictionary*)dic;
/** 删除 Registered  */
+ (void)deleteUserDefaultsRegistered;


/** 写入 UserDefaults  sessionId */
+ (void)writeUserDefaultsSessionIdDict:(NSDictionary*)dic;
/** 读取 UserDefaults  sessionId */
+ (NSString*)readUserDefaultsOfSessionId;
/** 删除sessionId */
+(void)deleteUserDefaultSessionId;


/** 写入 userinfo  */
+ (NSDictionary*)readUserDefaultsInfo;
/** 读取 userinfo  */
+ (void)writeUserDefaultsInfoDict:(NSDictionary*)dic;
/** 删除 Registered  */
+ (void)deleteUserDefaultsInfo;




/** 读取全局变量  cartCountStr  */
+ (NSString*)readAppDlegateOfCartCountStr;
/** 写入全局变量  cartCountStr  */
+ (void)writeAppDlegateOfCartCountStr:(NSString *)str;



/** 读取全局变量  orderCountDict  */
+ (NSDictionary*)readAppDlegateOfOrderCountDict;
/** 返回 状态 */
+ (NSString*)readAppDlegateOfStatusDictKey:(NSString*)key otherKey:(NSString*)otherKey;
/** 写入全局变量  orderCountDict  */
+ (void)writeAppDlegateOfOrderCountDict:(NSDictionary *)dic;



/** 读取全局变量  user_city  */
+ (XYSelectCommuityModel*)readAppDlegateOfUser_city;
/** 读取全局变量  user_city fixed  */
+ (NSString*)readAppDlegateOfUser_cityOfFfixed;
/** 读取全局变量  user_city city  */
+ (NSString*)readAppDlegateOfUser_cityOfcityid;
/** 读取全局变量  user_city merchantId  */
+ (NSString*)readAppDlegateOfUser_cityOfMerchantId;
/** 写入全局变量  user_city  */
+ (void)writeAppDlegateOfOrderMerchantId:(NSDictionary*)dict;


@end
