//
//  XYUserDefaults.m
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYUserDefaults.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>

@implementation XYUserDefaults


/** 读取 LoginedInfoModel  */
+ (DYJXUserModel*)readUserDefaultsLoginedInfoModel{
    DYJXUserModel * model = [DYJXUserModel modelWithJSON: [[NSUserDefaults standardUserDefaults] objectForKey:XY_userDefaults_Logined]];
    return model;
}
/** 写入 LoginedInfoModel  */
+ (void)writeUserDefaultsLoginedInfoModel:(DYJXUserModel*)model{
    NSString *LoginedInfoModelJsonString =  [model modelToJSONString];
    [[NSUserDefaults standardUserDefaults]setObject:LoginedInfoModelJsonString forKey:XY_userDefaults_Logined];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/** 读取 DYJXIdentitySwitchingCreatorModel  */
+ (DYJXIdentitySwitchingCreatorModel*)readLoginedInfoRongTokenModel{
    DYJXIdentitySwitchingCreatorModel * model = (DYJXIdentitySwitchingCreatorModel *)[DYJXIdentitySwitchingCreatorModel getModelWithKey:XY_userDefaults_userInfo Class:[DYJXIdentitySwitchingCreatorModel class]];
    return model;
}
/** 写入 DYJXIdentitySwitchingCreatorModel  */
+ (void)writeLoginedInfoRongTokenModel:(DYJXIdentitySwitchingCreatorModel*)model{
    [XYUserDefaults setModel:model forKey:XY_userDefaults_userInfo];
}



/** 删除 LoginedInfoModel  */
+ (void)deleteUserDefaultsLoginedInfoModel{
    [self writeLoginedInfoRongTokenModel:nil];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:XY_userDefaults_Logined];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/********************************CertificateId************************************/
/** 读取全局变量  CertificateId  */
+ (NSString*)readAppDlegateOfCertificateId
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.certificateId;
}


/** 写入全局变量  CertificateId  */
+ (void)writeAppDlegateOfCertificateId:(NSString *)str
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.certificateId = str;
}



/** 读取 Registered  */
+ (NSDictionary*)readUserDefaultsRegistered
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults] objectForKey:XY_userDefaults_Registered];
    return dic;
}
/** 写入 Registered  */
+ (void)writeUserDefaultsRegisteredDict:(NSDictionary*)dic
{
    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:XY_userDefaults_Registered];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/** 删除 Registered  */
+ (void)deleteUserDefaultsRegistered
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:XY_userDefaults_Registered];
    [[NSUserDefaults standardUserDefaults] synchronize];
}





/** 写入 UserDefaults  sessionId */
+ (void)writeUserDefaultsSessionIdDict:(NSDictionary*)dic
{
    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:XY_userDefaults_SessionId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/** 读取 UserDefaults  sessionId */
+ (NSString*)readUserDefaultsOfSessionId
{
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults] objectForKey:XY_userDefaults_SessionId];
    if (dict.count == 0) {
        return nil;
    }
    if (dict[@"sessionId"] != nil) {
        return dict[@"sessionId"];
    }
    return nil;
}

/** 删除sessionId */
+(void)deleteUserDefaultSessionId
{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:XY_userDefaults_SessionId];
}


/** 读取 userinfo  */
+ (NSDictionary*)readUserDefaultsInfo
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults] objectForKey:XY_userDefaults_Info];
    return dic;
}
/** 写入 userinfo  */
+ (void)writeUserDefaultsInfoDict:(NSDictionary*)dic
{
    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:XY_userDefaults_Info];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/** 删除 Registered  */
+ (void)deleteUserDefaultsInfo
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:XY_userDefaults_Info];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/********************************购物车 数量************************************/
/** 读取全局变量  cartCountStr  */
+ (NSString*)readAppDlegateOfCartCountStr
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.cartCountStr;
}


/** 写入全局变量  cartCountStr  */
+ (void)writeAppDlegateOfCartCountStr:(NSString *)str
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.cartCountStr = str;
}



/********************************订单 数量************************************/
/** 读取全局变量  orderCountDict  */
+ (NSDictionary*)readAppDlegateOfOrderCountDict
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.orderCountDict;
}

/** 返回 状态 */
+ (NSString*)readAppDlegateOfStatusDictKey:(NSString*)key otherKey:(NSString*)otherKey
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    if (delegate.orderCountDict.count != 0) {
        
        NSString * statusStr = [NSString stringWithFormat:@"%d",[[[delegate.orderCountDict objectForKey:key] objectForKey:otherKey] intValue]];
        
        if (statusStr != nil) {
            return statusStr;
        }else{
            return @"";
        }
        
    }else{
        return @"";
    }
}

/** 写入全局变量  orderCountDict  */
+ (void)writeAppDlegateOfOrderCountDict:(NSDictionary *)dic
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.orderCountDict = [XYCommon removeNull:dic];
}




/******************************** 账号地址 信息 ************************************/
/** 读取全局变量  user_city  */
+ (XYSelectCommuityModel*)readAppDlegateOfUser_city
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    XYSelectCommuityModel * newModel = [XYSelectCommuityModel mj_objectWithKeyValues:delegate.user_city];
    return newModel;
}

/** 读取全局变量  user_city fixed  */
+ (NSString*)readAppDlegateOfUser_cityOfFfixed
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    XYSelectCommuityModel * newModel = [XYSelectCommuityModel mj_objectWithKeyValues:delegate.user_city];
    return newModel.fixed;
}

/** 读取全局变量  user_city city  */
+ (NSString*)readAppDlegateOfUser_cityOfcityid
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    XYSelectCommuityModel * newModel = [XYSelectCommuityModel mj_objectWithKeyValues:delegate.user_city];
    return newModel.cityId;
}
/** 读取全局变量  user_city merchantId  */
+ (NSString*)readAppDlegateOfUser_cityOfMerchantId
{
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    XYSelectCommuityModel * newModel = [XYSelectCommuityModel mj_objectWithKeyValues:delegate.user_city];
    return newModel.merchantId;
}
/** 写入全局变量  user_city  */
+ (void)writeAppDlegateOfOrderMerchantId:(NSDictionary*)dict
{
    
    AppDelegate * delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.user_city = dict;
}

@end

