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

@interface DYJXIdentitySwitchingPage ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)DYJXIdentitySwitchingViewModel *viewModel;
@property(nonatomic, strong)DYJXIdentitySwitchingModel *selectedIdentity;
@end

static NSString *cellID=@"cellID";
static NSString *headerID=@"headerID";

@implementation DYJXIdentitySwitchingPage


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self.tableView registerClass:[DYJXIdentitySwitchingCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[DYJXIdentitySwitchingHeader class] forHeaderFooterViewReuseIdentifier:@"headerID"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF"]];

    //设置接收消息代理
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveMessageNotification:)
                                                 name:RCKitDispatchMessageNotification
                                               object:nil];

    // 已读
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:XY_IM_AlreadRead object:nil];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(IdentitySwitchingCommit) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self GetUserInfo];
    self.selectedIdentity = [[DYJXIdentitySwitchingModel alloc] init];
    //    [self.otherTableView.mj_header beginRefreshing];
}

- (void)GetUserInfo{
    WeakSelf;
    [self.viewModel getUserInfoSuccess:^{
        [weakSelf.viewModel getMyEnterprisesSuccess:^{
             [weakSelf.tableView reloadData];
        } failed:^(NSString *errorMsg) {
            
        }];
    } failed:^(NSString *errorMsg) {
        
    }];
    
}

#pragma mark - 收到消息监听
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    dispatch_semaphore_wait([JSExtension shared].semaphore, 2);

    //处理好友请求
    RCMessage *message = notification.object;
    NSDictionary *extraDic = nil;
    NSLog(@"%@",([UserManager shared].dataArray.firstObject.Id));
    // 处理未读消息
    if ([message.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([message.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(message.content);
         extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([message.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
         extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([message.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) { // 单聊
        if ([extraDic[@"TargetId"] isEqualToString:[UserManager shared].getUserModel.UserID]) {
            for (DYJXIdentitySwitchingModel *model in [UserManager shared].dataArray) {
                if ([model.Id isEqualToString:extraDic[@"TargetId"]]) {
                    [[DataBaseManager shared] insertModel:message identifyId:model.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
        else { // 身份收到消息
            for (DYJXIdentitySwitchingModel *model in [UserManager shared].dataArray) {
                if ([model.Id isEqualToString:extraDic[@"TargetId"]] || [model.Id isEqualToString:extraDic[@"FromCertifyId"]]) {
                    [[DataBaseManager shared] insertModel:message identifyId:model.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
    }
    else {
        if ([NSString stringWithFormat:@"%@",extraDic[@"GType"]].integerValue == 1) { // 公司群群聊
            for (DYJXIdentitySwitchingModel *model in [UserManager shared].dataArray) {
                if ([model.Id isEqualToString:[UserManager shared].getUserModel.UserID]) {
                    [[DataBaseManager shared] insertModel:message identifyId:model.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
        else { // 外部群群聊
            for (DYJXIdentitySwitchingModel *model in [UserManager shared].dataArray) {
                if ([model.Id isEqualToString:extraDic[@"GMembers"]]) {
                    [[DataBaseManager shared] insertModel:message identifyId:model.Id conversionId:extraDic[@"ConversationId"]];
                }
            }
        }
    }

    dispatch_semaphore_signal([JSExtension shared].semaphore);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        [delegate updataBadgeNumber];
    });
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
            DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
            page.groupNumber = model.GroupNumber;
            page.isAdmin = [self isAdmin:model];
            [self.navigationController pushViewController:page animated:YES];
//            target.type = XJGroupTypeSubCompany;
        }
        else { // 公司详情
            DYJXCompanyInfoDetailPage *page = [[DYJXCompanyInfoDetailPage alloc]init];
            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
            page.groupNumber = model.GroupNumber;
             page.isAdmin = [self isAdmin:model];
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
        [YDBAlertView showToast:@"请选择一个身份!"];
        return;
    }

    [UserManager shared].swichModel = self.selectedIdentity;
    if ([[UserManager shared].getUserModel.Result.NumberString isEqualToString:self.selectedIdentity.NumberString]) { // 本人详情
        [UserManager shared].isCompany = 1;
    }
    else {
        if (self.selectedIdentity.IsPart) { // 子公司详情
           [UserManager shared].isCompany = 2;
        }
        else { // 公司详情
            [UserManager shared].isCompany = 3;
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
