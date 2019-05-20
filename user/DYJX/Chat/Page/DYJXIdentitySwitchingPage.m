//
//  DYJXIdentitySwitchingPage.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingPage.h"
#import "DYJXIdentitySwitchingViewModel.h"
#import "DYJXIdentitySwitchingCell.h"
#import "NaviViewController.h"
#import "DYJXLoginPage.h"
#import "DYJXFindPasswordPage.h"
#import "DYJXIdentitySwitchingHeader.h"
#import "DYJXLogisticPage.h"
#import "DYJXIdentitySwitchingModel.h"
#import "JSExtension.h"
#import "AppDelegate.h"
#import "XJInfoDetailPage.h"
#import "DYJXConversationTabBarController.h"
#import "DYJXUserInfoDetailPage.h"
#import "DYJXCompanyInfoDetailPage.h"
#import "DYJXUserInfoModel.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import <RongIMKit/RongIMKit.h>
#import "IMSDK.h"
#import "DYJXComparePage.h"
#import "iPhoneXBottomBackgroundView.h"
#import "DYJXAddCompanyPageController.h"

@interface DYJXIdentitySwitchingPage ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)DYJXIdentitySwitchingViewModel *viewModel;
@property(nonatomic, strong)DYJXIdentitySwitchingModel *selectedIdentity;
@property(nonatomic, strong)iPhoneXBottomBackgroundView *bottomBackgroundView;
@end

static NSString *cellID=@"cellID";
static NSString *headerID=@"headerID";

@implementation DYJXIdentitySwitchingPage


- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [self initNavigation];
    
    [self initSubViews];
    [self.tableView registerClass:[DYJXIdentitySwitchingCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[DYJXIdentitySwitchingHeader class] forHeaderFooterViewReuseIdentifier:@"headerID"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF"]];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf GetUserInfo];
    }];
    

    //设置接收消息代理
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveMessageNotification:)
                                                 name:RCKitDispatchMessageNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveMessageNotification:) name:RCKitDispatchRecallMessageNotification object:nil];

    // 已读
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:XY_IM_AlreadRead object:nil];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)initSubViews{
    [self.view addSubview:self.bottomBackgroundView];
    [self.view sendSubviewToBack:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(34);
    }];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)reloadTableView {
    [self.tableView reloadData];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate updataBadgeNumber];
}

- (void)initNavigation{
    self.title = @"身份切换";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};

    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(IdentitySwitchingCommit) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};

    [self GetUserInfo];
    self.selectedIdentity = [[DYJXIdentitySwitchingModel alloc] init];
    //    [self.otherTableView.mj_header beginRefreshing];
}

