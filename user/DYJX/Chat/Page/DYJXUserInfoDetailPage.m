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
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(CommitUserInfo) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
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
                    CLLocationCoordinate2D centerCoordinate = {0,0};
                    BaiduMapViewController *baiduMapVC = [[BaiduMapViewController alloc]initWithCenterCoordinate:centerCoordinate poiAddressBlock:^(CLLocationCoordinate2D centerCoordinate, NSString *name) {
                        cell.model.text = name;
                        weakSelf.Latitude = [@(centerCoordinate.latitude) stringValue];
                        weakSelf.Longitude = [@(centerCoordinate.longitude) stringValue];
                        [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
                    }];
                    [weakSelf.navigationController pushViewController:baiduMapVC animated:YES];
                }
            };
        }
    }
    
    
//    UITableViewCell *cell = nil;
//    if (indexPath.section == 0) {
//        switch (indexPath.row) {
//            case 0:
//            {
//                OwnerImageCell *ownerImageCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelPorityCellId forIndexPath:indexPath];
//                if ([self.headerImage CGImage]) {
//                    [ownerImageCell.porityImageView setImage:self.headerImage];
//                }else{
////                    [ownerImageCell.porityImageView setImageWithURL:[NSURL URLWithString:self.userIconImageURL] placeholder:[UIImage imageNamed:@"btn_group"]];
//                    [ownerImageCell.porityImageView setImageWithURL:[NSURL URLWithString:[self.personInfoModel.Business.IMInfo.HeadImgUrl XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
//                }
//                ownerImageCell.block = ^{
//                    weakSelf.isSelectHeader = YES;
//                    [weakSelf showActionForPhoto];
//                };
//                ownerImageCell.qrCcodeblock = ^{
//                    DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
//                    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
//                    qrCodePage.userIdOrCompanyId = userModel.UserID;
//                    qrCodePage.companyNumber = self.personInfoModel.NumberString;
//                    qrCodePage.companyName = self.personInfoModel.NumberString;
//                    [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
//                };
//                cell = ownerImageCell;
//            }
//                break;
//            case 1:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"shanghao"]];
//                titleAndContentCell.contentLb.userInteractionEnabled = NO;
//                titleAndContentCell.contentLb.text = self.personInfoModel.NumberString;
//                cell = titleAndContentCell;
//            }
//                break;
//            case 2:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"phone"]];
////                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.userInteractionEnabled = NO;
//                titleAndContentCell.contentLb.text = self.personInfoModel.Cellphone;
//                cell = titleAndContentCell;
//
//            }
//                break;
//
//
//            default:
//                break;
//        }
//    }else if(indexPath.section == 1){
//        switch (indexPath.row) {
//
//            case 0:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"person_orange"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.NickName;
//                self.NickNameTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//            case 1:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"sign"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonRemark;
//                self.PersonRemarkTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            case 2:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"id"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.TrueName;
//                self.TrueNameTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            case 3:
//            {
//                TitleAndContentArrowCell *titleAndContentArrowCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentArrowCell forIndexPath:indexPath];
//                [titleAndContentArrowCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
//                titleAndContentArrowCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentArrowCell.contentLb.text = self.personInfoModel.Business.IMInfo.PCDName;
//                self.PCDNameTF = titleAndContentArrowCell.contentLb;
//                cell = titleAndContentArrowCell;
//            }
//                break;
//
//            case 4:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.Address;
//                self.AddressTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            case 5:
//            {
//                TitleAndContentArrowCell *titleAndContentArrowCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentArrowCell forIndexPath:indexPath];
//                [titleAndContentArrowCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
//                titleAndContentArrowCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentArrowCell.contentLb.text = self.personInfoModel.Business.IMInfo.GPSAddress;
//                self.GPSAddressTF = titleAndContentArrowCell.contentLb;
//                cell = titleAndContentArrowCell;
//            }
//                break;
//
//            case 6:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"share_qq"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonQQ;
//                self.PersonQQTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            case 7:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"share_weixin"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonWeiXin;
//                self.PersonWeiXinTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            case 8:
//            {
//                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"alipay"]];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonAlipay;
//                self.PersonAlipayTF = titleAndContentCell.contentLb;
//                cell = titleAndContentCell;
//            }
//                break;
//
//            default:
//                break;
//        }
//    }else if(indexPath.section == 2){
//        TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
//        [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"unionpay"]];
//        titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
//        cell = titleAndContentCell;
//        if (indexPath.row == 0) {
//            titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonBank;
//            self.PersonBankTF = titleAndContentCell.contentLb;
//        }else if(indexPath.row == 1){
//            titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonBankCardNo;
//            self.PersonBankCardNoTF = titleAndContentCell.contentLb;
//        }else{
//            titleAndContentCell.contentLb.text = self.personInfoModel.Business.IMInfo.PersonBankName;
//            self.PersonBankNameTF = titleAndContentCell.contentLb;
//        }
//    }else if(indexPath.section == 3){
//        ImageUploadCell *imageUploadCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelImageUploadCell forIndexPath:indexPath];
////        imageUploadCell.contentLab.text = [self.viewModel contentWithIndexPath:indexPath];
//        imageUploadCell.imagesArray = [self.imgArr mutableCopy];
//        imageUploadCell.addPicturesBlock = ^(){
//             weakSelf.isSelectHeader = NO;
//            [weakSelf showActionForPhoto];
//        };
//        imageUploadCell.deleteImageBlock = ^(NSInteger index) {
//            [weakSelf.imgArr removeObjectAtIndex:index];
//
//            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
//        };
//        cell = imageUploadCell;
//    }
    
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
//    if (self.imgArr.count == 4) {
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"最多4张图片" dismissTimeInterval:1.0];
//        return;
//    }
    
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
                model.Title = [NSString stringWithFormat:@"执照图片%ld",weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray.count + 1];
            }else {
                model.Title = @"执照图片1";
            }
            [weakSelf.viewModel.dataArray.lastObject.lastObject.spareArray addObject:model];
            NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:3] ;
            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        } failed:^(NSString *errorMsg) {
            
        }];
        
//        [self.imgArr addObject:image];
//
//        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:3] ;
//        [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }

}


- (void)CommitUserInfo{
    WeakSelf;
    
    if (self.imgArr.count != 0) {
        //上传执照
        [weakSelf uploadImgArr];
    }else{
        if([weakSelf.headerImage CGImage]){
            //上传个人头像
            [weakSelf uploadHeaderImg];
        }else{
            //提交用户信息
            [weakSelf UpdateIMUserInfo];
        }
    }

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
