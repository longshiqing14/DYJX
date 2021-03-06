//
//  DYJXAddCompanyPageController.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageController.h"
#import "DYJXAddCompanyPageCell.h"
#import "ImageUploadCell.h"
#import "XYSelectIconPopView.h"
#import "OwnerImageCell.h"
#import "DYJXQRCodePage.h"
#import "DYJXAddCompanyPageHeaderCell.h"
#import "DYJXAddMemberPage.h"
#import "CompanyBottomView.h"
#import "CompanyAdminBottomView.h"
#import "JSExtension.h"
#import "SubcompanyBottomView.h"
#import "BaiduMapViewController.h"
#import "DYJXCompanyAddressController.h"
#import "DYJXAddSubMemberController.h"
#import "DYJXConversationTabBarController.h"

@interface DYJXAddCompanyPageController ()<UITableViewDelegate,UITableViewDataSource,XYSelectIconPopViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *data;
@property (nonatomic, strong) UIView *submissionView;
@property (nonatomic, strong) UIButton *submissionBtn;
@property (nonatomic, assign) DYJXAddCompanyType companyType;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, assign) BOOL isSelectHeader;
@property(nonatomic, strong) UIImage *headerImage;
@property (nonatomic, strong)DYJXAddCompanyPageViewModel *viewModel;
/** 公司详情请求返回数据 */
@property(nonatomic, strong) DYJXXYGroupByIdResponse *groupByIdResponse;
/** 底部view */
@property(strong, nonatomic) CompanyBottomView *bottomView;
@property(strong, nonatomic) CompanyAdminBottomView *adminBottomView;
@property(strong, nonatomic) SubcompanyBottomView *addCompanyBottomView;

@end

@implementation DYJXAddCompanyPageController

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType {
    return [self initWithCompanyType:companyType groupNumber:@"" targetId:@"" userIconImageURL:@"" isAdmin:NO];
}

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType requestDic:(NSDictionary *)requestDic result:(DYJXXYResult *)result {
    self = [super init];
    if (self) {
        self.companyType = companyType;
        self.viewModel.requestDic = requestDic.mutableCopy;
        self.viewModel.result = result;
    }
    return self;
}

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType groupNumber:(nonnull NSString *)groupNumber targetId:(nonnull NSString *)targetId userIconImageURL:(nonnull NSString *)userIconImageURL isAdmin:(BOOL)isAdmin{
    self = [super init];
    if (self) {
        self.companyType = companyType;
        self.groupNumber = groupNumber;
        self.targetId = targetId;
        self.userIconImageURL = userIconImageURL;
        self.isAdmin = isAdmin;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setUI];
    [self getGroupInfo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCompanyAddressNotification:) name:kDYJXAPI_CompanyAddress_Notification object:nil];
    
}

- (void)setNavigation {
    if (self.companyType == DYJXAddCompanyType_Sub) {
        self.navigationItem.title = @"子公司账号管理";
    }else if (self.companyType == DYJXAddCompanyType_SubDetails) {
        self.navigationItem.title = @"子公司账号管理";
    }else {
        self.navigationItem.title = @"公司账号管理";
    }
    
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(uploadCompany)];
    
    if (self.isAdmin) {
        self.navigationItem.rightBarButtonItem=rightitem;
    }
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];
}

