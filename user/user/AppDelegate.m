//
//  AppDelegate.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//
#import "PDRCore.h"
#import "AppDelegate.h"
#import <AlipaySDK/AlipaySDK.h>
#import "IQKeyboardManager.h"        //键盘
#import <UMSocialCore/UMSocialCore.h>   //友盟分享
#import <AMapFoundationKit/AMapFoundationKit.h>  //高德地图
#import "UMMobClick/MobClick.h"
#import "JPUSHService.h"            // 极光推送
#import "WXApi.h"
#import "XYBestNavigationVC.h"
#import "XYLoginVC.h"
#import "XYPay.h"
#import "XYTabbarController.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "UPPaymentControl.h"
//#import "RSA.h"
#import <CommonCrypto/CommonDigest.h>
#import "XYUserDefaults.h"
#import "NSString+Tool.h"
#import <WebKit/WebKit.h>
#import "XYLoginAndRegisterNet.h"
#import "NaviViewController.h"
#import "XYLanuchGuideVideoVC.h"
#import "XYLanuchGuideVC.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#import "JXShareImageView.h"
#import "JXShareManager.h"
#import "NetWorkTool.h"
//版本更新
#import "JXVersionUpdateView.h"
#import "UpdateVersionModel.h"
#import "DYJXIdentitySwitchingPage.h"
#import "JSExtension.h"

// 账号密码： 18778399213 123456
// 账号密码： 13750820441 654321
//达意简讯
//###########################################
#import "DYJXLoginPage.h"

#import <RongIMKit/RongIMKit.h>
#define RongAppKey @"qf3d5gbjqs03h"

#endif

@interface AppDelegate ()<JPUSHRegisterDelegate,RCIMUserInfoDataSource,RCIMGroupInfoDataSource,RCIMGroupUserInfoDataSource,RCIMReceiveMessageDelegate>

@property (nonatomic, strong) UIImageView *photoIV;
@property (nonatomic, strong) JXShareImageView *shareImageView;
@property (nonatomic, strong) NSString *shareURL;
@property (nonatomic, strong) UIImageView *tempPhotoIV;
@end

static NSString *const FIRSTLANUCH = @"FIRSTLANUCH";
@implementation AppDelegate
//获取sessionID
-(void)getSessionId{
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (!sessionId) {
        [NetWorkTool postRequest:@{@"force":@""} relativePath:kJXAPI_user_sessionGet ShowAndDismiss:NO success:^(id responseObject) {
            NSDictionary * dict = [XYCommon removeNull:responseObject];
            [XYUserDefaults writeUserDefaultsSessionIdDict:dict];
        } failure:^{
            
        } UnusualFailure:^{
            
        }];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@",launchOptions);
    
//    [self getSessionId];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [WXApi registerApp:@"wx58c50219d3defad2"];
    //休眠
//    [NSThread sleepForTimeInterval:2.0];
    
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [UIApplication sharedApplication].statusBarStyle = UIBarStyleBlack;
    
    [self initKeyboardManager];
    
    [self initUMENG];
    
    [self initGAODE];
    
//    [self CheckAndUpgradeVersion];
    // 设置窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //截屏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];

    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    if ([YWDTools isNil:userModel.ClientId]) {
        //未登录
        self.window.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil]];
    }else{
        //已登录
        [JSExtension shared].myClientId = userModel.ClientId;
        self.window.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
    }
    
    
    [self initJpushWithOptions:launchOptions];

    [self netWorkReachAbility];
//    [self eliminate];

    return [PDRCore initEngineWihtOptions:launchOptions withRunMode:PDRCoreRunModeAppClient];
}

