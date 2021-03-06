//
//  NIMSessionViewController.m
//  NIMKit
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "NIMSessionConfigurateProtocol.h"
#import "NIMKit.h"
#import "NIMMessageCellProtocol.h"
#import "NIMMessageModel.h"
#import "NIMKitUtil.h"
#import "NIMCustomLeftBarView.h"
#import "NIMBadgeView.h"
#import "UITableView+NIMScrollToBottom.h"
#import "NIMMessageMaker.h"
#import "UIView+NIM.h"
#import "NIMSessionConfigurator.h"
#import "NIMKitInfoFetchOption.h"
#import "NIMKitTitleView.h"
#import "NIMKitKeyboardInfo.h"
#import <AVFoundation/AVFoundation.h>
#import "JSExtension.h"
#import <WXApi.h>
#import "UIImage+fixOrientation.h"
#import "DYRotateSendViewController.h"
#import "ImageZoomView.h"
#import "DYLocationViewController.h"
#import "LocationInfoViewController.h"

@interface NIMSessionViewController ()<NIMMediaManagerDelegate,NIMInputDelegate>

@property (nonatomic,readwrite) RCIMMessage *messageForMenu;

@property (nonatomic,strong)    UILabel *titleLabel;

@property (nonatomic,strong)    UILabel *subTitleLabel;

@property (nonatomic,strong)    NSIndexPath *lastVisibleIndexPathBeforeRotation;

@property (nonatomic,strong)  NIMSessionConfigurator *configurator;

@property (nonatomic,weak)    id<NIMSessionInteractor> interactor;

@end

@implementation NIMSessionViewController

- (instancetype)initWithSession:(NIMSession *)session{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _session = session;
    }
    return self;
}

- (void)dealloc
{
    [self removeListener];
    [[NIMKit sharedKit].robotTemplateParser clean];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self setupNav];
    //消息 tableView
    [self setupTableView];
    //输入框 inputView
    [self setupInputView];
    //会话相关逻辑配置器安装
    [self setupConfigurator];
    //添加监听
    [self addListener];
    //进入会话时，标记所有消息已读，并发送已读回执
    [self markRead];
    //更新已读位置
    [self uiCheckReceipts:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:XY_IM_InsertModel object:nil];

}

-(void)refreshData {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tableView reloadData];
//    });
}


- (void)setupNav
{
    [self setUpTitleView];
//    NIMCustomLeftBarView *leftBarView = [[NIMCustomLeftBarView alloc] init];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarView];
//    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    if (@available(iOS 11.0, *)) {
//        leftBarView.translatesAutoresizingMaskIntoConstraints = NO;
    }
//    self.navigationItem.leftBarButtonItems = @[leftItem];
//    self.navigationItem.leftItemsSupplementBackButton = NO;
}

-(void)black_controller{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupTableView
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = NIMKit_UIColorFromRGB(0xe4e7ec);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if ([self.sessionConfig respondsToSelector:@selector(sessionBackgroundImage)] && [self.sessionConfig sessionBackgroundImage]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imgView.image = [self.sessionConfig sessionBackgroundImage];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.tableView.backgroundView = imgView;
    }
    [self.view addSubview:self.tableView];
}


- (void)setupInputView
{
    if ([self shouldShowInputView])
    {
        self.sessionInputView = [[NIMInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.nim_width,0) config:self.sessionConfig];
        self.sessionInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self.sessionInputView setSession:self.session];
        [self.sessionInputView setInputDelegate:self];
        [self.sessionInputView setInputActionDelegate:self];
        [self.sessionInputView refreshStatus:NIMInputStatusText];
        [self.view addSubview:_sessionInputView];
    }
}


- (void)setupConfigurator
{
    _configurator = [[NIMSessionConfigurator alloc] init];
    [_configurator setup:self];
    
    BOOL needProximityMonitor = [self needProximityMonitor];
    [[NIMSDK sharedSDK].mediaManager setNeedProximityMonitor:needProximityMonitor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.interactor onViewWillAppear];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.sessionInputView endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.interactor onViewDidDisappear];
}


- (void)viewDidLayoutSubviews
{
    [self changeLeftBarBadge:self.conversationManager.allUnreadCount];
    [self.interactor resetLayout];
}



#pragma mark - 消息收发接口
- (void)sendMessage:(RCIMMessage *)message
{
    [self.interactor sendMessage:message];
}


