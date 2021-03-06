//
//  DYLastestChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYLastestChatViewController.h"
#import "HeadSearchView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "DYJXLasterListCell.h"
#import "JSExtension.h"
#import "DYChatViewController.h"
#import "JXChatViewController.h"

@interface DYLastestChatViewController ()

@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation DYLastestChatViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"最近会话";

    [self.view addSubview:self.headView];

    WeakSelf;
    [self.conversationListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).insets(UIEdgeInsetsMake(60, 0, 0, 0));
    }];
    
    [self initNavigator];

    self.conversationListTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self reloadData];
    }];

    [self reloadData];

    //设置接收消息代理
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveMessageNotification:)
//                                                 name:RCKitDispatchMessageNotification
//                                               object:nil];

    //设置接收消息代理
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveMessageNotification:)
//                                                 name:XY_IM_InsertModel
//                                               object:nil];

    // 已读
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:XY_IM_AlreadRead object:nil];
//
//    // 已读
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:XY_IM_AlreadUpdateData object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMessageNotification:(NSNotification *)notification {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self reloadData];
    });
}

-(void)reloadTableView {
    [self.conversationListTableView reloadData];
}

- (void)onRCIMReceiveMessage:(RCMessage *)message
                        left:(int)left {
    NSLog(@"最近会话列表 %@",message);
}

//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationModel *conversationModel = self.conversationListDataSource[indexPath.row];
    NSDictionary *dict = (NSDictionary *)model.extend;
    RCConversationType conversationType = ConversationType_PRIVATE;
    NIMSessionType type = NIMSessionTypeP2P;
    if ([dict[@"type"] isEqualToString:@"1"]) {
        conversationType = ConversationType_GROUP;
        type = NIMSessionTypeTeam;
        [JSExtension shared].type = 1;
        [JSExtension shared].ImUserId = conversationModel.extend[@"targetId"];
        [JSExtension shared].targetId = conversationModel.extend[@"targetId"];
        [JSExtension shared].targetName = conversationModel.extend[@"targetName"];
        [JSExtension shared].targetImg = conversationModel.extend[@"targetImg"];
        [JSExtension shared].UserType = (NSInteger)conversationModel.extend[@"userType"];
    }
    else if ([dict[@"type"] isEqualToString:@"0"]) {
        conversationType = ConversationType_PRIVATE;
        type = NIMSessionTypeP2P;
        [JSExtension shared].type = 0;
        [JSExtension shared].ImUserId = conversationModel.extend[@"targetId"];
        [JSExtension shared].targetId = conversationModel.extend[@"targetId"];
        [JSExtension shared].targetName = conversationModel.extend[@"targetName"];
        [JSExtension shared].targetImg = conversationModel.extend[@"targetImg"];
        [JSExtension shared].UserType = (NSInteger)conversationModel.extend[@"userType"];
    }

    [JSExtension shared].conversionId = conversationModel.targetId;

    [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:model.targetId];

    NIMSession *session = [NIMSession session:model.targetId type:type];
    [JSExtension shared].session = session;
    JXChatViewController *chatVC = [[JXChatViewController alloc] initWithSession:session];
    [JSExtension shared].chatVC = chatVC;
    chatVC.naviTitle = model.conversationTitle;
    chatVC.chatModel = model;
    [self.navigationController pushViewController:chatVC animated:YES];
}


-(void)reloadData {
    WeakSelf
    [self.viewModel getLasterContractsNumer:1 Success:^(BOOL isLastPage, BOOL doHaveData) {
        [weakSelf.conversationListTableView.mj_header endRefreshing];
        weakSelf.conversationListDataSource = [weakSelf willReloadTableData:[[NSMutableArray alloc] init]];
        [weakSelf reloadTableView];
    } failed:^(NSString * _Nonnull errorMsg) {
        [weakSelf.conversationListTableView.mj_header endRefreshing];
    }];
}

