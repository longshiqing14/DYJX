//
//  DYJXNewGroupController.m
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXNewGroupController.h"
#import "DYJXAddCompanyPageHeaderCell.h"
#import "DYJXAddCompanyPageCell.h"
#import "DYJXNewGroupViewModel.h"
#import "XYSelectIconPopView.h"
#import "DYJXAddGroupMemberController.h"
#import "DYJXAddGroupMemberPageController.h"
#import "DYJXQRCodePage.h"
#import "JSExtension.h"

typedef void(^InteriorGroupBlock)(void);
typedef void(^ExternalGroupBlock)(void);
typedef void(^GroupDetailsViewBlock)(NSInteger index);
@interface DYJXGroupDetailsView : UIView;

@property (nonatomic, strong) NSMutableArray<UIButton *> *bottomBtns;

@property (nonatomic, strong) NSArray<NSString *> *bottomBtnTitles;

@property (nonatomic, copy) GroupDetailsViewBlock block;

@end

@implementation DYJXGroupDetailsView

-(instancetype)initWithBottomBtnTitles:(NSArray<NSString *> *)bottomBtnTitles block:(GroupDetailsViewBlock)block {
    self = [super init];
    if (self) {
        self.bottomBtnTitles = bottomBtnTitles.copy;
        self.block = block;
    }
    return self;
}

- (void)setBottomBtnTitles:(NSArray<NSString *> *)bottomBtnTitles {
    _bottomBtnTitles = bottomBtnTitles;
    for (NSString *title in bottomBtnTitles) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.backgroundColor = [UIColor colorWithRed:8/255.0 green:164/255.0 blue:2/255.0 alpha:1];
        [btn setTitle:title forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        btn.titleLabel.font = [UIFont systemFontOfSize:__X(30)];
        [self addSubview:btn];
        CGFloat spacing = (XYScreenW - 4 * __X(30)) / 3.0;
        NSInteger index = [bottomBtnTitles indexOfObject:title];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(spacing));
            make.height.equalTo(@(__X(80)));
            make.centerY.equalTo(@0);
            if (index == 0) {
                make.left.equalTo(@(__X(60)));
            }else {
                make.left.equalTo(self.bottomBtns.lastObject.mas_right).offset(__X(60));
            }
        }];
        [self.bottomBtns addObject:btn];
    }
}

- (void)btnClick:(UIButton *)btn {
    if (self.block) {
        self.block([self.bottomBtns indexOfObject:btn]);
    }
}

-(NSMutableArray<UIButton *> *)bottomBtns {
    if (!_bottomBtns) {
        _bottomBtns = [[NSMutableArray alloc]init];
    }
    return _bottomBtns;
}

@end

@interface DYJXNewGroupView : UIView;

@property (nonatomic, strong) UIButton *interiorGroupBtn;
@property (nonatomic, strong) UIButton *externalGroupBtn;
@property (nonatomic, copy) InteriorGroupBlock interiorGroupBlock;
@property (nonatomic, copy) ExternalGroupBlock externalGroupBlock;

@end
@implementation DYJXNewGroupView

-(instancetype)initWithInteriorGroupBlock:(InteriorGroupBlock)interiorGroupBlock externalGroupBlock:(ExternalGroupBlock)externalGroupBlock  {
    self = [super init];
    if (self) {
        [self interiorGroupBtn];
        [self externalGroupBtn];
        self.interiorGroupBlock = interiorGroupBlock;
        self.externalGroupBlock = externalGroupBlock;
    }
    return self;
}

- (void)interiorGroupBtnClick:(UIButton *)btn {
    if (self.interiorGroupBlock) {
        self.interiorGroupBlock();
    }
}

- (void)externalGroupBtnClick:(UIButton *)btn {
    if (self.externalGroupBlock) {
        self.externalGroupBlock();
    }
}