#pragma mark - Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [_sessionInputView endEditing:YES];
}


#pragma mark - NIMSessionConfiguratorDelegate

- (void)didFetchMessageData
{
    [self uiCheckReceipts:nil];
    [self.tableView reloadData];
    [self.tableView nim_scrollToBottom:NO];
}

- (void)didRefreshMessageData
{
    [self refreshSessionTitle:self.sessionTitle];
    [self refreshSessionSubTitle:self.sessionSubTitle];
    [self.tableView reloadData];
}

- (void)didPullUpMessageData {}

#pragma mark - 会话title
- (NSString *)sessionTitle
{
    NSString *title = @"";
    NIMSessionType type = self.session.sessionType;
    switch (type) {
        case NIMSessionTypeTeam:{
            NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
        }
            break;
        case NIMSessionTypeP2P:{
            title = [NIMKitUtil showNick:self.session.sessionId inSession:self.session];
        }
            break;
        default:
            break;
    }
    return title;
}

- (NSString *)sessionSubTitle{return @"";};

#pragma mark - NIMChatManagerDelegate
//开始发送
- (void)willSendMessage:(RCIMMessage *)message
{
    id<NIMSessionInteractor> interactor = self.interactor;
    
    if ([message.session isEqual:self.session]) {
        if ([interactor findMessageModel:message]) {
            [interactor updateMessage:message];
        }else{
            [interactor addMessages:@[message]];
        }
    }
}

//上传资源文件成功
- (void)uploadAttachmentSuccess:(NSString *)urlString
                     forMessage:(RCIMMessage *)message
{
    //如果需要使用富文本推送，可以在这里进行 message apns payload 的设置
}


//发送结果
- (void)sendMessage:(RCIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        [self.interactor updateMessage:message];
        if (message.session.sessionType == NIMSessionTypeTeam)
        {
            //如果是群的话需要检查一下回执显示情况
//            NIMMessageReceipt *receipt = [[NIMMessageReceipt alloc] initWithMessage:message];
//            [self.interactor checkReceipts:@[receipt]];
        }
    }    
}

//发送进度
-(void)sendMessage:(RCIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session]) {
        [self.interactor updateMessage:message];
    }
}

////接收消息
//- (void)onRecvMessages:(NSArray *)messages
//{
//    if ([self shouldAddListenerForNewMsg])
//    {
//        NIMMessage *message = messages.firstObject;
//        NIMSession *session = message.session;
//        if (![session isEqual:self.session] || !messages.count)
//        {
//            return;
//        }
//
//        [self uiAddMessages:messages];
//        [self.interactor markRead];
//    }
//}


- (void)fetchMessageAttachment:(RCIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session])
    {
        [self.interactor updateMessage:message];
    }
}

- (void)fetchMessageAttachment:(RCIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        NIMMessageModel *model = [self.interactor findMessageModel:message];
        //下完缩略图之后，因为比例有变化，重新刷下宽高。
        [model cleanCache];
        [self.interactor updateMessage:message];
    }
}

- (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    if ([self shouldAddListenerForNewMsg])
    {
        NSMutableArray *handledReceipts = [[NSMutableArray alloc] init];
        for (NIMMessageReceipt *receipt in receipts) {
            if ([receipt.session isEqual:self.session])
            {
                [handledReceipts addObject:receipt];
            }
        }
        if (handledReceipts.count)
        {
            [self uiCheckReceipts:handledReceipts];
        }
    }
}

#pragma mark - NIMConversationManagerDelegate
- (void)messagesDeletedInSession:(NIMSession *)session{
    [self.interactor resetMessages:nil];
    [self.tableView reloadData];
}

- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}


- (void)changeUnreadCount:(NIMRecentSession *)recentSession
         totalUnreadCount:(NSInteger)totalUnreadCount{
    if ([recentSession.session isEqual:self.session]) {
        return;
    }
    [self changeLeftBarBadge:totalUnreadCount];
}

#pragma mark - NIMMediaManagerDelegate
- (void)recordAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord error:nil];
    if (!filePath || error) {
        _sessionInputView.recording = NO;
        [self onRecordFailed:error];
    }
}