#pragma mark - 初始化融云SDK
-(void)IMInit{

    //请使用您之前从融云开发者控制台注册得到的 App Key，通过RCIM的单例，传入 initWithAppKey: 方法，初始化 SDK。
    [[RCIM sharedRCIM] initWithAppKey:RongAppKey];
    //    [[RCIMClient sharedRCIMClient] initWithAppKey:RongAppKey];
    [RCIM sharedRCIM].enableMessageAttachUserInfo = YES;
    /*
     将您在上一步获取到的 Token，通过 RCIMClient 的单例，传入 -connectWithToken:success:error:tokenIncorrect: 方法，即可建立与服务器的连接。

     在 App 整个生命周期，您只需要调用一次此方法与融云服务器建立连接。之后无论是网络出现异常或者 App 有前后台的切换等，SDK 都会负责自动重连。 SDK 针对 iOS 的前后台和各种网络状况，进行了连接和重连机制的优化，建议您调用一次 connectWithToken 即可，其余交给 SDK 处理。 除非您已经手动将连接断开，否则您不需要自己再手动重连。
     */
    DYJXIdentitySwitchingCreatorModel *userModel = [XYUserDefaults readLoginedInfoRongTokenModel];
    [[RCIMClient sharedRCIMClient] disconnect];
    [[RCIMClient sharedRCIMClient] connectWithToken:userModel.RongCloudToken
                                            success:^(NSString *userId) {
                                                NSLog(@"登陆成功。当前登录的用户ID：%@", userId);

                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [[RCIM sharedRCIM] setUserInfoDataSource:self];
                                                });

                                            } error:^(RCConnectErrorCode status) {
                                                NSLog(@"登陆的错误码为:%ld", status);
                                            } tokenIncorrect:^{
                                                //token过期或者不正确。
                                                //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                                                //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                                                NSLog(@"token错误");
                                            }];


    //用户信息提供者
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    //群组信息提供者
    [[RCIM sharedRCIM] setGroupInfoDataSource:self];
    //群名片信息提供者
    [[RCIM sharedRCIM] setGroupUserInfoDataSource:self];
    //IMKit连接状态的监听器
    //    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    //IMKit消息接收的监听器
    [[RCIM sharedRCIM] setReceiveMessageDelegate:self];
    //是否关闭本地通知，默认是打开的
    [[RCIM sharedRCIM] setDisableMessageNotificaiton:NO];
    //设置Log级别，开发阶段打印详细logsetReceiveMessageDelegate
    //    [RCIMClient sharedRCIMClient].logLevel = RC_Log_Level_Error;

}

#pragma mark - 更新BadgeNumber
-(void)updataBadgeNumber{
    int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                         @(ConversationType_PRIVATE),
                                                                         @(ConversationType_DISCUSSION),
                                                                         @(ConversationType_APPSERVICE),
                                                                         @(ConversationType_PUBLICSERVICE),
                                                                         @(ConversationType_GROUP)
                                                                         ]];

    NSString * unreadNum = [NSString stringWithFormat:@"%d",unreadMsgCount];
    NSDictionary * dict = @{@"unreadNum":unreadNum};

    [[NSNotificationCenter defaultCenter] postNotificationName:@"MessageUnreadNum" object:nil userInfo:dict];

    float version = [[[UIDevice currentDevice] systemVersion] floatValue];

    if (version >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    UIApplication *app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = unreadMsgCount;
}

#pragma mark - 用户信息提供者、群组信息提供者、群名片信息提供者
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion{
    RCUserInfo *userInfo = [[RCUserInfo alloc]initWithUserId:userId name:userId portrait:nil];
    return completion(userInfo);
}

- (void)getGroupInfoWithGroupId:(NSString *)groupId
                     completion:(void (^)(RCGroup *groupInfo))completion{

    RCGroup *grounpInfo = [[RCGroup alloc]initWithGroupId:groupId groupName:groupId portraitUri:nil];
    return completion(grounpInfo);

}

- (void)getUserInfoWithUserId:(NSString *)userId
                      inGroup:(NSString *)groupId
                   completion:(void (^)(RCUserInfo *userInfo))completion{

    RCUserInfo *userInfo = [[RCUserInfo alloc]initWithUserId:userId name:userId portrait:nil];
    return completion(userInfo);
}
#pragma mark - 消息接收监听器
- (void)onRCIMReceiveMessage:(RCMessage *)message
                        left:(int)left{
    NSLog(@"onRCIMReceiveMessage %@",message.content.mentionedInfo);
}

-(BOOL)onRCIMCustomLocalNotification:(RCMessage*)message
                      withSenderName:(NSString *)senderName{
    return NO;
}
-(BOOL)onRCIMCustomAlertSound:(RCMessage *)message{
    return NO;
}


