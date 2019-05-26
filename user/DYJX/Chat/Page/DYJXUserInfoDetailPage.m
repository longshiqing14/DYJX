//
//  DYJXUserInfoDetailPage.m
//  user
//
//  Created by 岩  熊 on 2018/11/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXUserInfoDetailPage.h"
#import "DYJXUserInfoDetailViewModel.h"
#import "OwnerImageCell.h"
#import "SampleButtonTableViewCell.h"
#import "TitleAndContentCell.h"
#import "SpaceFooter.h"
#import "ImageUploadCell.h"
#import "BusinessLicenceFooter.h"
#import "TipsFooter.h"
#import "TitleAndContentArrowCell.h"
#import "DYJXUserInfoModel.h"
#import "DYJXQRCodePage.h"
#import "XYSelectIconPopView.h"
#import "DYJXCompanyAddressController.h"
#import "BaiduMapViewController.h"

static NSString *kGroupDetailModelTipsFooter = @"kGroupDetailModelTipsFooter";
static NSString *kGroupDetailModelBusinessLicenceFooter = @"kGroupDetailModelBusinessLicenceFooter";
static NSString *kGroupDetailModelSpaceFooter = @"kGroupDetailModelSpaceFooter";

static NSString *kGroupDetailModelTitleAndContentArrowCell =  @"kGroupDetailModelTitleAndContentArrowCell";
@interface DYJXUserInfoDetailPage ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,XYSelectIconPopViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)DYJXUserInfoDetailViewModel *viewModel;

@property(strong,nonatomic) NSMutableArray *imgArr ;
@property(nonatomic, strong) UIImage *headerImage;
@property(nonatomic, assign) BOOL isSelectHeader;

@property(strong,nonatomic) NSMutableArray<NSString*> *imgNameArr ;
@property(nonatomic, copy) NSString *HeadImgUrl;
@property(nonatomic, strong) UITextField *AddressTF;
@property(nonatomic, strong) UITextField *GPSAddressTF;
@property(nonatomic, copy) NSString *Latitude;
@property(nonatomic, copy) NSString *Longitude;
@property (nonatomic, copy) NSString *ProvinceId;
@property (nonatomic, copy) NSString *DistrictId;
@property (nonatomic, copy) NSString *CityId;
@property(nonatomic, strong) UITextField *NickNameTF;
@property(nonatomic, strong) UITextField *PCDNameTF;
@property(nonatomic, strong) UITextField *PersonAlipayTF;
@property(nonatomic, strong) UITextField *PersonBankTF;
@property(nonatomic, strong) UITextField *PersonBankCardNoTF;
@property(nonatomic, strong) UITextField *PersonBankNameTF;
@property(nonatomic, strong) UITextField *PersonQQTF;
@property(nonatomic, strong) UITextField *PersonRemarkTF;
@property(nonatomic, strong) UITextField *PersonWeiXinTF;
@property(nonatomic, strong) UITextField *TrueNameTF;
@property(nonatomic, strong) DYJXUserInfoModel *personInfoModel;
@end

@implementation DYJXUserInfoDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSelectHeader = NO;
    [self initNavigation];
    [self.view addSubview:self.tableView];
    [self registerTableViewCell];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    [self getUserInfo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCompanyAddressNotification:) name:kDYJXAPI_CompanyAddress_Notification object:nil];
}