- (UIButton *)interiorGroupBtn {
    if (!_interiorGroupBtn) {
        _interiorGroupBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_interiorGroupBtn];
        [_interiorGroupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(__X(315)));
            make.height.equalTo(@(__X(80)));
            make.centerY.equalTo(@0);
            make.centerX.equalTo(self).multipliedBy(0.5);
        }];
        _interiorGroupBtn.backgroundColor = [UIColor colorWithRed:8/255.0 green:164/255.0 blue:2/255.0 alpha:1];
        [_interiorGroupBtn setTitle:@"新增为内部群" forState:(UIControlStateNormal)];
        [_interiorGroupBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _interiorGroupBtn.titleLabel.font = [UIFont systemFontOfSize:__X(30)];
        [_interiorGroupBtn addTarget:self action:@selector(interiorGroupBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _interiorGroupBtn;
}

- (UIButton *)externalGroupBtn {
    if (!_externalGroupBtn) {
        _externalGroupBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_externalGroupBtn];
        [_externalGroupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(__X(315)));
            make.height.equalTo(@(__X(80)));
            make.centerY.equalTo(@0);
            make.centerX.equalTo(self).multipliedBy(1.5);
        }];
        _externalGroupBtn.backgroundColor = [UIColor colorWithRed:8/255.0 green:164/255.0 blue:2/255.0 alpha:1];
        [_externalGroupBtn setTitle:@"新增为外部群" forState:(UIControlStateNormal)];
        [_externalGroupBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _externalGroupBtn.titleLabel.font = [UIFont systemFontOfSize:__X(30)];
        [_externalGroupBtn addTarget:self action:@selector(externalGroupBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _externalGroupBtn;
}

@end

@interface DYJXNewGroupController ()<UITableViewDelegate,UITableViewDataSource,XYSelectIconPopViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DYJXNewGroupView *addGroupView;
@property (nonatomic, strong) DYJXGroupDetailsView *groupDetailsView;
@property (nonatomic, strong) DYJXNewGroupViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels;
@property (nonatomic, strong) NSMutableArray<DJJXMembers *> *membersArray;

@end

@implementation DYJXNewGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel.groupType = self.groupType;
    [self addGroupView];
    [self tableView];
    [self getGroupInfo];
}

- (void)getGroupInfo {
    if (self.groupType == DYJXGroupType_Details) {
        [self groupDetailsView];
        if (!self.groupId) {
            [YDBAlertView showToast:@"ID为空" dismissDelay:1.0];
            return;
        }
        WeakSelf
        [self.viewModel getGroupInfoWithGroupId:self.groupId Success:^(DYJXXYGroupByIdResponse * _Nonnull response) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        } failed:^(NSString * _Nonnull errorMsg) {
            
        }];
    }else {
        [self addGroupView];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.viewModel.dataArray[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"model"];
    WeakSelf
    if (indexPath.section == 0 && indexPath.row == 0) {
        if (self.groupType == DYJXGroupType_New) {
            DYJXAddCompanyPageHeaderCell *newCell = (DYJXAddCompanyPageHeaderCell *)cell;
            if (self.viewModel.dataArray.firstObject.firstObject.spareImage) {
                newCell.porityImageView.image = self.viewModel.dataArray.firstObject.firstObject.spareImage;
            }
            newCell.block = ^{
                [weakSelf showActionForPhoto];
            };
        }else {
            OwnerImageCell *newCell = (OwnerImageCell *)cell;
            newCell.block = ^{
                [weakSelf showActionForPhoto];
            };
            newCell.qrCcodeblock = ^{
                DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
                qrCodePage.userIdOrCompanyId = weakSelf.groupId;
                qrCodePage.companyNumber = weakSelf.viewModel.response.Result.NumberString;
                qrCodePage.companyName = self.viewModel.response.Result.GroupName;
                [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
            };
        }
    }else if (indexPath.section == 0 && indexPath.row == 4) {
         DYJXAddCompanyPageCell *newCell = (DYJXAddCompanyPageCell *)cell;
        newCell.nextBtnBlock = ^(DYJXAddCompanyPageCell * _Nonnull cell) {
            //TODO: 点击进行下一步操作(群成员)
            DYJXAddGroupMemberPageController *addGroupMemberVC = [[DYJXAddGroupMemberPageController alloc]init];
            if (weakSelf.groupType == DYJXGroupType_Details) {
                addGroupMemberVC.membersArray = [NSArray modelArrayWithClass:[DJJXMembers class] json:weakSelf.viewModel.response.Result.Members].mutableCopy;
            }else {
                addGroupMemberVC.membersArray = weakSelf.membersArray;
            }
            if (weakSelf.viewModel.MemberIds.count > 0) {
                addGroupMemberVC.MemberIds = weakSelf.viewModel.MemberIds;
            }else {
               addGroupMemberVC.MemberIds = weakSelf.viewModel.response.Result.MemberIds.mutableCopy;
            }
            NSIndexPath *index = [tableView indexPathForCell:cell];
            addGroupMemberVC.block = ^(NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels, NSMutableArray<DJJXMembers *> *membersArray, NSMutableArray<NSString *> *MemberIds) {
                weakSelf.membersArray = membersArray;
                weakSelf.memberModels = memberModels;
                weakSelf.viewModel.MemberIds = MemberIds.copy;
                if (memberModels.count > 0) {
                    weakSelf.viewModel.dataArray[index.section][index.row].text = [NSString stringWithFormat:@"群成员（%ld）个",memberModels.count];
                    weakSelf.viewModel.memberModels = memberModels.copy;
                }
                [weakSelf.tableView reloadRowAtIndexPath:index withRowAnimation:(UITableViewRowAnimationAutomatic)];
            };
            [weakSelf.navigationController pushViewController:addGroupMemberVC animated:YES];
        };
    }else if (indexPath.section == 0 && indexPath.row == 9) {
        if (self.groupType == DYJXGroupType_Details) {
            DYJXAddCompanyPageCell *newCell = (DYJXAddCompanyPageCell *)cell;
            WeakSelf
            newCell.otherBtnBlock = ^(DYJXAddCompanyPageCell * _Nonnull cell) {
                NSIndexPath *index = [tableView indexPathForCell:cell];
                [weakSelf.viewModel uploadSlientGroupMsgWithNumberString:weakSelf.viewModel.response.Result.GroupNumber isSlientGroupMsg:weakSelf.viewModel.dataArray[indexPath.section][indexPath.row].isSelected success:^(id  _Nonnull responseObject) {
                    [weakSelf.tableView reloadRowAtIndexPath:index withRowAnimation:(UITableViewRowAnimationAutomatic)];
                } failed:^(NSString * _Nonnull errMsg) {
                    
                }];
            };
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return __X(300);
    }
    return __X(100);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

//弹出选择框
-(void)showActionForPhoto
{
    
    //选择图片时收起键盘
    [self.view endEditing:YES];
    
    XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
    [popView show];
    popView.delegate = self;
}

#pragma mark - XYSelectIconPopViewDelegate
-(void)selectWayIndex:(NSInteger)index {
    WeakSelf
    if (index == 0) { // 打开相册
        [self chooseImagesWithMaxImagesCount:1 photosHandler:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOrinalPhoto) {
            [weakSelf updateLicenseOrHeaderWithImages:photos];
        }];
    }else { // 打开相机
        [self presentCameraPickerControllerCameraImageBlock:^(UIImage *image) {
            [weakSelf updateLicenseOrHeaderWithImages:@[image]];
        }];
    }
}

- (void)updateLicenseOrHeaderWithImages:(NSArray<UIImage *> *)images {
    WeakSelf
    [SVProgressHUD showWithStatus:@"上传中..."];
    [self.viewModel uploadFile:images.firstObject Success:^(id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            [SVProgressHUD dismiss];
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.viewModel.dataArray.firstObject.firstObject.spareImage = images.firstObject;
            weakSelf.viewModel.dataArray.firstObject.firstObject.spareString = responseObject[@"SavedFileName"];
                NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0];
                [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
                });
//                [YDBAlertView showToast:@"图片上传中成功！" dismissDelay:1.0];
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }
    } failed:^(NSString * _Nonnull errorMsg) {
        [YDBAlertView showToast:@"上传失败，请重新上传！" dismissDelay:1.0];
    }];
}

- (void)uploadGroupWithGroupType:(NSInteger)groupType {
    WeakSelf
    if (self.viewModel.dataArray[0][1].text) {
        [self.viewModel uploadGroupWithGroupType:groupType success:^(id  _Nonnull responseObject) {
            [weakSelf popToViewControllerWithGroupType:groupType];
        } failed:^(NSString * _Nonnull errMsg) {
        }];
    }else {
        [YDBAlertView showToast:@"您还没有填写群名称" dismissDelay:1.0];
    }
}

- (void)popToViewControllerWithGroupType:(NSInteger)groupType {
    WeakSelf
    [self.navigationController.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"DJGroupChatPage")]) {
            [weakSelf.navigationController popToViewController:obj animated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:kDYJXAPI_AddInteriorGroup_Notification object:nil userInfo:nil];
            *stop = YES;
        }else if ([obj isKindOfClass:NSClassFromString(@"DJWildGroupsChatPage")]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kDYJXAPI_AddExternalGroup_Notification object:nil userInfo:nil];
            [weakSelf.navigationController popToViewController:obj animated:NO];
            *stop = YES;
        }
    }];
}