- (void)GetUserInfo{
    WeakSelf;
    [self.viewModel getUserInfoSuccess:^{
        [weakSelf.viewModel getMyEnterprisesSuccess:^{
            [weakSelf.tableView.mj_header endRefreshing];
            DYJXUserModel * model =[XYUserDefaults readUserDefaultsLoginedInfoModel];
            self.selectedIdentity.Id = model.UserID;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        } failed:^(NSString *errorMsg) {
              [weakSelf.tableView.mj_header endRefreshing];
        }];
    } failed:^(NSString *errorMsg) {
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
}

#pragma mark - 收到消息监听
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    dispatch_semaphore_wait([JSExtension shared].semaphore, 2);

    //处理好友请求
    NSLog(@"%@",notification.object);
    RCMessage *message = notification.object;
    RCIMMessage *model = [RCIMMessage copyRCModel:message];

    NSDictionary *extraDic = nil;
    NSMutableDictionary *mutDic = nil;
    NSString *type = nil;
    NSLog(@"%@",([UserManager shared].dataArray.firstObject.Id));
    // 处理未读消息
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"content"] = textMessage.content;
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"imageUri"] = textMessage.imageUrl;
        UIImage *image = [self synDownloadImage:[textMessage.imageUrl XYImageURL]];
        NIMImageObject *imageObject = [[NIMImageObject alloc] initWithImage:image];
        imageObject.url = textMessage.imageUrl;
        NSArray *typeArray = [textMessage.imageUrl componentsSeparatedByString:@"."];
        type = typeArray.lastObject;
        if(image) {
            model.image = image;
        }
        imageObject.size = image.size;
        model.imageSize = image.size;
        model.messageObject = imageObject;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        NSData *data = [[NSData alloc]initWithBase64EncodedString:textMessage.amrBase64Content options:NSDataBase64DecodingIgnoreUnknownCharacters];
        NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithData:data extension:@""];
        model.amrBase64Content = textMessage.amrBase64Content;
        mutDic[@"contentDuration"] = @(textMessage.duration);
        audioObject.duration = (NSInteger)textMessage.duration;
        model.messageObject = audioObject;
        type = @"amr";
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"contentLocationName"] = textMessage.locationName;
        mutDic[@"latitude"] = @(textMessage.location.latitude);
        mutDic[@"longitude"] = @(textMessage.location.longitude);
    }
    else {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        model.sentTime = 0;
        model.receivedTime = 0;
    }

    model.messageUId = extraDic[@"Id"];
    model.session = [[NIMSession alloc] init];

    model.extraDic = [NSDictionary dictionaryWithDictionary:extraDic];
    model.isPlayed = NO;
    model.isMySend = NO;
    model.isDeleted = NO;
    
    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) {
        model.session.sessionType = NIMSessionTypeP2P;
        model.session.sessionId = extraDic[@"ConversationId"];
        if (![extraDic[@"TargetId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = YES;
                }
                else {
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = NO;
                }
            }
            else {
                model.messageDirection = MessageDirection_RECEIVE;
            }
        }
        else {
            model.messageDirection = MessageDirection_RECEIVE;
        }
    }
    else {
        model.session.sessionType = NIMSessionTypeTeam;
        model.session.sessionId = extraDic[@"ConversationId"];
        if ([extraDic[@"FromCertifyId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = YES;
                }
                else {
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = NO;
                }
            }
            else {
                model.messageDirection = MessageDirection_RECEIVE;
            }
        }
        else {
            model.messageDirection = MessageDirection_RECEIVE;
        }
    }

    if (model.messageDirection == MessageDirection_RECEIVE) {
        model.isOutgoingMsg = NO;
    }
    else {
        model.isOutgoingMsg = YES;
    }

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) {
        model.isOutgoingMsg = NO;
    }

    model.sentStatus = SentStatus_SENT;
    model.deliveryState = NIMMessageDeliveryStateDeliveried;

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) { // 单聊
        if ([extraDic[@"TargetId"] isEqualToString:[UserManager shared].getUserModel.UserID]) {
            for (DYJXIdentitySwitchingModel *item in [UserManager shared].dataArray) {
                if ([item.Id isEqualToString:extraDic[@"TargetId"]]) {
                    if ([model.content isKindOfClass:[RCImageMessage class]]) {
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,item.Id,extraDic[@"ConversationId"],model.messageUId,type];
                        model.LocalPath = imagePath;
                    }
                    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
                        model.LocalPath = [self getPathFromModel:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    }
                    [self storeSourceWithContent:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    [[DataBaseManager shared] insertModel:model identifyId:item.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
        else { // 身份收到消息
            for (DYJXIdentitySwitchingModel *item in [UserManager shared].dataArray) {
                if ([item.Id isEqualToString:extraDic[@"TargetId"]] || [item.Id isEqualToString:extraDic[@"FromCertifyId"]]) {
                    if ([model.content isKindOfClass:[RCImageMessage class]]) {
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,item.Id,extraDic[@"ConversationId"],model.messageUId,type];
                        model.LocalPath = imagePath;
                    }
                    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
                        model.LocalPath = [self getPathFromModel:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    }
                    [self storeSourceWithContent:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    [[DataBaseManager shared] insertModel:model identifyId:item.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
    }
    else {
        if ([NSString stringWithFormat:@"%@",extraDic[@"GType"]].integerValue == 1) { // 公司群群聊
            for (DYJXIdentitySwitchingModel *item in [UserManager shared].dataArray) {
                if ([item.Id isEqualToString:[UserManager shared].getUserModel.UserID]) {
                    if ([model.content isKindOfClass:[RCImageMessage class]]) {
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,item.Id,extraDic[@"ConversationId"],model.messageUId,type];
                        model.LocalPath = imagePath;
                    }
                    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
                        model.LocalPath = [self getPathFromModel:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    }
                    [self storeSourceWithContent:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    [[DataBaseManager shared] insertModel:model identifyId:item.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
        else { // 外部群群聊
            for (DYJXIdentitySwitchingModel *item in [UserManager shared].dataArray) {
                if ([item.Id isEqualToString:extraDic[@"GMembers"]]) {
                    if ([model.content isKindOfClass:[RCImageMessage class]]) {
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,item.Id,extraDic[@"ConversationId"],model.messageUId,type];
                        model.LocalPath = imagePath;
                    }
                    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
                        model.LocalPath = [self getPathFromModel:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    }
                    [self storeSourceWithContent:model identifyId:item.Id conversationId:extraDic[@"ConversationId"]];
                    [[DataBaseManager shared] insertModel:model identifyId:item.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
    }

    dispatch_semaphore_signal([JSExtension shared].semaphore);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        [delegate updataBadgeNumber];
    });
}

-(void)storeSourceWithContent:(RCIMMessage *)message identifyId:(NSString *)identifyId conversationId:(NSString *)conversationId {
    NSDictionary *extraDic = nil;
    NSData * data = nil;
    // 处理未读消息
    if ([message.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([message.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        UIImage *image = message.image;
        if (image) {
            data = UIImagePNGRepresentation(image);
        }
        NSArray *typeArray = [textMessage.imageUrl componentsSeparatedByString:@"."];
        if (data && data.length) {
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,identifyId,conversationId,message.messageUId,typeArray.lastObject];
            BOOL isFinish = [data writeToFile:imagePath atomically:YES];
            NSLog(@"成功保存图片");
        }
    }
    else if ([message.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        NSData *data = [[NSData alloc]initWithBase64EncodedString:textMessage.amrBase64Content options:NSDataBase64DecodingIgnoreUnknownCharacters];
        if (data && data.length) {
            NSString *path = [self getPathFromModel:message identifyId:identifyId conversationId:conversationId];
            BOOL isFinish = [data writeToFile:path atomically:YES];
            NSLog(@"成功保存语音");
        }
    }
    else if ([message.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else {
        RCMessage *textMessage = (RCMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        message.sentTime = 0;
        message.receivedTime = 0;
    }
}


-(NSString *)getPathFromModel:(RCIMMessage *)message identifyId:(NSString *)identifyId conversationId:(NSString *)ConversationId{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [NSString stringWithFormat:@"%@/%@%@%@.amr",docDir,identifyId,ConversationId,message.messageUId];
}

-(UIImage *)synDownloadImage:(NSString *)url {
    if (!url) {
        return nil;
    }
    __block UIImage *tempImage = nil;
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_sync(dispatch_get_main_queue(), ^{
        [[IMSDK sharedManager].imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            tempImage = image;
            dispatch_semaphore_signal(sema);
        }];
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    return tempImage;
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel numberOfCell];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXIdentitySwitchingCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSArray *titles = @[@"本人\n详情",@"公司\n详情",@"子公司\n  详情"];
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[[self.viewModel iconImageUrl:indexPath] XYImageURL]] placeholderImage:[UIImage imageNamed:@"btn_group"]];
    [tableCell.detailButton addTarget:self action:@selector(btnClick:)
                     forControlEvents:UIControlEventTouchUpInside];
    tableCell.detailButton.tag = indexPath.row;
    DYJXIdentitySwitchingModel *identity = [self.viewModel IdentityAtIndexPath:indexPath];

    if ([[UserManager shared].getUserModel.Result.NumberString isEqualToString:identity.NumberString]) { // 本人详情
        [tableCell.detailButton setTitle:titles.firstObject forState:UIControlStateNormal];
        tableCell.contentView.backgroundColor = [UIColor whiteColor];
        tableCell.goodsImageView.layer.masksToBounds = YES;
        tableCell.goodsImageView.layer.cornerRadius = 25.0;
        tableCell.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        tableCell.sellingPointLable.textColor = [UIColor colorWithHexString:@"#333333"];
        tableCell.sellingPointLable.text = [NSString stringWithFormat:@"%@",[self.viewModel GroupName:indexPath]];
        tableCell.goodsNameLabel.font = [UIFont boldSystemFontOfSize:14];
        tableCell.sellingPointLable.font = [UIFont boldSystemFontOfSize:14];
    }
    else {
        tableCell.goodsNameLabel.font = [UIFont systemFontOfSize:14];
        tableCell.sellingPointLable.font = [UIFont systemFontOfSize:14];
        tableCell.goodsImageView.layer.masksToBounds = NO;
        if ([self isAdmin:identity]) {
            tableCell.sellingPointLable.text = [NSString stringWithFormat:@"%@%@",[self.viewModel GroupName:indexPath],@"(管理员)"];
        }
        else {
            tableCell.sellingPointLable.text = [NSString stringWithFormat:@"%@%@",[self.viewModel GroupName:indexPath],@"(参与者)"];
        }
        if (!identity.IsPart) { // 公司详情
            [tableCell.detailButton setTitle:titles[1] forState:UIControlStateNormal];
            tableCell.contentView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
            tableCell.goodsNameLabel.textColor = [UIColor colorWithRed:219/255.0 green:55/255.0 blue:48/255.0 alpha:1];
            tableCell.sellingPointLable.textColor = [UIColor colorWithRed:219/255.0 green:55/255.0 blue:48/255.0 alpha:1];
        }
        else { // 子公司详情
            [tableCell.detailButton setTitle:titles.lastObject forState:UIControlStateNormal];
            tableCell.contentView.backgroundColor = [UIColor whiteColor];
            tableCell.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
            tableCell.sellingPointLable.textColor = [UIColor colorWithHexString:@"#333333"];
        }
    }
    tableCell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:", [self.viewModel GroupNumberString:indexPath]];
    [tableCell setNumber:[[DataBaseManager shared] unreadCountIdentifyId:identity.Id]];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}

-(BOOL)isAdmin:(DYJXIdentitySwitchingModel *)model {
    for (int i = 0; i < model.AdminUserIds.count; i++) {
        NSString *userId = model.AdminUserIds[i];
        if ([userId isEqualToString:[UserManager shared].login.UserID]) {
            return YES;
        }
    }
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIdentity = [self.viewModel IdentityAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        DYJXUserModel * model =[XYUserDefaults readUserDefaultsLoginedInfoModel];
        
        self.selectedIdentity.Id = model.UserID;
    }

    [JSExtension shared].myIdentityId = self.selectedIdentity.Id;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYJXIdentitySwitchingModel *)selectedIdentity{
    if (!_selectedIdentity) {
        _selectedIdentity = [[DYJXIdentitySwitchingModel alloc] init];
    }
    return _selectedIdentity;
}

- (iPhoneXBottomBackgroundView *)bottomBackgroundView{
    if (!_bottomBackgroundView) {
        _bottomBackgroundView = [[NSBundle mainBundle]loadNibNamed:@"iPhoneXBottomBackgroundView" owner:self options:nil].firstObject;

    }
    return _bottomBackgroundView;
}

- (DYJXIdentitySwitchingViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXIdentitySwitchingViewModel alloc] init];
    }
    return _viewModel;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //headerView
    //去掉UItableview的section的headerview黏性
    CGFloat sectionHeaderHeight = 60;
    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - Action
-(void)btnClick:(UIButton *)sender {
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    DYJXIdentitySwitchingModel *model  = [self.viewModel IdentityAtIndexPath:indexpath];
//    XJInfoDetailPage *target = [[XJInfoDetailPage alloc] init];
     [XYUserDefaults readLoginedModel];
    if ([[UserManager shared].getUserModel.Result.NumberString isEqualToString:model.NumberString]) { // 本人详情
        DYJXUserInfoDetailPage *page = [[DYJXUserInfoDetailPage alloc]init];
        page.userIconImageURL = [model.GroupHeadImg XYImageURL];
        [self.navigationController pushViewController:page animated:YES];
//        target.type = XJGroupTypePerson;
    }
    else {
        if (model.IsPart) { // 子公司详情
//            DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
//            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//            page.groupNumber = model.GroupNumber;
//            page.targetId = model.Id;
//            page.isAdmin = [self isAdmin:model];
            DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(DYJXAddCompanyType_SubDetails) groupNumber:model.GroupNumber targetId:model.Id userIconImageURL:[model.GroupHeadImg XYImageURL]isAdmin:[self isAdmin:model]];
            [self.navigationController pushViewController:page animated:YES];
            
            
//            target.type = XJGroupTypeSubCompany;
        }
        else { // 公司详情
//            DYJXCompanyInfoDetailPage *page = [[DYJXCompanyInfoDetailPage alloc]init];
//            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//            page.groupNumber = model.GroupNumber;
//            page.targetId = model.Id;
//             page.isAdmin = [self isAdmin:model];
            DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(DYJXAddCompanyType_Details) groupNumber:model.GroupNumber targetId:model.Id userIconImageURL:[model.GroupHeadImg XYImageURL]isAdmin:[self isAdmin:model]];
            [self.navigationController pushViewController:page animated:YES];
//            target.type = XJGroupTypeCompany;
        }
    }
}

- (IBAction)logoutBTN:(UIButton *)sender {
    [self.viewModel logoutSuccess:^{
//        [YDBAlertView showToast:@"退出登录成功！"];
        [XYUserDefaults deleteUserDefaultsLoginedInfoModel];
        XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil]];
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (IBAction)modify:(UIButton *)sender {
    
    DYJXFindPasswordPage *findPasswordPage = [[DYJXFindPasswordPage alloc]initWithNibName:@"DYJXFindPasswordPage" bundle:nil];
    [self.navigationController pushViewController:findPasswordPage animated:YES];
}

- (void)IdentitySwitchingCommit{
    if ([YWDTools isNil:self.selectedIdentity.Id]) {
//        [YDBAlertView showToast:@"请选择一个身份!"];
//        return;
        DYJXUserModel * model =[XYUserDefaults readUserDefaultsLoginedInfoModel];
        
        self.selectedIdentity.Id = model.UserID;
        [JSExtension shared].myIdentityId = self.selectedIdentity.Id;

    }

    [UserManager shared].swichModel = self.selectedIdentity;
    if ([[UserManager shared].getUserModel.Result.NumberString isEqualToString:self.selectedIdentity.NumberString]) { // 本人详情
        [UserManager shared].isCompany = 1;
         [JSExtension shared].enterpriseId = self.selectedIdentity.Id;
        [JSExtension shared].myIdentityId = self.selectedIdentity.Id;

    }
    else {
        if (self.selectedIdentity.IsPart) { // 子公司详情
           [UserManager shared].isCompany = 2;
            [JSExtension shared].enterpriseId = self.selectedIdentity.Id;
        }
        else { // 公司详情
            [UserManager shared].isCompany = 3;
             [JSExtension shared].enterpriseId = self.selectedIdentity.Id;
        }
    }

    [JSExtension shared].myIdentityId = self.selectedIdentity.Id;
    [XYUserDefaults writeAppDlegateOfCertificateId:self.selectedIdentity.GroupNumber];

    DYJXLogisticPage *logisticPage = [[DYJXLogisticPage alloc]initWithNibName:@"DYJXLogisticPage" bundle:nil];
    logisticPage.IdentityModel = self.selectedIdentity;
    [self.navigationController pushViewController:logisticPage animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
