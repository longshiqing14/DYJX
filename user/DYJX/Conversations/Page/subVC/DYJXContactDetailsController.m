//
//  DYJXContactDetailsController.m
//  user
//
//  Created by YP on 2019/5/12.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXContactDetailsController.h"
#import "DYJXContactDetailsTopView.h"
#import "SubcompanyBottomView.h"
#import "JSExtension.h"
#import "OwnerImageCell.h"
#import "TitleAndContentCell.h"
#import "ImageUploadCell.h"
#import "DYJXContactDetailsViewModel.h"
#import "DYJXQRCodePage.h"
#import "SpaceFooter.h"
#import "BusinessLicenceFooter.h"
#import "TipsFooter.h"
#import "DYJXMyManageGroupController.h"

static NSString *kGroupDetailModelTipsFooter = @"kGroupDetailModelTipsFooter";
static NSString *kGroupDetailModelBusinessLicenceFooter = @"kGroupDetailModelBusinessLicenceFooter";
static NSString *kGroupDetailModelSpaceFooter = @"kGroupDetailModelSpaceFooter";

@interface DYJXContactDetailsController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DYJXContactDetailsTopView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property(strong, nonatomic) SubcompanyBottomView *bottomView;
@property(strong, nonatomic) DYJXContactDetailsViewModel *viewModel;
@property (nonatomic, strong) DYJXUserInfoModel *userInfoModel;
@end

@implementation DYJXContactDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self topView];
    [self tableView];
    [self bottomView];
    [self getGetUser];
}
- (void)initNavigation{
    self.title = @"信息查看";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(CommitUserInfo) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)CommitUserInfo{
    WeakSelf
    [self.viewModel uploadUserWithContactType:self.topView.type success:^(id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf popToViewController];
        });
    } failed:^(NSString * _Nonnull errMsg) {
        
    }];
}

- (void)popToViewController  {
    WeakSelf
    [self.navigationController.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"DJContactsChatViewController")]) {
            [weakSelf.navigationController popToViewController:obj animated:NO];
            *stop = YES;
        }
    }];
    
}

- (void)getGetUser {
    WeakSelf
    [self.viewModel getGetUserWithById:self.targetId Success:^(DYJXUserInfoModel * _Nonnull response) {
        weakSelf.userInfoModel = response;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.topView setTypeWithRelation:weakSelf.userInfoModel.Relation];
            [weakSelf.tableView reloadData];
        });
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.viewModel.dataArray[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    
    if (indexPath.section == self.viewModel.dataArray.count - 1) {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"cellmodel"];
    }else {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"model"];
    }
    WeakSelf
    if (indexPath.section == 0 && indexPath.row == 0) {
        OwnerImageCell *ownerImageCell = (OwnerImageCell *)cell;
        ownerImageCell.qrCcodeblock = ^{
            DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
            DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
            qrCodePage.userIdOrCompanyId = userModel.UserID;
            qrCodePage.companyNumber = self.userInfoModel.NumberString;
            qrCodePage.companyName = self.userInfoModel.NumberString;
            [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
        };
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        SpaceFooter *footer = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupDetailModelSpaceFooter];
        return footer;
    }else if(section == 2) {
        BusinessLicenceFooter *footer = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupDetailModelBusinessLicenceFooter];
        return footer;
        
    }else if(section == 3) {
        TipsFooter *footer = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupDetailModelTipsFooter];
        return footer;
        
    }
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 150;
        }
        return 40;
    }else if (indexPath.section == 1 || indexPath.section == 2){
        return 40;
    }else{
        return 120;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 20;
    }else if (section == 2){
        return 60;
    }else{
        return 120;
    }
}


-(DYJXContactDetailsTopView *)topView {
    if (!_topView) {
        WeakSelf
        _topView = [[DYJXContactDetailsTopView alloc]initWithTitle:@"将改联系人设为" topBtnArray:@[@{@"title":@"好友联系人",
                                                                                              @"imageName":@"register_checkbox",
                                                                                              @"selectedImageName":@"register_checkbox_active"},
                                                                                            @{@"title":@"普通联系人",
                                                                                              @"imageName":@"register_checkbox",
                                                                                              @"selectedImageName":@"register_checkbox_active"},
                                                                                            @{@"title":@"黑名单",
                                                                                              @"imageName":@"register_checkbox",
                                                                                              @"selectedImageName":@"register_checkbox_active"},
                                                                                            @{@"title":@"删除",
                                                                                              @"imageName":@"register_checkbox",
                                                                                              @"selectedImageName":@"register_checkbox_active"},
                                                                                            @{@"title":@"邀请进入我管理的群",
                                                                                              @"imageName":@"neibuqun-select",
                                                                                              @"selectedImageName":@"neibuqun-select"}] inviteIngGroupBlocki:^{
                                                                                                  //TODO:邀请进入我管理的群
                                                                                                  [weakSelf.navigationController pushViewController:[[DYJXMyManageGroupController alloc]init] animated:YES];
                                                            }];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(@0);
            make.height.equalTo(@(__X(220)));
        }];
        _topView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:255/255.0 alpha:1.0];
    }
    return _topView;
}

- (SubcompanyBottomView *)bottomView{
    WeakSelf
    if (!_bottomView) {
        _bottomView = [[NSBundle mainBundle] loadNibNamed:@"SubcompanyBottomView" owner:self options:nil].firstObject;
        _bottomView.block = ^{
            {
                //                DLLResult *result = (DLLResult *)self.goodArray[indexPath.row];
                DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
                [[JSExtension shared] getConversion:weakSelf.targetId FromId:userModel.UserID type:0 DataSuccess:^(id  _Nonnull response) {
                    SKResult *respo = (SKResult *)response;
                    NIMSessionType type = NIMSessionTypeP2P;
                    [JSExtension shared].type = 0;
                    [JSExtension shared].conversionId = respo.Id;
                    
                    if([JSExtension shared].conversionId.length) {
                        [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
                        
                        NIMSession *session = [NIMSession session:respo.LastMsg.ConversationId type:type];
                        [JSExtension shared].session = session;
                        JXChatViewController *chatVC = [[JXChatViewController alloc] initWithSession:session];
                        RCConversationModel *chatModel = [[RCConversationModel alloc] init];
                        chatModel.targetId = [JSExtension shared].conversionId;
                        [JSExtension shared].chatVC = chatVC;
                        chatVC.naviTitle = respo.TargetName;
                        chatVC.chatModel = chatModel;
                        [weakSelf.navigationController pushViewController:chatVC animated:YES];
                    }
                    else {
                        [weakSelf.view makeToast:@"会话ID获取失败"];
                    }
                } failed:^(NSString * _Nonnull errorMsg) {
                    [weakSelf.view makeToast:@"会话ID获取失败"];
                }];
            }
        };
        [self.view addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.and.right.equalTo(@0);
            make.height.equalTo(@(__X(160)));
        }];
    }
    return _bottomView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.left.and.right.equalTo(@0);
            make.bottom.equalTo(self.bottomView.mas_top);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
        [_tableView registerClass:[TitleAndContentCell class] forCellReuseIdentifier:kGroupDetailModelTitleAndContentCell];
        [_tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
        [_tableView registerClass:[TipsFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelTipsFooter];
        [_tableView registerClass:[BusinessLicenceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelBusinessLicenceFooter];
        [_tableView registerClass:[SpaceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelSpaceFooter];
        
    }
    return _tableView;
}

-(DYJXContactDetailsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXContactDetailsViewModel alloc]init];
    }
    return _viewModel;
}

@end