- (void)recordAudio:(NSString *)filePath didCompletedWithError:(NSError *)error {
    if(!error) {
        if ([self recordFileCanBeSend:filePath]) {
            RCIMMessage *message = [[IMSDK sharedManager].chatManager defaultSendMessage:3 sendObject:filePath];
            if ([message.content isKindOfClass:[RCVoiceMessage class]]) {
                RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
                textMessage.duration = self.currentTime;
            }
            [self sendMessage:message];
//            [self sendMessage:[NIMMessageMaker msgWithAudio:filePath]];
        }else{
            [self showRecordFileNotSendReason];
        }
    } else {
        [self onRecordFailed:error];
    }
    _sessionInputView.recording = NO;
}

- (void)recordAudioDidCancelled {
    _sessionInputView.recording = NO;
}

- (void)recordAudioProgress:(NSTimeInterval)currentTime {
    _currentTime = (int)currentTime;
    [_sessionInputView updateAudioRecordTime:currentTime];
}


- (void)recordAudioInterruptionBegin {
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

#pragma mark - 录音相关接口
- (void)onRecordFailed:(NSError *)error{
    NSLog(@"%@",error);
}

- (BOOL)recordFileCanBeSend:(NSString *)filepath
{
    return YES;
}

- (void)showRecordFileNotSendReason{
    NSLog(@"not send reason");
}

#pragma mark - NIMInputDelegate

- (void)didChangeInputHeight:(CGFloat)inputHeight
{
    [self.interactor changeLayout:inputHeight];
}

#pragma mark - NIMInputActionDelegate
- (BOOL)onTapMediaItem:(NIMMediaItem *)item{
    SEL sel = item.selctor;
    BOOL handled = sel && [self respondsToSelector:sel];
    if (handled) {
        NIMKit_SuppressPerformSelectorLeakWarning([self performSelector:sel withObject:item]);
        handled = YES;
    }
    return handled;
}

- (void)onTextChanged:(id)sender{
    NSLog(@"%@",sender);
}

//  点击发送的时候响应
- (void)onSendText:(NSString *)text atUsers:(NSArray *)atUsers
{
//    NSMutableArray *users = [NSMutableArray arrayWithArray:atUsers];
//    if (self.session.sessionType == NIMSessionTypeP2P)
//    {
//        [users addObject:self.session.sessionId];
//    }
//    NSString *robotsToSend = [self robotsToSend:users];
//
//    NIMMessage *message = nil;
//    if (robotsToSend.length)
//    {
//        message = [NIMMessageMaker msgWithRobotQuery:text toRobot:robotsToSend];
//    }
//    else
//    {
//        message = [NIMMessageMaker msgWithText:text];
//    }
//
//    if (atUsers.count)
//    {
//        NIMMessageApnsMemberOption *apnsOption = [[NIMMessageApnsMemberOption alloc] init];
//        apnsOption.userIds = atUsers;
//        apnsOption.forcePush = YES;
//
//        NIMKitInfoFetchOption *option = [[NIMKitInfoFetchOption alloc] init];
//        option.session = self.session;
//
//        NSString *me = [[NIMKit sharedKit].provider infoByUser:[NIMSDK sharedSDK].loginManager.currentAccount option:option].showName;
//        apnsOption.apnsContent = [NSString stringWithFormat:@"%@在群里@了你",me];
//        message.apnsMemberOption = apnsOption;
//    }
    RCIMMessage *message = [[IMSDK sharedManager].chatManager defaultSendMessage:0 sendObject:text];
    [self sendMessage:message];
}

- (NSString *)robotsToSend:(NSArray *)atUsers
{
    for (NSString *userId in atUsers)
    {
        if ([[NIMSDK sharedSDK].robotManager isValidRobot:userId])
        {
            return userId;
        }
    }
    return nil;
}


- (void)onSelectChartlet:(NSString *)chartletId
                 catalog:(NSString *)catalogId{
    NSLog(@"%@ %@",chartletId,catalogId);
}

- (void)onCancelRecording
{
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

- (void)onStopRecording
{
    [[NIMSDK sharedSDK].mediaManager stopRecord];
}

- (void)onStartRecording
{
    _sessionInputView.recording = YES;
    
    NIMAudioType type = [self recordAudioType];
    NSTimeInterval duration = [NIMKit sharedKit].config.recordMaxDuration;
    
    [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    
    [[NIMSDK sharedSDK].mediaManager record:type
                                     duration:duration];
}

#pragma mark - NIMMessageCellDelegate
- (BOOL)onTapCell:(NIMKitEvent *)event{
    BOOL handle = NO;
    RCIMMessage *message = event.messageModel.message;
    NSInteger messageType = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;
    NSString *eventName = event.eventName;
    if (messageType == 1) { // 图片
        UIImage *image = nil;
        if (message.image) {
            image = message.image;
        }

        if (!image) {
            image = [UIImage imageWithContentsOfFile:message.LocalPath];
        }

        if (!image) {
            image = [UIImage imageNamed:@"dyjx_default_img"];
        }

        //点击事件
        ImageZoomView *img=[[ImageZoomView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) andWithImage:[[UIImageView alloc] initWithImage:image]];
        //当前视图
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:img];

        handle = YES;
    }
    else if (messageType == 4) { // 图片
        LocationInfoViewController *vc = [[LocationInfoViewController alloc] init];
        if ([message.content isKindOfClass:[RCLocationMessage class]]) {
            RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
            vc.centerPoint.coordinate = CLLocationCoordinate2DMake(textMessage.location.latitude, textMessage.location.longitude);
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
        handle = YES;
    }
    else if (messageType == 5) { // 图片
        LocationInfoViewController *vc = [[LocationInfoViewController alloc] init];
        if ([message.content isKindOfClass:[RCLocationMessage class]]) {
            RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
            vc.centerPoint.coordinate = CLLocationCoordinate2DMake(textMessage.location.latitude, textMessage.location.longitude);
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
        handle = YES;
    }
    if ([eventName isEqualToString:NIMKitEventNameTapAudio])
    {
        [self.interactor mediaAudioPressed:event.messageModel];
        handle = YES;
    }
//    if ([eventName isEqualToString:NIMKitEventNameTapRobotBlock]) {
//        NSDictionary *param = event.data;
////        NIMMessage *message = [NIMMessageMaker msgWithRobotSelect:param[@"text"] target:param[@"target"] params:param[@"param"] toRobot:param[@"robotId"]];
////        [self sendMessage:message];
//        handle = YES;
//    }
//    if ([eventName isEqualToString:NIMKitEventNameTapRobotContinueSession]) {
////        NIMRobotObject *robotObject = (NIMRobotObject *)event.messageModel.message.messageObject;
////        NIMRobot *robot = [[NIMSDK sharedSDK].robotManager robotInfo:robotObject.robotId];
////        NSString *text = [NSString stringWithFormat:@"%@%@%@",NIMInputAtStartChar,robot.nickname,NIMInputAtEndChar];
////
////        NIMInputAtItem *item = [[NIMInputAtItem alloc] init];
////        item.uid  = robot.userId;
////        item.name = robot.nickname;
////        [self.sessionInputView.atCache addAtItem:item];
////
////        [self.sessionInputView.toolBar insertText:text];
//
//        handle = YES;
//    }
//
    return handle;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void)onRetryMessage:(RCIMMessage *)message
{
    if (message.messageDirection == MessageDirection_RECEIVE) {
//        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:message
//                                                           error:nil];
    }else{
//        [[[NIMSDK sharedSDK] chatManager] resendMessage:message
//                                                  error:nil];
    }
}

- (BOOL)onLongPressCell:(RCIMMessage *)message
                 inView:(UIView *)view
{
    BOOL handle = NO;
    NSArray *items = [self menusItems:message];
    if ([items count] && [self becomeFirstResponder]) {
        UIMenuController *controller = [UIMenuController sharedMenuController];
        controller.menuItems = items;
        _messageForMenu = message;
        [controller setTargetRect:view.bounds inView:view];
        [controller setMenuVisible:YES animated:YES];
        handle = YES;
    }
    return handle;
}

- (BOOL)disableAudioPlayedStatusIcon:(RCIMMessage *)message
{
    BOOL disable = NO;
    if ([self.sessionConfig respondsToSelector:@selector(disableAudioPlayedStatusIcon)])
    {
        disable = [self.sessionConfig disableAudioPlayedStatusIcon];
    }
    return disable;
}

#pragma mark - 配置项
- (id<NIMSessionConfig>)sessionConfig
{
    return nil; //使用默认配置
}

#pragma mark - 配置项列表
//是否需要监听新消息通知 : 某些场景不需要监听新消息，如浏览服务器消息历史界面
- (BOOL)shouldAddListenerForNewMsg
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableReceiveNewMessages)]) {
        should = ![self.sessionConfig disableReceiveNewMessages];
    }
    return should;
}