-(void)eliminate{
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    
    //// Date from
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    //// Execute
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
        // Done
        
    }];

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"after 5s");
            NSString *str=[[NSUserDefaults standardUserDefaults]objectForKey:@"wx"];
            if (str!=nil&&[str isEqualToString:@"1"]) {
                NSLog(@"---");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playWX" object:nil userInfo:nil];
            }else if(str!=nil&&[str isEqualToString:@"4"]){
                
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"playAlbb" object:nil userInfo:nil];
            }else if(str!=nil&&[str isEqualToString:@"7"]){
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playUNC" object:nil userInfo:nil];
            }
        });
    
    
    
    [application setApplicationIconBadgeNumber:0];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
   [PDRCore destoryEngine];
}

/** 获取 deviceToken */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
    [JPUSHService registerDeviceToken:deviceToken];
}
/** 获取 deviceToken 失败 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);
    
//    if ([[UIDevice currentDevice].systemVersion floatValue]<10.0 || application.applicationState>0) {
//        [rootViewController addNotificationCount];
//    }
    
    completionHandler(UIBackgroundFetchResultNewData);
}


#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    XYLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);
//        [rootViewController addNotificationCount];
        
    }
//    else {
//        // 判断为本地通知
//        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
//    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
//    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
//    UNNotificationContent *content = request.content; // 收到推送的消息内容
//    
//    NSNumber *badge = content.badge;  // 推送消息的角标
//    NSString *body = content.body;    // 推送消息体
//    UNNotificationSound *sound = content.sound;  // 推送消息的声音
//    NSString *subtitle = content.subtitle;  // 推送消息的副标题
//    NSString *title = content.title;  // 推送消息的标题
    
    XYLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_notice object:userInfo];
        });
//        NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
//        [rootViewController addNotificationCount];
        
    }
//    else {
//        // 判断为本地通知
//        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
//    }
    
    completionHandler();  // 系统要求执行这个方法
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListWithData:tempData
                                              options:NSPropertyListImmutable
                                               format:NULL
                                                error:NULL];
    return str;
}

#pragma mark - 初始化
/** 全局 键盘控制 */
- (void)initKeyboardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldResignOnTouchOutside = YES;
    manager.enableAutoToolbar = YES;
    manager.enable = YES;
}

/** 初始化 友盟 */
- (void)initUMENG
{
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMENG_KEY];
    
    /*
     设置微信的appKey和appSecret
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx58c50219d3defad2" appSecret:@"d04f54816e67c002c2b262adc5193fb1" redirectURL:nil];
    
    /*
     * 移除相应平台的分享，如微信收藏
     */
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    //[QQ/QZone平台集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_3
    
    
    /** 友盟 统计 */
    UMConfigInstance.appKey = UMENG_KEY;
    UMConfigInstance.channelId = @"App Store";
    UMConfigInstance.ePolicy = BATCH;
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

/** 初始化 极光推送 */
- (void)initJpushWithOptions:(NSDictionary *)launchOptions
{
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:launchOptions appKey:JPUSH_KEY
                          channel:@""
                 apsForProduction:NO];
    
    if (launchOptions) {
        NSDictionary * remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        //这个判断是在程序没有运行的情况下收到通知，点击通知跳转页面
        if (remoteNotification) {
            XYLog(@"推送消息==== %@",remoteNotification);
//            [self goToMssageViewControllerWith:remoteNotification];
            
            NSDictionary * extras = [XYCommon dataFromJsonString:[self logDic:remoteNotification]];
            XYLog(@"   remoteNotification  %@",[self logDic:remoteNotification]);
            if (extras.count == 0) {
                return;
            }
            
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_notice object:extras];
            });
        }
    }
}
/** 初始化 高德地图 */
- (void)initGAODE
{
     [AMapServices sharedServices].apiKey = GAODE_KEY;
//    [AMapSearchServices sharedServices].apiKey = GAODE_KEY;
}