/** 设置UI */
- (void)setUI {
    if (self.companyType == DYJXAddCompanyType_Details ||
        self.companyType == DYJXAddCompanyType_SubDetails) {
        if (self.isAdmin) {
            [self adminBottomView];
        }else {
            [self bottomView];
        }
    }else {
        [self addCompanyBottomView];
    }
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

- (void)changeCompanyAddressNotification:(NSNotification *)noti {
    NSDictionary *userInfo = noti.userInfo;
    NSMutableString *companyAddress = @"".mutableCopy;
    if ([[userInfo allKeys] containsObject:@"ProvinceName"]) {
        [companyAddress insertString:userInfo[@"ProvinceName"] atIndex:companyAddress.length];
    }
    if ([[userInfo allKeys] containsObject:@"CityName"]) {
        [companyAddress insertString:userInfo[@"CityName"] atIndex:companyAddress.length];
    }
    if ([[userInfo allKeys] containsObject:@"DistrictName"]) {
        [companyAddress insertString:userInfo[@"DistrictName"] atIndex:companyAddress.length];
    }
    
    if ([[userInfo allKeys] containsObject:@"ProvinceID"]) {
        self.viewModel.ProvinceId = [((NSNumber *)userInfo[@"ProvinceID"]) stringValue];
    }
    if ([[userInfo allKeys] containsObject:@"CityID"]) {
        self.viewModel.CityId = [((NSNumber *)userInfo[@"CityID"]) stringValue];
    }
    if ([[userInfo allKeys] containsObject:@"DistrictID"]) {
        self.viewModel.DistrictId = [((NSNumber *)userInfo[@"DistrictID"]) stringValue];
    }
    
    self.viewModel.dataArray[1][1].text = companyAddress.copy;
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:1 inSection:1] ;
    [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

- (void)uploadCompany {
    WeakSelf
    [self.viewModel uploadCompanySuccess:^(DYJXXYGroupByIdResponse *response) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failed:^(NSString * errorMsg) {
        [YDBAlertView showToast:errorMsg dismissDelay:1.0];
    }];
}

- (void)getGroupInfo {
    WeakSelf
    if (self.companyType == DYJXAddCompanyType_Details ||
        self.companyType == DYJXAddCompanyType_SubDetails) {
        [self.viewModel getGroupInfoWithGroupId:self.groupNumber Success:^(DYJXXYGroupByIdResponse * _Nonnull groupByIdResponse) {
            weakSelf.groupByIdResponse = groupByIdResponse;
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新
                [weakSelf.tableView reloadData];
            });
        } failed:^(NSString * _Nonnull errorMsg) {
    
        }];
    }else {
        [self viewModel];
    }
}

//弹出选择框
-(void)showActionForPhoto
{
    if (self.imageArray.count == 4 && !self.isSelectHeader) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"最多4张图片" dismissTimeInterval:1.0];
        return;
    }
    
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
        [self chooseImagesWithMaxImagesCount:(self.isSelectHeader ? 1: 1) photosHandler:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOrinalPhoto) {
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
//                [YDBAlertView showToast:@"图片上传中成功！" dismissDelay:1.0];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (weakSelf.isSelectHeader) { // 头像
                        weakSelf.viewModel.dataArray.firstObject.firstObject.spareImage = images.firstObject;
                        weakSelf.viewModel.dataArray.firstObject.firstObject.spareString = responseObject[@"SavedFileName"];
                        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0];
                        if (weakSelf.companyType == DYJXAddCompanyType_Sub ||
                            weakSelf.companyType == DYJXAddCompanyType_None) {
                            DYJXAddCompanyPageHeaderCell *ownerImageCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                            [ownerImageCell.porityImageView setImage:images.firstObject];
                        }else {
                            OwnerImageCell *ownerImageCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                            [ownerImageCell.porityImageView setImage:images.firstObject];
                        }
                    }else {
                        if (weakSelf.companyType == DYJXAddCompanyType_Sub ||
                            weakSelf.companyType == DYJXAddCompanyType_None) {
                            [weakSelf.imageArray addObjectsFromArray:images];
                        }
                        
                        PersonZhiZhaoModel *model = [[PersonZhiZhaoModel alloc]init];
                        model.Name = responseObject[@"SavedFileName"];
                        if (weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray) {
                            model.Title = [NSString stringWithFormat:@"执照图片%ld",weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray.count + 1];
                        }else {
                            model.Title = @"执照图片1";
                        }
                        LPXPhotoModel *photoModel = [[LPXPhotoModel alloc]init];
                        photoModel.photoImage = images.firstObject;
                        photoModel.photo = model;
                        [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray addObject:photoModel];
//                        [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray addObject:model];
                            NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:4] ;
                            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
                    }
                });
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }
    } failed:^(NSString * _Nonnull errorMsg) {
        [YDBAlertView showToast:@"上传中失败，请重新上传！" dismissDelay:1.0];
    }];
}

#pragma mark - 进入会话
- (void)enterConversion {
    WeakSelf
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    [[JSExtension shared] getConversion:weakSelf.targetId FromId:userModel.UserID type:1 DataSuccess:^(id  _Nonnull response) {
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
    [self.viewModel QuitGroupWithGroupId:groupId Success:^(DYJXXYGroupByIdResponse *response) {
        [weakSelf.navigationController popViewControllerAnimated:NO];
    } failed:^(NSString *errorMsg) {
        
    }];
}
#pragma mark - 删除公司
- (void)deleteCompanyWithGroupId:(NSString *)groupId {
    WeakSelf
    [self.viewModel deleteGroupWithGroupId:groupId Success:^(DYJXXYGroupByIdResponse *response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popViewControllerAnimated:NO];
        });
    } failed:^(NSString *errorMsg) {
        
    }];
}