//是否需要显示输入框 : 某些场景不需要显示输入框，如使用 3D touch 的场景预览会话界面内容
- (BOOL)shouldShowInputView
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableInputView)]) {
        should = ![self.sessionConfig disableInputView];
    }
    return should;
}


//当前录音格式 : NIMSDK 支持 aac 和 amr 两种格式
- (NIMAudioType)recordAudioType
{
    NIMAudioType type = NIMAudioTypeAMR;
    if ([self.sessionConfig respondsToSelector:@selector(recordType)]) {
        type = [self.sessionConfig recordType];
    }
    return type;
}

//是否需要监听感应器事件
- (BOOL)needProximityMonitor
{
    BOOL needProximityMonitor = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableProximityMonitor)]) {
        needProximityMonitor = !self.sessionConfig.disableProximityMonitor;
    }
    return needProximityMonitor;
}


#pragma mark - 菜单
- (NSArray *)menusItems:(RCIMMessage *)message
{
    NSMutableArray *items = [NSMutableArray array];
    
    BOOL copyText = NO;
    if ([NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue == 0)
    {
        copyText = YES;
    }
//    if (message.messageType == NIMMessageTypeRobot)
//    {
//        NIMRobotObject *robotObject = (NIMRobotObject *)message.messageObject;
//        copyText = !robotObject.isFromRobot;
//    }
    NSInteger type = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;
    switch (type) {
        case 0:
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"复制"
                                                        action:@selector(copyText:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"转发"
                                                        action:@selector(rotateSend:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"分享到微信"
                                                        action:@selector(shareWebChat:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"分享到其它"
                                                        action:@selector(shareAll:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                        action:@selector(deleteMsg:)]];
            if (message.isMySend) {
                [items addObject:[[UIMenuItem alloc] initWithTitle:@"撤回"
                                                            action:@selector(resetBack:)]];
            }
            break;
        case 1:
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"下载"
                                                        action:@selector(downLoad:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"转发"
                                                        action:@selector(rotateSend:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"分享到微信"
                                                        action:@selector(shareWebChat:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"分享到其它"
                                                        action:@selector(shareAll:)]];
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                        action:@selector(deleteMsg:)]];
            if (message.isMySend) {
                [items addObject:[[UIMenuItem alloc] initWithTitle:@"撤回"
                                                            action:@selector(resetBack:)]];
            }
            break;
        case 3:
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                        action:@selector(deleteMsg:)]];
            if (message.isMySend) {
                [items addObject:[[UIMenuItem alloc] initWithTitle:@"撤回"
                                                            action:@selector(resetBack:)]];
            }
            break;
        case 4:
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                        action:@selector(deleteMsg:)]];
            if (message.isMySend) {
                [items addObject:[[UIMenuItem alloc] initWithTitle:@"撤回"
                                                            action:@selector(resetBack:)]];
            }
            break;
        case 5:
            [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                        action:@selector(deleteMsg:)]];
            if (message.isMySend) {
                [items addObject:[[UIMenuItem alloc] initWithTitle:@"撤回"
                                                            action:@selector(resetBack:)]];
            }
            break;

        default:
            break;
    }
    return items;
    
}