#pragma mark - 支付跳转
//#define __IPHONE_10_0    100000
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    NSLog(@"Calling Application Bundle ID: %@", url);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
   if ([url.query containsString:@"type="]) {
//       &&[url.query containsString:@"product_id="]&&[url.query containsString:@"merchant="]&&[url.query containsString:@"cityId="]
        if (url.query.length>0) {
            NSString *str3 = [url.query stringByReplacingOccurrencesOfString:@"&" withString:@"\",\""];
            NSString *str31 = [str3 stringByReplacingOccurrencesOfString:@"=" withString:@"\":\""];
            NSString *str33=[NSString stringWithFormat:@"{\"%@\"}",str31];
            NSLog(@"%@",str33);
            _pushJumpDic=[str33 parseJSONStringToNSDictionary];
            _pushJumpStr = url.query;
            NSLog(@"%@",_pushJumpDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"pushJump" object:nil userInfo:_pushJumpDic];
//            商详
            
        }
    }else if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
          
            [[NSNotificationCenter defaultCenter] postNotificationName:@"play" object:nil userInfo:resultDic];
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }else if([url.query containsString:@"returnKey="]){
        [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
            //        code=code.length==0?@"":code;
            
            
            if([code isEqualToString:@"success"]) {
                NSDictionary *dic=@{@"code":code};
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playUN" object:nil userInfo:dic];
                //如果想对结果数据验签，可使用下面这段代码，但建议不验签，直接去商户后台查询交易结果
                if(data != nil){
                    //数据从NSDictionary转换为NSString
                    NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                                       options:0
                                                                         error:nil];
                    NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
                    
                    //此处的verify建议送去商户后台做验签，如要放在手机端验，则代码必须支持更新证书
                    //                if([self verify:sign]) {
                    //                    //验签成功
                    //                }
                    //                else {
                    //                    //验签失败
                    //                }
                }
                
                //结果code为成功时，去商户后台查询一下确保交易是成功的再展示成功
            }
            else if([code isEqualToString:@"fail"]) {
                //交易失败
                NSDictionary *dic=@{@"code":code};
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playUN" object:nil userInfo:dic];
            }
            else if([code isEqualToString:@"cancel"]) {
                //交易取消
                NSDictionary *dic=@{@"code":code};
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playUN" object:nil userInfo:dic];
            }
        }];
    }
    
    
    
    
    
    
    
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响。
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return  [WXApi handleOpenURL:url delegate:[XYPay shareXYPay]];
}

#endif

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"play" object:nil userInfo:resultDic];
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }else{
        //    银联支付
        [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
            
            if([code isEqualToString:@"success"]) {
                
                //如果想对结果数据验签，可使用下面这段代码，但建议不验签，直接去商户后台查询交易结果
                if(data != nil){
                    //数据从NSDictionary转换为NSString
                    NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                                       options:0
                                                                         error:nil];
                    NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"playUN" object:nil userInfo:[sign parseJSONStringToNSDictionary]];
                    //此处的verify建议送去商户后台做验签，如要放在手机端验，则代码必须支持更新证书
                    //                if([self verify:sign]) {
                    //                    //验签成功
                    //                }
                    //                else {
                    //                    //验签失败
                    //                }
                }
                
                //结果code为成功时，去商户后台查询一下确保交易是成功的再展示成功
            }
            else if([code isEqualToString:@"fail"]) {
                //交易失败
            }
            else if([code isEqualToString:@"cancel"]) {
                //交易取消
            }
        }];
    }
    
    

    
    
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return [WXApi handleOpenURL:url delegate:[XYPay shareXYPay]];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    
    NSString *str = [url absoluteString];
    [YDBAlertView showToast:str];
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

#pragma mark - 网络状态监测
-(void)netWorkReachAbility{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
//    [self dealWithNetworkReachAblityStatus:[[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus]];
//
    WeakSelf;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      
        [weakSelf dealWithNetworkReachAblityStatus:status];
        
    }];
    
}

-(void)dealWithNetworkReachAblityStatus:(AFNetworkReachabilityStatus )status{
    switch (status) {
        case AFNetworkReachabilityStatusUnknown:
            break;
        case AFNetworkReachabilityStatusNotReachable:
//            [[NSNotificationCenter defaultCenter] postNotificationName:XY_Network_Status_NotReachable object:nil];
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"当前无网络" dismissTimeInterval:1.0];
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
        case AFNetworkReachabilityStatusReachableViaWWAN:
            break;
    }
    

}

