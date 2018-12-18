//
//  BaseListViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseListViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DYChatViewController.h"
#import "JXChatViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <RongIMKit/RongIMKit.h>
#import "AppDelegate.h"
#import "NaviViewController.h"
#import "DYJXIdentitySwitchingPage.h"
#import "DYJXLatestListCell.h"

@interface BaseListViewController()<RCIMReceiveMessageDelegate,UNUserNotificationCenterDelegate>


@end

@implementation BaseListViewController
- (void)viewDidLoad {
    //重写显示相关的接口，必须先调用super，否则会屏蔽SDK默认的处理
    [super viewDidLoad];

    [self initNavigation];

    self.isShowNetworkIndicatorView = false;
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];

    // 设置消息接收监听
    [[RCIM sharedRCIM] setReceiveMessageDelegate:self];

//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"ToUser1" style:UIBarButtonItemStylePlain target:self action:@selector(newChar)];
//
//    self.navigationItem.rightBarButtonItem = rightItem;
//
//
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"Service" style:UIBarButtonItemStylePlain target:self action:@selector(toService)];

//    self.navigationItem.leftBarButtonItem = leftItem;

    self.conversationListTableView.tableFooterView = [UIView new];
//    RCConversationModel *model = [[RCConversationModel alloc] init];
//    [self.conversationListDataSource addObject:model];
//    [self.conversationListTableView reloadData];

    if (([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.conversationListTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

-(DYJXInterface *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXInterface alloc] init];
    }
    return _viewModel;
}

- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];

    UIImage *image = [UIImage imageNamed:@"btn_home"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
}

- (void)black_controller{
    XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
}

//客服
//-(void)toService{
//    DYChatViewController *chatService = [[DYChatViewController alloc] init];
//
//    chatService.title = @"客服";
//    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
//    chatService.targetId = @"KEFU150269262853429";
//    [self.navigationController pushViewController :chatService animated:YES];
//}

- (RCConversationBaseCell *)rcConversationListTableView:(UITableView *)tableView
                                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCConversationBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"11"];
    if (!cell) {
        cell = [[DYJXLatestListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"11"];
    }
    return cell;
}

///*!
// 自定义会话Cell显示时的回调
//
// @param tableView       当前TabelView
// @param indexPath       该Cell对应的会话Cell数据模型在数据源中的索引值
// @return                自定义会话需要显示的Cell的高度
// */
- (CGFloat)rcConversationListTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

//新建聊天
-(void)newChar{
    //新建一个聊天会话View Controller对象,建议这样初始化
//    DYChatViewController *chat = [[DYChatViewController alloc] initWithConversationType:ConversationType_PRIVATE
//                                                     targetId:@"user001"];
//
//    //    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
//    //    chat.conversationType = ConversationType_PRIVATE;
//    //    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
//    //
//    //
//    //    //设置聊天会话界面要显示的标题
//    //    chat.title = @"user001";
//    //显示聊天会话界面
//    [self.navigationController pushViewController:chat animated:YES];

//    JXChatViewController *chatVC = [[JXChatViewController alloc] initWithSession:[NIMSession ]];
//    [self.navigationController pushViewControlle[NIMSession ]:chatVC animated:YES];
}

//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {

    DYChatViewController *conversationVC = [[DYChatViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.targetId;
    [self.navigationController pushViewController:conversationVC animated:YES];
}


- (void)onRCIMReceiveMessage:(RCMessage *)message
                        left:(int)left{
    [self updataBadgeNumber];
}

/*!
 接收消息的回调方法

 @param message     当前接收到的消息
 @param nLeft       还剩余的未接收的消息数，left>=0
 @param object      消息监听设置的key值

 @discussion 如果您设置了IMlib消息监听之后，SDK在接收到消息时候会执行此方法。
 其中，left为还剩余的、还未接收的消息数量。比如刚上线一口气收到多条消息时，通过此方法，您可以获取到每条消息，left会依次递减直到0。
 您可以根据left数量来优化您的App体验和性能，比如收到大量消息时等待left为0再刷新UI。
 object为您在设置消息接收监听时的key值。
 */
//- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
//
//    NSLog(@"%@",message.objectName);
//
//    [self updataBadgeNumber];
//
//
//    //自定义本地推送
//    NSString *body = nil;
//    if ([message.objectName isEqualToString:@"RC:TxtMsg"]) {
//        RCTextMessage * textMessage =  (RCTextMessage *)message.content;
//
//        body = textMessage.content;
//    }else if ([message.objectName isEqualToString:@"RC:VcMsg"]){
//        body = @"[语音]";
//    }else if ([message.objectName isEqualToString:@"RC:ImgMsg"]){
//        body = @"[图片]";
//    }else if ([message.objectName isEqualToString:@"RC:LBSMsg"]){
//        body = @"[位置]";
//    }
//    [self notif:message body:[NSString stringWithFormat:@"%@:%@",message.targetId,body]];
//
//    //震动
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    //通知刷新聊天页面
//    [[NSNotificationCenter defaultCenter] postNotificationName:message.targetId object:message];
//    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
//
//    if (nLeft == 0) {
//        //刷新页面
//        [self refreshConversationTableViewIfNeeded];
//    }
//}

#pragma mark - 更新BadgeNumber
-(void)updataBadgeNumber{
    AppDelegate *appD = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appD updataBadgeNumber];
}


#pragma mark - 本地推送
-(void)notif:(RCMessage *)message body:(NSString *)body{
    if ([UIApplication sharedApplication].applicationState==UIApplicationStateBackground) {
        if (XYSystemVersion>=10.0) {
            NSLog(@"IOS10本地推送");


            // 使用 UNUserNotificationCenter 来管理通知
            UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];

            //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
            UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
            content.title = [NSString localizedUserNotificationStringForKey:@"新消息" arguments:nil];
            content.body = [NSString localizedUserNotificationStringForKey:body
                                                                 arguments:nil];
            content.sound = [UNNotificationSound defaultSound];

            // 在 alertTime 后推送本地推送
            UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                          triggerWithTimeInterval:0.1 repeats:NO];

            UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:[NSString stringWithFormat:@"%ld",message.messageId]
                                                                                  content:content trigger:trigger];

            //添加推送成功后的处理！
            [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {

            }];

        }else{
            [[UIApplication sharedApplication] cancelAllLocalNotifications];

            UILocalNotification *alarm = [[UILocalNotification alloc] init];
            alarm.alertBody = body;
            alarm.soundName = @"alarm.wav";
            alarm.alertAction = @"确定";
            [[UIApplication sharedApplication] presentLocalNotificationNow:alarm];
        }
    }


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
