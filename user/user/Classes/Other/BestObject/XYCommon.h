//
//  XYCommon.h
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>




//NSUserDefaults
#define XY_userDefaults_Logined                 @"XY_userDefaults_Logined"   //登录信息
#define XY_userDefaults_SessionId                  @"XY_userDefaults_SessionId"    //SessionId
#define XY_userDefaults_Registered                 @"XY_userDefaults_Registered"   //注册信息
#define XY_userDefaults_Info                       @"XY_userDefaults_Info"         //个人信息
#define XY_userDefaults_userInfo             @"XY_userDefaults_userInfo"         //rongToken


//
#define XY_notification_ItemsBadge                  @"XY_notification_ItemsBadge"   //tabbar 角标
#define XY_notification_notice                      @"XY_notification_notice"       //点击的推送消息

#define XY_Network_Status_NotReachable              @"XY_Network_Status_NotReachable"  // 没有网络

@interface XYCommon : NSObject

extern const  CGFloat XY_Left_Margin;

extern const  CGFloat XY_Right_Margin;

/** api url */
extern NSString * const BEST_URL;
/** H5 url */
extern NSString * const BEST_H5_URL;

/** key */
extern NSString * const UMENG_KEY;
extern NSString * const JPUSH_KEY;
extern NSString * const GAODE_KEY;

/** pay type */
extern NSString * const XY_PAY_TYPE_WEIXIN;
extern NSString * const XY_PAY_TYPE_AIL;



/** 字典 转换 json */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/** json 数组 或者 字典 */
+ (id)dataFromJsonString:(NSString *)jsonString ;
/** 把字典中的 null 转换成 @"" */
+ (NSDictionary*)removeNull:(NSDictionary*)dict;

/** 跳转到登录界面 */
+ (void)setPresentViewControllerWithLoginView;

/** 获取 当前的vc */
+(UIViewController *)getCurrentVC;


@end