- (void)initNavigator{
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 20;
    

    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    if (self.isPersonIdentification) {
        rightCustomView.layer.cornerRadius = 10;
        rightCustomView.clipsToBounds = YES;
    }
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (NSMutableArray *)willReloadTableData:(NSMutableArray *)dataSource {
    [dataSource removeAllObjects];
    NSString *myIdentityId = [[JSExtension shared] myIdentityId];

    for (int i = 0; i<self.viewModel.lasterList.Result.count; i++) {
        DYJOResult *result = self.viewModel.lasterList.Result[i];
        RCConversationModel *model = [[RCConversationModel alloc]init];
        model.conversationModelType = RC_CONVERSATION_MODEL_TYPE_CUSTOMIZATION;
        if (result.LastMsg[@"RowData"]) {
            NSString *body = [NSString stringWithFormat:@"%@",result.LastMsg[@"RowData"]];
            NSDictionary *dic = [body stringToDictionary];
            if (dic[@"extra"]) {
                NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                model.targetId = dict[@"ConversationId"];
                if (model.targetId) {
                    NSArray *array = [[DataBaseManager shared] getModel:[RCMessage new] identifyId:[JSExtension shared].myIdentityId conversionId:model.targetId];
                    if (!array || !array.count) {
                        continue;
                    }
                }
                else {
                    continue;
                }
            }
            else {
                continue;
            }
        }
        else {
            continue;
        }

        model.unreadMessageCount = 1;
        NSMutableDictionary *dictory = [[NSMutableDictionary alloc] init];
        if (result.LastMsg[@"CreateOn"]) {
            NSString *creatorName = [NSString stringWithFormat:@"%@",result.LastMsg[@"CreateOn"]];
            [dictory setObject:creatorName forKey:@"UpdateOn"];
        }
        if ([result.TargetName isEqualToString:[UserManager shared].getUserModel.Result.DisplayName]) {
            model.conversationTitle = result.FromName;
        }
        else {
            model.conversationTitle = result.TargetName;
        }

        model.sentStatus = [NSString stringWithFormat:@"%@",result.LastMsg[@"SendType"]].integerValue*10;
        NSInteger type = [NSString stringWithFormat:@"%@",result.LastMsg[@"MessageType"]].integerValue;
        if (type == 0) { // 文字
            if (result.LastMsg[@"Keywords"]) {
                [dictory setObject:[NSString stringWithFormat:@"%@",result.LastMsg[@"Keywords"]] forKey:@"Keywords"];
            }
        }
        else if (type == 1) { // 图片
            [dictory setObject:@"[图片]" forKey:@"Keywords"];
        }
        else if (type == 2) { // 文件
            [dictory setObject:@"[文件]" forKey:@"Keywords"];
        }
        else if (type == 3) { // 音频
            [dictory setObject:@"[语音]" forKey:@"Keywords"];
        }
        else if (type == 4) { // 位置
            [dictory setObject:@"[位置]" forKey:@"Keywords"];
        }
        else if (type == 5) { // 位置
            [dictory setObject:@"[位置]" forKey:@"Keywords"];
        }
        else if (type == 6) { // 图片
            [dictory setObject:@"撤销了一条消息" forKey:@"Keywords"];
        }

        if (result.LastMsg[@"RowData"]) {
            NSString *body = [NSString stringWithFormat:@"%@",result.LastMsg[@"RowData"]];
            NSDictionary *dic = [body stringToDictionary];
            [dictory setObject:[NSString stringWithFormat:@"%@",result.LastMsg[@"Keywords"]] forKey:@"RowData"];
            if (dic[@"extra"]) {
                [dictory setObject:[NSString stringWithFormat:@"%@",result.LastMsg[@"Keywords"]] forKey:@"extra"];
            }
        }
        model.senderUserId = [NSString stringWithFormat:@"%@",result.LastMsg[@"FromId"]];
        if (result.LastMsg[@"CreateBy"]) {
            model.draft = [NSString stringWithFormat:@"%@",result.LastMsg[@"CreateBy"]];
        }
        model.lastestMessageId = [NSString stringWithFormat:@"%@",result.LastMsg[@"Id"]].longValue;
        RCMessageContent *content = [[RCMessageContent alloc] init];
        content.senderUserInfo = [[RCUserInfo alloc] init];
        content.mentionedInfo = [[RCMentionedInfo alloc] init];
        content.senderUserInfo.userId = [NSString stringWithFormat:@"%@",result.LastMsg[@"FromId"]];
        NSArray *separate = [result.UpdateBy componentsSeparatedByString:@"["];
        content.senderUserInfo.name = separate.firstObject;
        content.senderUserInfo.userId = [NSString stringWithFormat:@"%@",result.LastMsg[@"FromId"]];
        if (result.TargetHeadImg) {
            content.senderUserInfo.portraitUri = [result.TargetHeadImg XYImageURL];
        }
        else {
            if ([result.FromId isEqualToString:[UserManager shared].login.UserID]) { // 来源如果是自己，那就取targetId，如果不是就去fromId作为targetId
                content.senderUserInfo.portraitUri = [NSString imageURLWithTargetId:result.TargetId type:result.Type];
            }
            else {
                content.senderUserInfo.portraitUri = [NSString imageURLWithTargetId:result.FromId type:result.Type];
            }
        }
        if (result.Type == 1) {
            [dictory setObject:@"1" forKey:@"type"];
            dictory[@"userType"] = @1;
        }
        else if (result.Type == 0){
            [dictory setObject:@"0" forKey:@"type"];
            dictory[@"userType"] = @0;
        }

        NSString *fromId = [NSString stringWithFormat:@"%@",result.LastMsg[@"FromId"]];
        NSString *fromCerterId = [NSString stringWithFormat:@"%@",result.LastMsg[@"FromCertifyId"]];

        if (fromId.length > 6) {
            if ([fromId isEqualToString:fromCerterId]) {
                dictory[@"userType"] = @0;
            }
            else {
                dictory[@"userType"] = @1;
            }
        }

        if ([result.TargetId isEqualToString:[UserManager shared].getUserModel.UserID]) {
            dictory[@"targetId"] = result.FromId;
            dictory[@"targetName"] = result.FromName;
            dictory[@"targetImg"] = result.FromHeadImg;
        }
        else {
            dictory[@"targetId"] = result.TargetId;
            dictory[@"targetName"] = result.TargetName;
            dictory[@"targetImg"] = result.TargetHeadImg;
        }

        model.extend = dictory;
        model.lastestMessage = content;
        model.jsonDict = result.LastMsg;

//        int j = 0;
//        BOOL isFlag = YES;
//        NSArray *datas = [dataSource copy];
//        for (RCConversationModel *item in datas) { // 去重
//            if ([model.targetId isEqualToString:item.targetId]) {
//                if ([model.extend[@"UpdateOn"] caseInsensitiveCompare:item.extend[@"UpdateOn"]] == NSOrderedDescending) {
//                    [dataSource removeObjectAtIndex:j];
//                    break;
//                }
//                else { // 小于那个时间
//                    isFlag = NO;
//                }
//            }
//            j++;
//        }

//        if (!isFlag) {
//            continue;
//        }

        [dataSource addObject:model];
    }

    [JSExtension shared].conversionArray = dataSource;
    return dataSource;
}

-(CGFloat)rcConversationListTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(RCConversationBaseCell *)rcConversationListTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXLasterListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYJXLasterListCell"];
    if (!cell) {
        cell = [[DYJXLasterListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DYJXLasterListCell"];
    }
    RCConversationModel *model = self.conversationListDataSource[indexPath.row];
    cell.title.text = model.conversationTitle;
    NSDictionary *dict = (NSDictionary *)model.extend;


    [cell setNumber:[[DataBaseManager shared] unreadCountIdentifyId:[JSExtension shared].myIdentityId conversionId:model.targetId]];

    if (dict[@"UpdateOn"]) {
        cell.timeLabel.text = dict[@"UpdateOn"];
    }
    else {
        cell.timeLabel.text = @"";
    }

    if (dict[@"Keywords"]) {
        cell.content.text = dict[@"Keywords"];
    }
    else {
        cell.content.text = @"";
    }

    if ([dict[@"type"] isEqualToString:@"1"]) {
        [cell setCircle:NO];
    }
    else if ([dict[@"type"] isEqualToString:@"0"]) {
        [cell setCircle:YES];
    }

    if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
        [cell.porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
    }
    else if (dict[@"extra"]) {
        [cell.porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
    }
    else {

    }
    return (RCConversationBaseCell *)cell;
}


#pragma mark - Action
-(void)searchClick {
    
}

#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackPage)];
    }
    return _tapGestureRecognizer;
}

- (void)goBackPage{
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    XYKeyWindow.rootViewController = appDelegate.rootViewController;
//    [appDelegate.rootViewController.navigationController popViewControllerAnimated:YES];
    XYKeyWindow.rootViewController = [[NaviViewController alloc] initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
    
}

@end