#pragma mark - 进入会话
- (void)enterConversion {
    WeakSelf
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [[JSExtension shared] getConversion:weakSelf.groupId FromId:userModel.UserID type:1 DataSuccess:^(id  _Nonnull response) {
        SKResult *respo = (SKResult *)response;
        NIMSessionType type = NIMSessionTypeTeam;
        [JSExtension shared].type = 1;
        if (respo.LastMsg.RowData) {
            NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
            NSDictionary *dic = [body stringToDictionary];
            if (dic[@"extra"]) {
                NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                [JSExtension shared].targetId = dict[@"TargetId"];
                [JSExtension shared].targetName = dict[@"TargetName"];
                [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
                [JSExtension shared].conversionId = respo.LastMsg.ConversationId;
            }
        }
        
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
            chatVC.targetId = respo.TargetId;
            [weakSelf.navigationController pushViewController:chatVC animated:YES];
        }
        else {
            [weakSelf.view makeToast:@"会话ID获取失败"];
        }
    } failed:^(NSString * _Nonnull errorMsg) {
        [weakSelf.view makeToast:@"会话ID获取失败"];
    }];
}

#pragma mark - 退出公司
- (void)exitCompanyWithGroupId:(NSString *)groupId {
    WeakSelf
    [self.viewModel QuitGroupWithGroupId:groupId Success:^(NSString * _Nonnull successMsg) {
        [weakSelf.navigationController popToRootViewControllerAnimated:NO];
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}
#pragma mark - 删除公司
- (void)deleteCompanyWithGroupId:(NSString *)groupId {
    WeakSelf
    [self.viewModel deleteGroupWithGroupId:groupId Success:^(NSString * _Nonnull successMsg) {
        [weakSelf.navigationController popToRootViewControllerAnimated:NO];
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        __weak typeof (self)weakSelf = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            if (weakSelf.groupType == DYJXGroupType_Details) {
                make.bottom.mas_equalTo(weakSelf.groupDetailsView.mas_top).mas_equalTo(0);
            }else {
                make.bottom.mas_equalTo(weakSelf.addGroupView.mas_top).mas_equalTo(0);
            }
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DYJXAddCompanyPageHeaderCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageHeaderCell"];
        [_tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
        [_tableView registerClass:[DYJXAddCompanyPageCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageCell"];
    }
    return _tableView;
}

-(DYJXNewGroupView *)addGroupView {
    if (!_addGroupView) {
        WeakSelf
        _addGroupView = [[DYJXNewGroupView alloc]initWithInteriorGroupBlock:^{
            [weakSelf uploadGroupWithGroupType:1];
        } externalGroupBlock:^{
            [weakSelf uploadGroupWithGroupType:0];
        }];
        _addGroupView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_addGroupView];
        [_addGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(__X(160));
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
    }
    return _addGroupView;
}

-(DYJXGroupDetailsView *)groupDetailsView {
    if (!_groupDetailsView) {
        WeakSelf
        _groupDetailsView = [[DYJXGroupDetailsView alloc]initWithBottomBtnTitles:@[@"进群会话",@"退出该群",@"删除该群"] block:^(NSInteger index) {
            switch (index) {
                case 0:
                    [weakSelf enterConversion];
                    break;
                case 1:
                    [weakSelf exitCompanyWithGroupId:weakSelf.groupId];
                    break;
                case 2:
                    [weakSelf deleteCompanyWithGroupId:weakSelf.groupId];
                    break;
                default:
                    break;
            }
        }];
        [self.view addSubview:_groupDetailsView];
        _groupDetailsView.backgroundColor = [UIColor whiteColor];
        [_groupDetailsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(__X(160));
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
    }
    return _groupDetailsView;
}

-(DYJXNewGroupViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXNewGroupViewModel alloc]init];
    }
    return _viewModel;
}

-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)memberModels {
    if (!_memberModels) {
        _memberModels = [[NSMutableArray alloc]init];
    }
    return _memberModels;
}

-(NSMutableArray<DJJXMembers *> *)membersArray {
    if (!_membersArray) {
        _membersArray = [[NSMutableArray alloc]init];
    }
    return _membersArray;
}

@end