//截屏
- (void)screenShot
{
    //每次截屏之前，删除之间添加的存放图片的imageView，不然重复截屏会不断的截取到之前的页面
    [self.photoIV removeFromSuperview];
    self.photoIV = nil;
    
    //截屏, 获取所截图片（imageWithScreenshot在后面实现）
    UIImage *image = [YWDTools imageWithScreenshot];
    
    //添加显示
    UIImageView *photoIV = [[UIImageView alloc]initWithImage:image];
    self.photoIV = photoIV;
    self.tempPhotoIV = photoIV;
    photoIV.frame = CGRectMake(40, 50, [UIScreen mainScreen].bounds.size.width-80, [UIScreen mainScreen].bounds.size.height-250);
    
    /*为imageView添加边框和阴影，以突出显示*/
    //给imageView添加边框
    CALayer * layer = [photoIV layer];
    layer.borderColor = [[UIColor whiteColor] CGColor];
    layer.borderWidth = 5.0f;
    
    //添加四个边阴影
    photoIV.layer.shadowColor = [UIColor blackColor].CGColor;
    photoIV.layer.shadowOffset = CGSizeMake(0, 0);
    photoIV.layer.shadowOpacity = 0.5;
    photoIV.layer.shadowRadius = 10.0;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:photoIV];
    //调用显示分享的页面
    [self share];

}


- (void)share
{
    WeakSelf;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForPortraitAndBottom = 2;
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        [JXShareManager getShotScreenInfoFromSeveiceSuccess:^(JXShareModel *model) {
            weakSelf.shareURL = model.shares[0].shareUrl;
            // 根据platformType调用相关平台进行分享
            [weakSelf shareImageToPlatformType:platformType];

        } fail:^{
            
        }];
        
        
//        //分享成功之后移除imageView
//        [self.photoIV removeFromSuperview];
//        self.photoIV = nil;
        
    }];
    //设置ShareMenuView的代理，实现点击取消分享的时候移除imageView
    [UMSocialUIManager setShareMenuViewDelegate:self];
}

- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //设置分享的图片
    self.shareImageView.shotScreenImage.image = self.tempPhotoIV.image;
    self.shareImageView.QRCodeImageView.image = [YWDTools createNonInterpolatedUIImageFormCIImage:[YWDTools createQRForString:self.shareURL] withSize:400];
    shareObject.shareImage = [YWDTools imageFromView:self.shareImageView];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
   
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self.window.viewController completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
        [self.photoIV removeFromSuperview];
        self.photoIV = nil;
    }];
}
//ShareMenuViewDelegate
- (void)UMSocialShareMenuViewDidDisappear
{
    [self.photoIV removeFromSuperview];
    self.photoIV = nil;
}

- (JXShareImageView *)shareImageView{
    if (!_shareImageView) {
        _shareImageView = [[JXShareImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight + 132)];
    }
    return _shareImageView;
}

- (void)CheckAndUpgradeVersion{
    /**获取程序的版本号*/
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSMutableDictionary *requestDic = [NSMutableDictionary dictionary];
    
//    requestDic[@"App_ID"] = App_ID;// 程序的apple ID号
    requestDic[@"appType"] = @"1";
    requestDic[@"os"] = @"ios";
    requestDic[@"appCode"] = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_infrastructureCheckUpdate request_data:requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                [XYProgressHUD svHUDDismiss];

                UpdateVersionModel *model = [UpdateVersionModel modelWithJSON: [responseObject objectForKey:RETURN_DATA]];
                if ([model.update isEqualToString:@"0"]) {
                    return ;
                }else{
                    JXVersionUpdateView *versionUpdateView = [[NSBundle mainBundle] loadNibNamed:@"JXVersionUpdateView"owner:self options:nil].lastObject;
                    versionUpdateView.versionLb.text = [NSString stringWithFormat:@"是否升级到新版本%@版",model.version];
                    versionUpdateView.targetSizeLb.text = [NSString stringWithFormat:@"新版本大小：%@M",model.target_size];
                    versionUpdateView.updateLogLb.text = model.update_log;
                    
                    if ([model.constraint isEqualToString:@"0"]) {
                        versionUpdateView.CloseBTN.hidden = NO;
                    }else{
                        versionUpdateView.CloseBTN.hidden = YES;
                    }
                    [YWDPopupControl popupView:versionUpdateView];
                   
                }
                
                

                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                //                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
            //            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        //        block(nil,error);
    }];
}

@end
