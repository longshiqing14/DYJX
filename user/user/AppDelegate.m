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
#import "XYPay.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "UPPaymentControl.h"
//#import "RSA.h"
#import <CommonCrypto/CommonDigest.h>
#import "XYUserDefaults.h"
#import "NSString+Tool.h"
#import <WebKit/WebKit.h>
#import "NaviViewController.h"
#import "XYLanuchGuideVideoVC.h"
#import "XYLanuchGuideVC.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#import "NetWorkTool.h"
//版本更新
#import "JXVersionUpdateView.h"
#import "UpdateVersionModel.h"
#import "DYJXIdentitySwitchingPage.h"
#import "JSExtension.h"
#import "SimpleMessage.h"
#import "IMSDK.h"
#import <QMapKit/QMapKit.h>
#import <QMapSearchKit/QMapSearchKit.h>
#import <WXApi.h>

// 账号密码： 18778399213 123456
// 账号密码： 13750820441 654321
//达意简讯
//###########################################
#import "DYJXLoginPage.h"

#import <RongIMKit/RongIMKit.h>
#define RongAppKey @"qf3d5gbjqwflh"
#define NIMSDKAppKey @"8fc95f505b6cbaedf613677c8e08fc0b"

#endif

@interface AppDelegate ()<JPUSHRegisterDelegate,RCIMUserInfoDataSource,RCIMGroupInfoDataSource,RCIMGroupUserInfoDataSource,RCIMReceiveMessageDelegate,RCIMConnectionStatusDelegate,WXApiDelegate>

@property (nonatomic, strong) UIImageView *photoIV;
@property (nonatomic, copy) NSString *shareURL;
@property (nonatomic, strong) UIImageView *tempPhotoIV;
@end

static NSString *const FIRSTLANUCH = @"FIRSTLANUCH";
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@",launchOptions);

    // 微信分享
    [WXApi registerApp:@"wxa821f07ab127f88a"];

    // 为了用音频
    [[NIMSDK sharedSDK] registerWithAppID:NIMSDKAppKey cerName:nil];
    ChatManager *chatManagert = [IMSDK sharedManager].chatManager; // 监听

    [QMapServices sharedServices].apiKey = TencentKey;
    [[QMSSearchServices sharedServices] setApiKey:TencentKey];
    
//    [self getSessionId];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
//    [WXApi registerApp:@"wx58c50219d3defad2"];
    [[RCIMClient sharedRCIMClient] registerMessageType:SimpleMessage.class];
    //设置会话列表头像和会话页面头像
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(46, 46);
    //开启用户信息和群组信息的持久化
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;
    //设置用户信息源和群组信息源
//    [RCIM sharedRCIM].userInfoDataSource = RCDDataSource;
//    [RCIM sharedRCIM].groupInfoDataSource = RCDDataSource;
    //设置接收消息代理
    [RCIM sharedRCIM].receiveMessageDelegate = self;
    //开启输入状态监听
    [RCIM sharedRCIM].enableTypingStatus = YES;
    //开启发送已读回执
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList =
    @[ @(ConversationType_PRIVATE), @(ConversationType_DISCUSSION), @(ConversationType_GROUP) ];
    //开启多端未读状态同步
    [RCIM sharedRCIM].enableSyncReadStatus = YES;
    //设置显示未注册的消息
    //如：新版本增加了某种自定义消息，但是老版本不能识别，开发者可以在旧版本中预先自定义这种未识别的消息的显示
    [RCIM sharedRCIM].showUnkownMessage = YES;
    [RCIM sharedRCIM].showUnkownMessageNotificaiton = YES;
    //群成员数据源