- (RCIMMessage *)messageForMenu
{
    return _messageForMenu;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

// 时间响应的回调
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSArray *items = [[UIMenuController sharedMenuController] menuItems];
    for (UIMenuItem *item in items) {
        if (action == [item action]){
            return YES;
        }
    }
    return NO;
}


-(void)rotateSend:(id)sender {
    RCIMMessage *message = [self messageForMenu];
    DYRotateSendViewController *target = [[DYRotateSendViewController alloc] init];
    target.message = message;
    [self.navigationController pushViewController:target animated:YES];
}

-(void)downLoad:(id)sender {
    RCIMMessage *message = [self messageForMenu];
    UIImage *imageToShare = nil;
    if (message.image) {
        imageToShare = message.image;
    }
    else {
        imageToShare = [UIImage imageWithContentsOfFile:message.LocalPath];
    }
    if (!imageToShare) {
        imageToShare = [UIImage imageNamed:@"dyjx_default_img"];
    }
    UIImageWriteToSavedPhotosAlbum(imageToShare, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contentInfo {
    if (error) {
        [self.view makeToast:@"下载失败"];
    }
    else {
        [self.view makeToast:@"已经下载到图片库"];
    }
}

- (void)copyText:(id)sender
{
    RCIMMessage *message = [self messageForMenu];
    if ([NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue == 0) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.extraDic[@"Keywords"]];
    }
}

- (void)deleteMsg:(id)sender
{
    RCIMMessage *message    = [self messageForMenu];
    [self uiDeleteMessage:message];
    //TODO: 通知撤销了消息，本地更改
    [[DataBaseManager shared] delegateModel:message identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
//    [self.conversationManager deleteMessage:message];
}

- (void)resetBack:(id)sender
{
    RCIMMessage *message = [self messageForMenu];

    [self uiDeleteMessage:message];
    //TODO: 通知撤销了消息，本地更改
    [[DataBaseManager shared] delegateModel:message identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];

    [[IMSDK sharedManager].chatManager resetMessage:message success:^(id  _Nullable responseObject) {
        [self uiAddMessages:@[(RCIMMessage *)responseObject]];
    } failed:^(NSString * _Nonnull errorMsg) {
    }];
}

-(void)shareWebChat:(id)sender {
    RCIMMessage *model = [self messageForMenu];
    NSInteger messageType = [NSString stringWithFormat:@"%@",model.extraDic[@"MessageType"]].integerValue;
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]) {
        if (messageType == 0) {
            NSString *textToShare = [NSString stringWithFormat:@"%@",model.extraDic[@"Keywords"]];
            SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
            req.text                = textToShare;
            req.bText               = YES;
            // 目标场景
            // 发送到聊天界面  WXSceneSession
            // 发送到朋友圈    WXSceneTimeline
            // 发送到微信收藏  WXSceneFavorite
            req.scene               = WXSceneSession;
            [WXApi sendReq:req];

        }
        else if (messageType == 1) {
            WXMediaMessage *message = [WXMediaMessage message];
            UIImage *imageToShare = nil;
            if (model.image) {
                imageToShare = model.image;
            }
            else {
                imageToShare = [UIImage imageWithContentsOfFile:model.LocalPath];
            }
            if (!imageToShare) {
                imageToShare = [UIImage imageNamed:@"dyjx_default_img"];
            }
            // 设置消息缩略图的方法
            [message setThumbImage:[UIImage compressImage:imageToShare toByte:32000]];
            // 多媒体消息中包含的图片数据对象
            WXImageObject *imageObject = [WXImageObject object];
            // 图片真实数据内容
            NSData *data = UIImageJPEGRepresentation(imageToShare, 0.2);
            imageObject.imageData = data;
            // 多媒体数据对象，可以为WXImageObject，WXMusicObject，WXVideoObject，WXWebpageObject等。
            message.mediaObject = imageObject;

            SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
            req.bText = NO;
            req.message = message;
            req.scene = WXSceneSession;// 分享到朋友圈
            [WXApi sendReq:req];
        }
    }
    else {
        [self.view makeToast:@"你还没有安装微信"];
    }

}