- (void)getUserInfo{
    WeakSelf;
    [self.viewModel getUserInfoSuccess:^(DYJXUserInfoModel *personInfoModel) {
        weakSelf.personInfoModel = personInfoModel;
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            //回调或者说是通知主线程刷新，
            [weakSelf.tableView reloadData];
        });
//        NSArray *imageNamearray = [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:personInfoModel.Business.IMInfo.Images];
//        if (imageNamearray.count > 0) {
//            [imageNamearray enumerateObjectsUsingBlock:^(PersonZhiZhaoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//                dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                    // 处理耗时操作的代码块...
//                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[obj.Name XYImageURL]]]];
//                    if (image) {
//                        [weakSelf.imgArr addObject:image];
//                    }
//                    //通知主线程刷新
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        //回调或者说是通知主线程刷新，
//                        [weakSelf.tableView reloadData];
//                    });
//
//                });
//            }];
//        }else {
//            //通知主线程刷新
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //回调或者说是通知主线程刷新，
//                [weakSelf.tableView reloadData];
//            });
//        }
        
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (void)registerTableViewCell{
    [self.tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
    [self.tableView registerClass:[SampleButtonTableViewCell class] forCellReuseIdentifier:kGroupDetailModelSampleCellId];
    [self.tableView registerClass:[TitleAndContentCell class] forCellReuseIdentifier:kGroupDetailModelTitleAndContentCell];
    [self.tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    [self.tableView registerClass:[TitleAndContentArrowCell class] forCellReuseIdentifier:kGroupDetailModelTitleAndContentArrowCell];
    
    
    [self.tableView registerClass:[TipsFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelTipsFooter];
    [self.tableView registerClass:[BusinessLicenceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelBusinessLicenceFooter];
    [self.tableView registerClass:[SpaceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelSpaceFooter];
    
}

-(void)setType:(XJGroupType)type {
    //    if (_type != type) {
    _type = type;
    NSArray *titles = @[@"本人账户管理",@"公司账户管理",@"信息查看"];
    self.navigationItem.title = titles[(int)type];
    //    }
}

- (void)initNavigation{
    self.title = @"本人账号管理";
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
        self.ProvinceId = [((NSNumber *)userInfo[@"ProvinceID"]) stringValue];
    }
    if ([[userInfo allKeys] containsObject:@"CityID"]) {
        self.CityId = [((NSNumber *)userInfo[@"CityID"]) stringValue];
    }
    if ([[userInfo allKeys] containsObject:@"DistrictID"]) {
        self.DistrictId = [((NSNumber *)userInfo[@"DistrictID"]) stringValue];
    }
    
    
    self.viewModel.dataArray[1][3].text = companyAddress.copy;
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:3 inSection:1] ;
    [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfCell:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.viewModel.dataArray[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == self.viewModel.dataArray.count - 1) {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"cellmodel"];
        ImageUploadCell *imageUploadCell = (ImageUploadCell *)cell;
        imageUploadCell.imagesArray = [self.imgArr mutableCopy];
        imageUploadCell.addPicturesBlock = ^(){
             weakSelf.isSelectHeader = NO;
            [weakSelf showActionForPhoto];
        };
        imageUploadCell.deleteImageBlock = ^(NSInteger index) {
            
            //TODO: 删除图片
            [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray removeObjectAtIndex:index];
            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
            
//            [weakSelf.imgArr removeObjectAtIndex:index];
//
//            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
    }else {
        [cell setValue:self.viewModel.dataArray[indexPath.section][indexPath.row] forKey:@"model"];
        if (indexPath.section == 0 && indexPath.row == 0) {
            OwnerImageCell *ownerImageCell = (OwnerImageCell *)cell;
            if ([self.headerImage CGImage]) {
                [ownerImageCell.porityImageView setImage:self.headerImage];
            }else{
//                    [ownerImageCell.porityImageView setImageWithURL:[NSURL URLWithString:self.userIconImageURL] placeholder:[UIImage imageNamed:@"btn_group"]];
                [ownerImageCell.porityImageView setImageWithURL:[NSURL URLWithString:[self.personInfoModel.Business.IMInfo.HeadImgUrl XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
            }
            ownerImageCell.block = ^{
                weakSelf.isSelectHeader = YES;
                [weakSelf showActionForPhoto];
            };
            ownerImageCell.qrCcodeblock = ^{
                DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
                DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
                qrCodePage.userIdOrCompanyId = userModel.UserID;
                qrCodePage.companyNumber = self.personInfoModel.NumberString;
                qrCodePage.companyName = self.personInfoModel.NumberString;
                [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
            };
        }else if (indexPath.section == 1 && (indexPath.row == 3 || indexPath.row == 5)) {
            TitleAndContentArrowCell *newCell = (TitleAndContentArrowCell *)cell;
            newCell.nextBtnBlock = ^(TitleAndContentArrowCell *cell) {
                //TODO: 点击进行下一步操作
                NSIndexPath *index = [tableView indexPathForCell:cell];
                if (index.row == 3 && index.section == 1) {
                    [weakSelf getCompanyAddressProvinces];
                }else if (index.row == 5 && index.section == 1) {
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
        return 50;
    }else if (indexPath.section == 1 || indexPath.section == 2){
        return 50;
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

#pragma mark 定位开启可以到百度地图
- (void)pushViewControllerWithIndexPath:(NSIndexPath *)indexPath {
    WeakSelf
    TitleAndContentArrowCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
    CLLocationCoordinate2D centerCoordinate = {0,0};
    BaiduMapViewController *baiduMapVC = [[BaiduMapViewController alloc]initWithCenterCoordinate:centerCoordinate poiAddressBlock:^(CLLocationCoordinate2D centerCoordinate, NSString *name) {
        newCell.model.text = name;
        weakSelf.Latitude = [@(centerCoordinate.latitude) stringValue];
        weakSelf.Longitude = [@(centerCoordinate.longitude) stringValue];
        [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }];
    [weakSelf.navigationController pushViewController:baiduMapVC animated:YES];
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


//弹出选择框
-(void)showActionForPhoto
{
    if (self.imgArr.count == 4 && !self.isSelectHeader) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"最多4张图片" dismissTimeInterval:1.0];
        return;
    }
    
    //选择图片时收起键盘
    [self.view endEditing:YES];
    
    XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
    [popView show];
    popView.delegate = self;
}

-(void)selectWayIndex:(NSInteger)index
{
    if (index == 0) {//选择照片
        
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.navigationBar.barTintColor = XYBlackColor;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.delegate = self;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
            
        }else
        {
            [YDBAlertView showToast:@"没有获取到相册权限，请到设置中重新设置" dismissDelay:1.0];
        }
        
        
        
    }else//拍照
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear] &&[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.navigationBar.barTintColor = XYBlackColor;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
            
        }else
        {
            [YDBAlertView showToast:@"获取相机权限失败" dismissDelay:1.0];
            
        }
        
    }
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (self.isSelectHeader) {
        self.headerImage = image;
        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0];
        OwnerImageCell *ownerImageCell = [self.tableView cellForRowAtIndexPath:indexPath];
        [ownerImageCell.porityImageView setImage:image];
        
    }else{
        WeakSelf
        [self.viewModel uploadFile:image Success:^(id  _Nullable responseObject) {
            PersonZhiZhaoModel *model = [[PersonZhiZhaoModel alloc]init];
            model.Name = responseObject[@"SavedFileName"];
            if (weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray) {
                model.Title = [NSString stringWithFormat:@"执照图片%u",weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray.count + 1];
            }else {
                model.Title = @"执照图片1";
            }
            LPXPhotoModel *photoModel = [[LPXPhotoModel alloc]init];
            photoModel.photoImage = image;
            photoModel.photo = model;
            [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray addObject:photoModel];
//            [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray addObject:model];
            NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:3] ;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
            });
            
        } failed:^(NSString *errorMsg) {
            
        }];
    }
}

- (void)CommitUserInfo{
    WeakSelf;
    
//    if (self.imgArr.count != 0) {
//        //上传执照
//        [weakSelf uploadImgArr];
//    }else{
        if([weakSelf.headerImage CGImage]){
            //上传个人头像
            [weakSelf uploadHeaderImg];
        }else{
            //提交用户信息
            [weakSelf UpdateIMUserInfo];
        }
//    }

}

//上传个人头像
-(void)uploadHeaderImg{
    WeakSelf;
    [weakSelf.viewModel uploadFile:self.headerImage Success:^(id  _Nullable responseObject) {
        
        weakSelf.HeadImgUrl = [responseObject objectForKey:@"SavedFileName"];
        //提交用户信息
        [weakSelf UpdateIMUserInfo];
    } failed:^(NSString *errorMsg) {
       
    }];
}

//上传营业执照
-(void)uploadImgArr{
    WeakSelf;
    dispatch_queue_t queue = dispatch_queue_create("uploadImg", NULL);
    
    __block NSInteger updateImageNumUp = 0;

    for (NSInteger i=0; i<self.imgArr.count; i++) {
        dispatch_sync(queue, ^{
            [weakSelf.viewModel uploadFile:self.imgArr[i] Success:^(id  _Nullable responseObject) {
                    updateImageNumUp ++;
                    [weakSelf.imgNameArr addObject:[responseObject objectForKey:@"SavedFileName"]];
                    if (updateImageNumUp == self.imgArr.count) {
//                    [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"图片全部上传成功" dismissTimeInterval:1.0];
                        if([weakSelf.headerImage CGImage]){
                            //上传个人头像
                            [weakSelf uploadHeaderImg];
                        }else{
                            //提交用户信息
                            [weakSelf UpdateIMUserInfo];
                        }
                        
                    }else{
                        
                    }
               
            } failed:^(NSString *errorMsg) {
               
            }];
            
        });
    }
    
}

//提交个人信息
- (void)UpdateIMUserInfo{
    WeakSelf;
    NSMutableDictionary *requstDic = [NSMutableDictionary dictionary];
    __block NSMutableArray *iamgeNameArray = [NSMutableArray array];

    /*@property(strong,nonatomic) NSMutableArray<NSString*> *imgNameArr ;*/
    if (self.HeadImgUrl) {
        [requstDic setObject:self.HeadImgUrl forKey:@"HeadImgUrl"];
    }
    [requstDic addEntriesFromDictionary:[self.viewModel getUpDataParameters]];
    if (![YWDTools isNil:self.Latitude]) {
        [requstDic setObject:@([self.Latitude floatValue]) forKey:@"Latitude"];
    }
    if (![YWDTools isNil:self.Longitude]) {
        [requstDic setObject:@([self.Longitude floatValue]) forKey:@"Longitude"];
    }
    
    if (![YWDTools isNil:self.ProvinceId]) {
        [requstDic setObject:@([self.ProvinceId integerValue]) forKey:@"ProvinceId"];
    }
    
    if (![YWDTools isNil:self.CityId]) {
        [requstDic setObject:@([self.CityId integerValue]) forKey:@"CityId"];
    }
    
    if (![YWDTools isNil:self.DistrictId]) {
        [requstDic setObject:@([self.DistrictId integerValue]) forKey:@"DistrictId"];
    }
//    if (self.imgNameArr.count > 0){
//        [self.imgNameArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//             NSMutableDictionary *imageNameDic = [NSMutableDictionary dictionary];
//
//            [imageNameDic setObject:obj forKey:@"Name"];
//            [imageNameDic setObject:[NSString stringWithFormat:@"执照照片%ld",idx + 1] forKey:@"Title"];
//            [iamgeNameArray addObject:imageNameDic];
//
//        }];
//    }
//    [requstDic setObject:[iamgeNameArray mj_JSONString] forKey:@"Images"];

    [self.viewModel.requestDic setObject:requstDic forKey:@"Data"];
    [self.viewModel CommitUserInfoSuccess:^{
        [YDBAlertView showToast:@"提交成功"];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failed:^(NSString *errorMsg) {
        
    }];
}


#pragma mark - UI
-(DYJXUserInfoDetailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXUserInfoDetailViewModel alloc] init];
    }
    return _viewModel;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delaysContentTouches = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)imgArr
{
    if (!_imgArr) {
        _imgArr = [NSMutableArray array];
    }
    return _imgArr;
}

- (NSMutableArray<NSString *> *)imgNameArr{
    if (!_imgNameArr) {
        _imgNameArr = [NSMutableArray array];
    }
    return _imgNameArr;
}

- (UIImage *)headerImage{
    if (!_headerImage) {
        _headerImage = [[UIImage alloc]init];
    }
    return _headerImage;
}

- (DYJXUserInfoModel *)personInfoModel{
    if (!_personInfoModel) {
        _personInfoModel = [[DYJXUserInfoModel alloc]init];
    }
    return _personInfoModel;
}
@end