//    [RCIM sharedRCIM].groupMemberDataSource = RCDDataSource;
    //开启消息@功能（只支持群聊和讨论组, App需要实现群成员数据源groupMemberDataSource）
    [RCIM sharedRCIM].enableMessageMentioned = YES;
    //开启消息撤回功能
    [RCIM sharedRCIM].enableMessageRecall = YES;
    //设置Log级别，开发阶段打印详细log
    [RCIMClient sharedRCIMClient].logLevel = RC_Log_Level_Info;
    
    [[RCIMClient sharedRCIMClient] setReconnectKickEnable:YES];
    [UIApplication sharedApplication].statusBarStyle = UIBarStyleBlack;

    /**
     * 推送处理1
     */
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //注册推送, 用于iOS8以及iOS8之后的系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)
                                                categories:nil];
        [application registerUserNotificationSettings:settings];
    } else {
        //注册推送，用于iOS8之前的系统
        UIRemoteNotificationType myTypes =
        UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        [application registerForRemoteNotificationTypes:myTypes];
    }
    /**
     * 统计推送打开率1
     */
    [[RCIMClient sharedRCIMClient] recordLaunchOptionsEvent:launchOptions];
    /**
     * 获取融云推送服务扩展字段1
     */
    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient] getPushExtraFromLaunchOptions:launchOptions];
    if (pushServiceData) {
        NSLog(@"该启动事件包含来自融云的推送服务");
        for (id key in [pushServiceData allKeys]) {
            NSLog(@"%@", pushServiceData[key]);
        }
    } else {
        NSLog(@"该启动事件不包含来自融云的推送服务");
    }
    
    [self initKeyboardManager];
    
    [self initUMENG];
    
//    [self initGAODE];
    
//    [self CheckAndUpgradeVersion];
    // 设置窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //截屏通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];

    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    if ([YWDTools isNil:userModel.ClientId]) {
        //未登录
        self.window.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil]];
    }else{
        //已登录
        [JSExtension shared].myClientId = userModel.ClientId;
        self.window.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.rootViewController = self.window.rootViewController;
    }
    
    
    [self initJpushWithOptions:launchOptions];

    [self netWorkReachAbility];
//    [self eliminate];

    [self initIm];

    return [PDRCore initEngineWihtOptions:launchOptions withRunMode:PDRCoreRunModeAppClient];
}

-(void)initIm {
    [XYNetWorking XYPOST:@"RongCloudAPPKey" params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {

            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                NSString *result = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"Result"]];
                NSArray *appKeys = [result componentsSeparatedByString:@","];
                NSString *appkey = [NSString stringWithFormat:@"%@", appKeys.firstObject];
                if (appkey.length) {
                    [[RCIM sharedRCIM] initWithAppKey:appkey];
                }
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

#pragma mark - 初始化融云SDK
-(void)IMInit{

    //请使用您之前从融云开发者控制台注册得到的 App Key，通过RCIM的单例，传入 initWithAppKey: 方法，初始化 SDK。
//    [[RCIM sharedRCIM] initWithAppKey:RongAppKey];
    //    [[RCIMClient sharedRCIMClient] initWithAppKey:RongAppKey];
    [RCIM sharedRCIM].enableMessageAttachUserInfo = YES;
    /*
     将您在上一步获取到的 Token，通过 RCIMClient 的单例，传入 -connectWithToken:success:error:tokenIncorrect: 方法，即可建立与服务器的连接。

     在 App 整个生命周期，您只需要调用一次此方法与融云服务器建立连接。之后无论是网络出现异常或者 App 有前后台的切换等，SDK 都会负责自动重连。 SDK 针对 iOS 的前后台和各种网络状况，进行了连接和重连机制的优化，建议您调用一次 connectWithToken 即可，其余交给 SDK 处理。 除非您已经手动将连接断开，否则您不需要自己再手动重连。
     */
    [[RCIMClient sharedRCIMClient] connectWithToken:[UserManager shared].getUserModel.Result.RongCloudToken
                                            success:^(NSString *userId) {
                                                NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
                                                [self updataBadgeNumber];
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

//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//
//    return [WXApi handleOpenURL:url delegate:self];
//}
//
//-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//
//    return [WXApi handleOpenURL:url delegate:self];
//}

-(void) onResp:(BaseResp*)resp {
    if (!resp.errStr.length) {
        [self.window.rootViewController.view makeToast:@"分享成功"];
    }
    else {
        [self.window.rootViewController.view makeToast:@"分享失败"];
    }
}

/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}

/**
 * 推送处理3
 */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""]
                        stringByReplacingOccurrencesOfString:@">"
                        withString:@""] stringByReplacingOccurrencesOfString:@" "
                       withString:@""];

    [JPUSHService registerDeviceToken:deviceToken];
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
#if TARGET_IPHONE_SIMULATOR
    // 模拟器不能使用远程推送