#pragma mark - （子）公司所属省市
- (void)getCompanyAddressProvinces {
    WeakSelf
    [SVProgressHUD showWithStatus:@"加载中..."];
    [self.viewModel getProvincesWithSuccess:^(DYJXAddressModel * _Nonnull addressModel) {
        [SVProgressHUD dismiss];
        if (addressModel.Succeed) {
            DYJXCompanyAddressController *companyAddressVC = [[DYJXCompanyAddressController alloc]initWithAddressModel:addressModel addressType:(DYJXCompanyAddressType_Province) addressParameters:@{}.copy];
            [weakSelf.navigationController pushViewController:companyAddressVC animated:YES];
        }else {
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } failed:^(NSString * _Nonnull errorMsg) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}
#pragma mark 定位开启可以到百度地图
- (void)pushViewControllerWithIndexPath:(NSIndexPath *)indexPath {
    WeakSelf
    DYJXAddCompanyPageCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
    CLLocationCoordinate2D centerCoordinate = {0,0};
    BaiduMapViewController *baiduMapVC = [[BaiduMapViewController alloc]initWithCenterCoordinate:centerCoordinate poiAddressBlock:^(CLLocationCoordinate2D centerCoordinate, NSString *name) {
        newCell.model.text = name;
        weakSelf.viewModel.Latitude = [@(centerCoordinate.latitude) stringValue];
        weakSelf.viewModel.Longitude = [@(centerCoordinate.longitude) stringValue];
        [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }];
    [self.navigationController pushViewController:baiduMapVC animated:YES];
}

#pragma mark 定位没开启设置定位权限
- (void)setLocationAuthorization {
    WeakSelf
    [UIAlertController alertWithTitle:@"定位权限没有开启" message:@"当前定位权限没有开启无法定位，请你去设置定位权限" preferredStyle:(UIAlertControllerStyleAlert) cancelActionTitle:@"取消" defaultActionTitle:@[@"去设置"] defaultActionBlock:^(UIAlertAction *action) {
        [weakSelf setupAuthorization];
    }];
}

- (void)setupAuthorization {
    if (iOS8Later) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    } else {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}



#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.viewModel.dataArray[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    if ([cell isKindOfClass:[OwnerImageCell class]] ||
        [cell isKindOfClass:[ImageUploadCell class]]) {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"cellmodel"];
    }else {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"model"];
    }
    
    WeakSelf
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.userInteractionEnabled = YES;
        if (self.companyType == DYJXAddCompanyType_None ||
            self.companyType == DYJXAddCompanyType_Sub) {
            DYJXAddCompanyPageHeaderCell *newCell = (DYJXAddCompanyPageHeaderCell *)cell;
            if (self.viewModel.dataArray.firstObject.firstObject.spareImage) {
                newCell.porityImageView.image = self.viewModel.dataArray.firstObject.firstObject.spareImage;
            }
            
            newCell.block = ^{
                weakSelf.isSelectHeader = YES;
                [weakSelf showActionForPhoto];
            };
        }else {
            OwnerImageCell *newCell = (OwnerImageCell *)cell;
            newCell.block = ^{
//                if (weakSelf.companyType != DYJXAddCompanyType_SubDetails) {
                    weakSelf.isSelectHeader = YES;
                    [weakSelf showActionForPhoto];
//                }
            };
            
            newCell.qrCcodeblock = ^{
                DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
                qrCodePage.userIdOrCompanyId = self.groupNumber;
                qrCodePage.companyNumber = self.groupByIdResponse.Result.NumberString;
                qrCodePage.companyName = self.groupByIdResponse.Result.GroupName;
                [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
            };
        }
    }else if (indexPath.section == self.viewModel.dataArray.count - 1) {
        ImageUploadCell *newCell = (ImageUploadCell *)cell;
        newCell.imagesArray = [self.imageArray mutableCopy];
        newCell.addPicturesBlock = ^{
            //TODO: 添加图片
            weakSelf.isSelectHeader = NO;
            [weakSelf showActionForPhoto];
        };
        newCell.deleteImageBlock = ^(NSInteger index) {
            //TODO: 删除图片
            if (weakSelf.companyType == DYJXAddCompanyType_Sub ||
                weakSelf.companyType == DYJXAddCompanyType_None) {
                [weakSelf.imageArray removeObjectAtIndex:index];
            }
            [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray removeObjectAtIndex:index];
            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
    }else {
        DYJXAddCompanyPageCell *newCell = (DYJXAddCompanyPageCell *)cell;
        newCell.nextBtnBlock = ^(DYJXAddCompanyPageCell * _Nonnull cell) {
            //TODO: 点击进行下一步操作
            NSIndexPath *indexPath = [tableView indexPathForCell:cell];
            if (indexPath.section == 0 && (indexPath.row == 4 || indexPath.row == 5)) {
                
                if ((weakSelf.companyType == DYJXAddCompanyType_SubDetails ||
                    weakSelf.companyType == DYJXAddCompanyType_Details) && [cell.model.leftViewText containsString:@"子公司"]) {
                    //TODO: 子公司成员
                    DYJXAddSubMemberController *addSubMemberVC = [[DYJXAddSubMemberController alloc]initWithCompanyResult:self.groupByIdResponse.Result];
                    [self.navigationController pushViewController:addSubMemberVC animated:YES];
                }else {
                    //TODO: （子）公司成员
                    DYJXAddMemberPage *addMemberPage = [[DYJXAddMemberPage alloc]init];
                    if ([cell.model.leftViewText containsString:@"子公司"]) {
                        addMemberPage.membersArray = [[NSArray modelArrayWithClass:[DJJXMembers class] json:self.groupByIdResponse.Result.Children] mutableCopy];
                    }else {
                        addMemberPage.membersArray = [[NSArray modelArrayWithClass:[DJJXMembers class] json:self.groupByIdResponse.Result.Members] mutableCopy];
                    }
                    addMemberPage.adminArray = [[NSArray modelArrayWithClass:[DJJXMembers class] json:self.groupByIdResponse.Result.AdminUsers] mutableCopy];
                    [weakSelf.navigationController pushViewController:addMemberPage animated:YES];
                }
            }else if (indexPath.section == 0 && indexPath.row == 5) {
                
            }else if (indexPath.section == 1 && indexPath.row == 1) {
                //TODO: 公司地址
                [weakSelf getCompanyAddressProvinces];
            }else if (indexPath.section == 1 && indexPath.row == 3) {
                //TODO: 公司GPS位置
                [weakSelf requestAuthorizationWithCompletionHandler:^(BOOL granted) {
                    if (granted) {
                        [weakSelf pushViewControllerWithIndexPath:indexPath];
                    }else {
                        [weakSelf setLocationAuthorization];
                    }
                }];
            }
        };
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == (self.viewModel.dataArray.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth, __X(100))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(36)];
        lb.text = @"公司名片、相片或营业执照等";
        return lb;
    }else {
        return [UIView new];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == (self.viewModel.dataArray.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth - __X(50), __X(260))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(26)];
        lb.text = @"用户可用商号ID、手机号进行登录；商号ID由平台在永华注册时自动分配；银行账号可使用于用户收付款，请准确填写";
        lb.numberOfLines = 0;
        return lb;
    }else {
        return [[UIView alloc]init];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return __X(300);
    }else if (indexPath.section == self.viewModel.dataArray.count - 1) {
        return __X(240);
    }
    return __X(100);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f;
    }else if (section != (self.viewModel.dataArray.count - 1)) {
        return __X(40);
    }else {
      return __X(180);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == (self.viewModel.dataArray.count - 1)) {
        return __X(260);
    }
    return 0.01f;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        WeakSelf
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (weakSelf.companyType == DYJXAddCompanyType_Details ||
                weakSelf.companyType == DYJXAddCompanyType_SubDetails) {
                if (weakSelf.isAdmin) {
                    make.left.top.right.mas_equalTo(0);
                    make.bottom.mas_equalTo(weakSelf.adminBottomView.mas_top).mas_equalTo(0);
                }else {
                    make.left.top.right.mas_equalTo(0);
                    make.bottom.mas_equalTo(weakSelf.bottomView.mas_top).mas_equalTo(0);
                }
            }else {
                make.left.top.right.mas_equalTo(0);
                make.bottom.mas_equalTo(weakSelf.addCompanyBottomView.mas_top).mas_equalTo(0);
            }
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1];
        [_tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
        [_tableView registerClass:[DYJXAddCompanyPageHeaderCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageHeaderCell"];
        [_tableView registerClass:[DYJXAddCompanyPageCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageCell"];
        [_tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    }
    return _tableView;
}

- (NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc]init];
    }
    return _data;
}

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}

-(DYJXAddCompanyPageViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXAddCompanyPageViewModel alloc] initWithCompanyType:self.companyType];
    }
    return _viewModel;
}

- (DYJXXYGroupByIdResponse *)groupByIdResponse {
    if (!_groupByIdResponse) {
        _groupByIdResponse = [[DYJXXYGroupByIdResponse alloc]init];
    }
    return _groupByIdResponse;
}

- (CompanyBottomView *)bottomView{
    WeakSelf
    if (!_bottomView) {
        _bottomView = [[NSBundle mainBundle] loadNibNamed:@"CompanyBottomView" owner:self options:nil].firstObject;
        [self.view addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        _bottomView.enterConversionBlock = ^{
            // TODO:进群会话
//            [weakSelf enterConversion];
            if (weakSelf.isFromMyCompany) {
                if (weakSelf.navigationController.viewControllers.count >= 2) {
                    UIViewController *vc = [weakSelf.navigationController.viewControllers objectOrNilAtIndex:1];
                    [weakSelf.navigationController popToViewController:vc animated:YES];
                    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]];
                    [XYKeyWindow.rootViewController presentViewController:conversationTabBarController animated:YES completion:nil];
                    [conversationTabBarController setSelectedIndex:2];
                }
                return ;
            }else{
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]];
                    [XYKeyWindow.rootViewController presentViewController:conversationTabBarController animated:YES completion:nil];
                    [conversationTabBarController setSelectedIndex:2];
            }
        };
        _bottomView.exitCompanyBlock = ^{
            // TODO:退出账号
            [weakSelf exitCompanyWithGroupId:weakSelf.groupNumber];
        };
    }
    return _bottomView;
}