- (void)shareAll:(id)sender {
    RCIMMessage *message = [self messageForMenu];

    NSInteger messageType = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;
    if (messageType == 0) {
        NSString *textToShare = [NSString stringWithFormat:@"%@",message.extraDic[@"Keywords"]];
        NSArray *activityItems = @[textToShare];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
        //不出现在活动项目
        activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        [self presentViewController:activityVC animated:YES completion:nil];
        // 分享之后的回调
        activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
            if (completed) {
                [self.view makeToast:@"分享成功"];
                //分享 成功
            } else  {
                [self.view makeToast:@"分享失败"];
                //分享 取消
            }
        };
    }
    else if (messageType == 1) {
        UIImage *imageToShare = nil;
        if (message.LocalPath.length) {
            imageToShare = [UIImage imageWithContentsOfFile:message.LocalPath];
        }
        if (!imageToShare) {
            imageToShare = [UIImage imageNamed:@"dyjx_default_img"];
        }
        //在这里呢 如果想分享图片 就把图片添加进去  文字什么的通上
        NSArray *activityItems = @[imageToShare];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
        //不出现在活动项目
        activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        [self presentViewController:activityVC animated:YES completion:nil];
        // 分享之后的回调
        activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
            if (completed) {
                [self.view makeToast:@"分享成功"];
                //分享 成功
            } else  {
                [self.view makeToast:@"分享失败"];
                //分享 取消
            }
        };
    }
}