#else
    // 请检查App的APNs的权限设置，更多内容可以参考文档
    // http://www.rongcloud.cn/docs/ios_push.html。
    NSLog(@"获取DeviceToken失败！！！");
    NSLog(@"ERROR：%@", error);
#endif
}

/**
 * 推送处理4
 * userInfo内容请参考官网文档
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    /**
     * 统计推送打开率2
     */
    [[RCIMClient sharedRCIMClient] recordRemoteNotificationEvent:userInfo];
    /**
     * 获取融云推送服务扩展字段2
     */
    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient] getPushExtraFromRemoteNotification:userInfo];
    if (pushServiceData) {
        NSLog(@"该远程推送包含来自融云的推送服务");
        for (id key in [pushServiceData allKeys]) {
            NSLog(@"key = %@, value = %@", key, pushServiceData[key]);
        }
    } else {
        NSLog(@"该远程推送不包含来自融云的推送服务");
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    /**
     * 统计推送打开率3
     */
    [[RCIMClient sharedRCIMClient] recordLocalNotificationEvent:notification];

    //  //震动
    //  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    //  AudioServicesPlaySystemSound(1007);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down
    // OpenGL ES frame rates. Games should use this method to pause the game.
    RCConnectionStatus status = [[RCIMClient sharedRCIMClient] getConnectionStatus];
    if (status != ConnectionStatus_SignUp) {
//        int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
//                                                                             @(ConversationType_PRIVATE), @(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE),
//                                                                             @(ConversationType_PUBLICSERVICE), @(ConversationType_GROUP)
//                                                                             ]];
//        application.applicationIconBadgeNumber = unreadMsgCount;
    }
}


- (BOOL)onRCIMCustomLocalNotification:(RCMessage *)message withSenderName:(NSString *)senderName {
    //群组通知不弹本地通知
    if ([message.content isKindOfClass:[RCGroupNotificationMessage class]]) {
        return YES;
    }
    if ([[message.content.class getObjectName] isEqualToString:@"RCJrmf:RpOpendMsg"]) {
        return YES;
    }
    return NO;
}

#pragma mark - 消息接收监听器
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    [self updataBadgeNumber];
//    NSNumber *left = [notification.userInfo objectForKey:@"left"];
//    if ([RCIMClient sharedRCIMClient].sdkRunningMode == RCSDKRunningMode_Background && 0 == left.integerValue) {
//        int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
//                                                                             @(ConversationType_PRIVATE), @(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE),
//                                                                             @(ConversationType_PUBLICSERVICE), @(ConversationType_GROUP)
//                                                                             ]];
//        dispatch_async(dispatch_get_main_queue(),^{
//            [UIApplication sharedApplication].applicationIconBadgeNumber = unreadMsgCount;
//        });
//    }
}

- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    [self updataBadgeNumber];
//    if ([message.content isMemberOfClass:[RCInformationNotificationMessage class]]) {
//        RCInformationNotificationMessage *msg = (RCInformationNotificationMessage *)message.content;
//        // NSString *str = [NSString stringWithFormat:@"%@",msg.message];
//        if ([msg.message rangeOfString:@"你已添加了"].location != NSNotFound) {
//            [RCDDataSource syncFriendList:[RCIM sharedRCIM].currentUserInfo.userId
//                                 complete:^(NSMutableArray *friends){
//                                 }];
//        }
//    } else if ([message.content isMemberOfClass:[RCContactNotificationMessage class]]) {
//        RCContactNotificationMessage *msg = (RCContactNotificationMessage *)message.content;
//        if ([msg.operation isEqualToString:ContactNotificationMessage_ContactOperationAcceptResponse]) {
//            [RCDDataSource syncFriendList:[RCIM sharedRCIM].currentUserInfo.userId
//                                 complete:^(NSMutableArray *friends){
//                                 }];
//        }
//    } else if ([message.content isMemberOfClass:[RCGroupNotificationMessage class]]) {
//        RCGroupNotificationMessage *msg = (RCGroupNotificationMessage *)message.content;
//        if ([msg.operation isEqualToString:@"Dismiss"] &&
//            [msg.operatorUserId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
//            [[RCIMClient sharedRCIMClient]clearRemoteHistoryMessages:ConversationType_GROUP
//                                                            targetId:message.targetId
//                                                          recordTime:message.sentTime
//                                                             success:^{
//                                                                 [[RCIMClient sharedRCIMClient] clearMessages:ConversationType_GROUP targetId:message.targetId];
//                                                             }
//                                                               error:nil
//             ];
//            [[RCIMClient sharedRCIMClient] removeConversation:ConversationType_GROUP targetId:message.targetId];
//        } else if ([msg.operation isEqualToString:@"Quit"] || [msg.operation isEqualToString:@"Add"] ||
//                   [msg.operation isEqualToString:@"Kicked"] || [msg.operation isEqualToString:@"Rename"]) {
//            if (![msg.operation isEqualToString:@"Rename"]) {
//                [RCDHTTPTOOL getGroupMembersWithGroupId:message.targetId
//                                                  Block:^(NSMutableArray *result) {
//                                                      [[RCDataBaseManager shareInstance]
//                                                       insertGroupMemberToDB:result
//                                                       groupId:message.targetId
//                                                       complete:^(BOOL results){
//
//                                                       }];
//                                                  }];
//            }
//            [RCDHTTPTOOL getGroupByID:message.targetId
//                    successCompletion:^(RCDGroupInfo *group) {
//                        [[RCDataBaseManager shareInstance] insertGroupToDB:group];
//                        [[RCIM sharedRCIM] refreshGroupInfoCache:group withGroupId:group.groupId];
//                        [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdeteGroupInfo"
//                                                                            object:message.targetId];
//                    }];
//        }
//    }
}

- (BOOL)onRCIMCustomAlertSound:(RCMessage *)message {
    //当应用处于前台运行，收到消息不会有提示音。
    //  if ([message.content isMemberOfClass:[RCGroupNotificationMessage class]]) {
    return YES;
    //  }
    //  return NO;
}

#pragma mark - RCIMConnectionStatusDelegate

/**
 *  网络状态变化。
 *
 *  @param status 网络状态。
 */
- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您的帐号在别的设备上登录，"
                              @"您被迫下线！"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else if (status == ConnectionStatus_TOKEN_INCORRECT) {
        [[RCIMClient sharedRCIMClient] connectWithToken:[UserManager shared].getUserModel.Result.RongCloudToken
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
    } else if (status == ConnectionStatus_DISCONN_EXCEPTION) {
        [[RCIMClient sharedRCIMClient] disconnect];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您的帐号被封禁"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - 更新BadgeNumber
-(void)updataBadgeNumber{
//    int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
//                                                                         @(ConversationType_PRIVATE),
//                                                                         @(ConversationType_DISCUSSION),
//                                                                         @(ConversationType_APPSERVICE),
//                                                                         @(ConversationType_PUBLICSERVICE),
//                                                                         @(ConversationType_GROUP)
//                                                                         ]];
//
//    NSString * unreadNum = [NSString stringWithFormat:@"%d",unreadMsgCount];
//    NSDictionary * dict = @{@"unreadNum":unreadNum};
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"MessageUnreadNum" object:nil userInfo:dict];
//
//    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
//
//    if (version >= 8.0) {
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    }

    dispatch_async(dispatch_get_main_queue(), ^{
        UIApplication *app = [UIApplication sharedApplication];
        if ([[DataBaseManager shared] allUnreadCount] > 99) {
            app.applicationIconBadgeNumber = 99;
        }
        else {
            app.applicationIconBadgeNumber = [[DataBaseManager shared] allUnreadCount];
        }
    });
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


-(void)eliminate{
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    
    //// Date from
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    //// Execute
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
        // Done
        
    }];

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
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
   [PDRCore destoryEngine];
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
    return [WXApi handleOpenURL:url delegate:self];
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
    return [WXApi handleOpenURL:url delegate:self];

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
    return [WXApi handleOpenURL:url delegate:self];
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


@end