- (CompanyAdminBottomView *)adminBottomView{
    WeakSelf
    if (!_adminBottomView) {
        _adminBottomView = [[NSBundle mainBundle] loadNibNamed:@"CompanyAdminBottomView" owner:self options:nil].firstObject;
        [self.view addSubview:_adminBottomView];
        [_adminBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        _adminBottomView.enterConversionBlock = ^{
            // TODO:进群会话
//            [weakSelf enterConversion];
            if (weakSelf.isFromMyCompany) {
                if (weakSelf.navigationController.viewControllers.count >= 2) {
                    UIViewController *vc = [weakSelf.navigationController.viewControllers objectOrNilAtIndex:1];
                    [weakSelf.navigationController popToViewController:vc animated:YES];
                    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]];
                    [XYKeyWindow.rootViewController presentViewController:conversationTabBarController animated:YES completion:nil];
                    [conversationTabBarController setSelectedIndex:2];
                }
                return ;
            }else{
                [weakSelf.navigationController popViewControllerAnimated:YES];

                    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]];
                    [XYKeyWindow.rootViewController presentViewController:conversationTabBarController animated:YES completion:nil];
                    [conversationTabBarController setSelectedIndex:2];
                
            }
        };
        
        _adminBottomView.exitCompanyBlock = ^{
            // TODO:退出公司
            [weakSelf exitCompanyWithGroupId:weakSelf.groupNumber];
        };
        
        _adminBottomView.deleteCompanyBlock = ^{
            // TODO:删除公司
            [weakSelf deleteCompanyWithGroupId:weakSelf.groupNumber];
        };
    }
    return _adminBottomView;
}

- (SubcompanyBottomView *)addCompanyBottomView {
    if (!_addCompanyBottomView) {
        _addCompanyBottomView = [[NSBundle mainBundle] loadNibNamed:@"SubcompanyBottomView" owner:self options:nil].firstObject;
        [self.view addSubview:_addCompanyBottomView];
        [_addCompanyBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        WeakSelf
        [_addCompanyBottomView setSubcompanyBottomBtnWithTitle:@"提交"];
        [_addCompanyBottomView setSubcompanyBottomBtnWithBackgroundColor:[UIColor colorWithRed:240/255.0 green:176/255.0 blue:67/255.0 alpha:1]];
        _addCompanyBottomView.block = ^{
            //TODO: 提交数据
            [weakSelf uploadCompany];
        };
    }
    return _addCompanyBottomView;
}

@end