- (void)menuDidHide:(NSNotification *)notification
{
    [UIMenuController sharedMenuController].menuItems = nil;
}


#pragma mark - 操作接口
- (void)uiAddMessages:(NSArray *)messages
{
    [self.interactor addMessages:messages];
}

- (void)uiInsertMessages:(NSArray *)messages
{
    [self.interactor insertMessages:messages];
}

- (NIMMessageModel *)uiDeleteMessage:(RCIMMessage *)message{
    NIMMessageModel *model = [self.interactor deleteMessage:message];
    if (model.shouldShowReadLabel && model.message.conversationType == ConversationType_PRIVATE)
    {
        [self uiCheckReceipts:nil];
    }
    return model;
}

- (void)uiUpdateMessage:(RCIMMessage *)message{
    [self.interactor updateMessage:message];
}

- (void)uiCheckReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    [self.interactor checkReceipts:receipts];
}

#pragma mark - NIMMeidaButton
- (void)onTapMediaItemPicture:(NIMMediaItem *)item
{
    [self.interactor mediaPicturePressed];
}

- (void)onTapMediaItemShoot:(NIMMediaItem *)item
{
    [self.interactor mediaShootPressed];
}

//  发送位置
- (void)onTapMediaItemLocation:(NIMMediaItem *)item
{
    [self.interactor mediaLocationPressed];
}

//  发送考勤位置
- (void)onTapWorkLocation:(NIMMediaItem *)item
{
    [self.interactor workLocationPressed];
}

#pragma mark - 旋转处理 (iOS8 or above)
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    self.lastVisibleIndexPathBeforeRotation = [self.tableView indexPathsForVisibleRows].lastObject;
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    if (self.view.window) {
        __weak typeof(self) wself = self;
        [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
         {
             [[NIMSDK sharedSDK].mediaManager cancelRecord];
             [wself.interactor cleanCache];
             [wself.sessionInputView reset];
             [wself.tableView reloadData];
             [wself.tableView scrollToRowAtIndexPath:wself.lastVisibleIndexPathBeforeRotation atScrollPosition:UITableViewScrollPositionBottom animated:NO];
         } completion:nil];
    }
}


#pragma mark - 标记已读
- (void)markRead
{
    [self.interactor markRead];
}

#pragma mark - IMChatDelegate
-(void)onRecvMessages:(RCIMMessage *)message {
    if ([self shouldAddListenerForNewMsg])
    {
        [self uiAddMessages:@[message]];
//        [self.interactor markRead];
    }
}


#pragma mark - Private

- (void)addListener
{
    [IMSDK sharedManager].chatManager.session = self.session;
    [IMSDK sharedManager].chatManager.delegate = self;
//    [[NIMSDK sharedSDK].chatManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
}

- (void)removeListener
{
    [IMSDK sharedManager].chatManager.delegate = nil;
    [[NIMSDK sharedSDK].chatManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
}

- (void)changeLeftBarBadge:(NSInteger)unreadCount
{
//    NIMCustomLeftBarView *leftBarView = (NIMCustomLeftBarView *)self.navigationItem.leftBarButtonItem.customView;
//    leftBarView.badgeView.badgeValue = @(unreadCount).stringValue;
//    leftBarView.badgeView.hidden = !unreadCount;
}


- (id<NIMConversationManager>)conversationManager{
    switch (self.session.sessionType) {
        case NIMSessionTypeChatroom:
            return nil;
            break;
        case NIMSessionTypeP2P:
        case NIMSessionTypeTeam:
        default:
            return [NIMSDK sharedSDK].conversationManager;
    }
}


- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;
        
        titleView.titleLabel.text = self.sessionTitle;
        titleView.subtitleLabel.text = self.sessionSubTitle;
        
        self.titleLabel    = titleView.titleLabel;
        self.subTitleLabel = titleView.subtitleLabel;
    }

    [titleView sizeToFit];
}

- (void)refreshSessionTitle:(NSString *)title
{
    self.titleLabel.text = title;
    [self setUpTitleView];
}


- (void)refreshSessionSubTitle:(NSString *)title
{
    self.subTitleLabel.text = title;
    [self setUpTitleView];
}


@end

