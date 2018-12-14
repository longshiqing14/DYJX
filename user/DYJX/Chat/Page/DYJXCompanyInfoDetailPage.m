//
//  DYJXCompanyInfoDetailPage.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXCompanyInfoDetailPage.h"
#import "DYJXCompanyInfoDetailViewModel.h"
#import "OwnerImageCell.h"
#import "CompanyTitleAndContentCell.h"
#import "SpaceFooter.h"
#import "ImageUploadCell.h"
#import "BusinessLicenceFooter.h"
#import "TipsFooter.h"
#import "XYSelectIconPopView.h"
#import "CompanyBottomView.h"
#import "CompanyAdminBottomView.h"
#import "CompanyTitleAndSelcetedArrowCell.h"
#import "CompanyTitleAndArrowCell.h"
#import "DYJXXYGroupByIdResponse.h"
#import "DYJXQRCodePage.h"
#import "DYJXAddMemberPage.h"

static NSString *kGroupDetailModelTipsFooter = @"kGroupDetailModelTipsFooter";
static NSString *kGroupDetailModelBusinessLicenceFooter = @"kGroupDetailModelBusinessLicenceFooter";
static NSString *kGroupDetailModelSpaceFooter = @"kGroupDetailModelSpaceFooter";
static NSString *kGroupDetailModelCompanyTitleAndContentCell = @"kGroupDetailModelCompanyTitleAndContentCell";
static NSString *kGroupDetailModelCompanyTitleAndSelcetedArrowCell = @"kGroupDetailModelCompanyTitleAndSelcetedArrowCell";
static NSString *kGroupDetailModelCompanyTitleAndArrowCell = @"kGroupDetailModelCompanyTitleAndArrowCell";


@interface DYJXCompanyInfoDetailPage ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,XYSelectIconPopViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)DYJXCompanyInfoDetailViewModel *viewModel;
@property(strong,nonatomic) NSMutableArray *imgArr ;
@property(nonatomic, assign) BOOL isSelectHeader;
@property(nonatomic, strong) UIImage *headerImage;
@property(strong, nonatomic) CompanyBottomView *bottomView;
@property(nonatomic, strong) DYJXXYGroupByIdResponse *groupByIdResponse;
@end

@implementation DYJXCompanyInfoDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSelectHeader = NO;
    [self initNavigation];
    [self initBottomView];
    [self.view addSubview:self.tableView];
    [self registerTableViewCell];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_top).mas_equalTo(0);
    }];
    [self getGroupInfo];
}

- (void)getGroupInfo{
    WeakSelf;
    
    [self.viewModel getGroupInfoWithGroupId:self.groupNumber Success:^(DYJXXYGroupByIdResponse *groupByIdResponse) {
        weakSelf.groupByIdResponse = groupByIdResponse;
        NSArray *imageNamearray = [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:groupByIdResponse.Result.EnterpriseInfo.Images];
        [imageNamearray enumerateObjectsUsingBlock:^(PersonZhiZhaoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                if (![YWDTools isNil:obj.Name]) {
                    // 处理耗时操作的代码块...
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[obj.Name XYImageURL]]]];
                    [weakSelf.imgArr addObject:image];
                    //通知主线程刷新
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //回调或者说是通知主线程刷新，
                        [weakSelf.tableView reloadData];
                    });
                    
                }
                
            });
            
        }];
        
    } failed:^(NSString *errorMsg) {
        
    }];
    
}

- (void)initBottomView{
   
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}

- (void)registerTableViewCell{
    [self.tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
    [self.tableView registerClass:[CompanyTitleAndContentCell class] forCellReuseIdentifier:kGroupDetailModelCompanyTitleAndContentCell];
    [self.tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    [self.tableView registerClass:[CompanyTitleAndSelcetedArrowCell class] forCellReuseIdentifier:kGroupDetailModelCompanyTitleAndSelcetedArrowCell];
    [self.tableView registerClass:[CompanyTitleAndArrowCell class] forCellReuseIdentifier:kGroupDetailModelCompanyTitleAndArrowCell];
    
    
    [self.tableView registerClass:[TipsFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelTipsFooter];
    [self.tableView registerClass:[BusinessLicenceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelBusinessLicenceFooter];
    [self.tableView registerClass:[SpaceFooter class] forHeaderFooterViewReuseIdentifier:kGroupDetailModelSpaceFooter];
    
}

-(void)setType:(XJGroupType)type {
    //    if (_type != type) {
    NSArray *titles = @[@"本人账户管理",@"公司账户管理",@"信息查看"];
    self.navigationItem.title = titles[(int)type];
    //    }
}

- (void)initNavigation{
    if (self.isAdmin) {
    self.title = @"公司账号管理";
    }else{
    self.title = @"信息查看";
    }
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(getBackPwd) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfCell:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                OwnerImageCell *ownerImageCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelPorityCellId forIndexPath:indexPath];
                [ownerImageCell.porityImageView setImageWithURL:[NSURL URLWithString:self.userIconImageURL] placeholder:[UIImage imageNamed:@"btn_group"]];
                
                if (self.isAdmin) {
                ownerImageCell.block = ^{
                    weakSelf.isSelectHeader = YES;
                    [weakSelf showActionForPhoto];
                };
                }
                
                ownerImageCell.qrCcodeblock = ^{
                    DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
                    qrCodePage.userIdOrCompanyId = self.groupNumber;
                    qrCodePage.companyNumber = self.groupByIdResponse.Result.NumberString;
                    qrCodePage.companyName = self.groupByIdResponse.Result.GroupName;
                    [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
                };
                cell = ownerImageCell;
            }
                break;
            case 1:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                titleAndContentCell.contentLb.text = self.groupByIdResponse.Result.EnterpriseInfo.CompanyName;
                cell = titleAndContentCell;
            }
                break;
            case 2:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                titleAndContentCell.contentLb.text = self.groupByIdResponse.Result.NumberString;
                cell = titleAndContentCell;
                
            }
                break;
                
            case 3:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.text = self.groupByIdResponse.Result.NumberString;
                cell = titleAndContentCell;
                
            }
                break;
                
            case 4:
            {
                CompanyTitleAndArrowCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndArrowCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
                
            }
                break;
                
            case 5:
            {
                CompanyTitleAndArrowCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndArrowCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
                
            }
                break;
                
            case 6:
            {
                CompanyTitleAndSelcetedArrowCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndSelcetedArrowCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
                
            }
                break;
                
            case 7:
            {
                CompanyTitleAndSelcetedArrowCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndSelcetedArrowCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
                
            }
                break;
                
                
            default:
                break;
        }
    }else if(indexPath.section == 1){
        switch (indexPath.row) {
                
            case 0:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
            case 1:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 2:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 3:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 4:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            default:
                break;
        }
    }else if(indexPath.section == 2){
        CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
        titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//        titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
        cell = titleAndContentCell;
    }else if(indexPath.section == 3){
        switch (indexPath.row) {
        
            case 0:
                {
                    CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                    titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                    //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                    cell = titleAndContentCell;
                }
                break;
                
            case 1:
                {
                    CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                    titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                    titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                    cell = titleAndContentCell;
                }
                break;
                
            case 2:
                {
                    CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                    titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
                    //                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                    cell = titleAndContentCell;
                }
                break;
                
            case 3:
                {
                    CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                    titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                    titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                    cell = titleAndContentCell;
                }
                break;
                
            case 4:
            {
                CompanyTitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelCompanyTitleAndContentCell forIndexPath:indexPath];
                titleAndContentCell.titleLb.text = [self.viewModel content:indexPath];
//                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
                default:
                    break;
        }
        
       
    }else if (indexPath.section == 4){
        ImageUploadCell *imageUploadCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelImageUploadCell forIndexPath:indexPath];
        //        imageUploadCell.contentLab.text = [self.viewModel contentWithIndexPath:indexPath];
        imageUploadCell.imagesArray = [self.imgArr mutableCopy];
        imageUploadCell.addPicturesBlock = ^(){
            [weakSelf showActionForPhoto];
        };
        imageUploadCell.deleteImageBlock = ^(NSInteger index) {
            [weakSelf.imgArr removeObjectAtIndex:index];
            
            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
        cell = imageUploadCell;
    }
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 0 || section == 1 || section == 2) {
        SpaceFooter *footer = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupDetailModelSpaceFooter];
        return footer;
    }else if(section == 3) {
        BusinessLicenceFooter *footer = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupDetailModelBusinessLicenceFooter];
        return footer;
        
    }else if(section == 4) {
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
    }else if (indexPath.section == 1 || indexPath.section == 2|| indexPath.section == 3){
        return 40;
    }else{
        return 120;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2) {
        return 20;
    }else if (section == 3){
        return 60;
    }else{
        return 120;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 4) {
            DYJXAddMemberPage *addMemberPage = [[DYJXAddMemberPage alloc]init];
            [self.navigationController pushViewController:addMemberPage animated:YES];
        }
    }
}

//弹出选择框
-(void)showActionForPhoto
{
    if (self.imgArr.count == 4) {
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
        [self.imgArr addObject:image];
        
        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:3] ;
        [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }
}


- (void)getBackPwd{
    //    if ([YWDTools isNil:self.phoneNumTF.text]) {
    //        [YDBAlertView showToast:@"请输入手机号！"];
    //        return;
    //    }
    //    if ([YWDTools isNil:self.codeTF.text]) {
    //        [YDBAlertView showToast:@"请输入验证码！"];
    //        return;
    //    }
    //    if ([YWDTools isNil:self.randCode]) {
    //        [YDBAlertView showToast:@"请重新获取验证码！"];
    //        return;
    //    }
    //    if ([YWDTools isNil:self.passwordTF.text]) {
    //        [YDBAlertView showToast:@"请输入新密码！"];
    //        return;
    //    }
    //    if ([YWDTools isNil:self.secondPasswordTF.text]) {
    //        [YDBAlertView showToast:@"请确认新密码！"];
    //        return;
    //    }
    //    if (![self.passwordTF.text isEqualToString:self.secondPasswordTF.text]) {
    //        [YDBAlertView showToast:@"两次密码不一致！"];
    //        return;
    //    }
    //    [self.viewModel resetPwdWithPhoneNumber:self.phoneNumTF.text AuthorizationCode:self.codeTF.text ranCode:self.randCode password:self.passwordTF.text Success:^{
    //        [YDBAlertView showToast:@"重置密码成功！"];
    //        [self.navigationController popViewControllerAnimated:YES];
    //
    //    } failed:^(NSString *errorMsg) {
    //
    //    }];
}

#pragma mark - UI
-(DYJXCompanyInfoDetailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXCompanyInfoDetailViewModel alloc] init];
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

- (CompanyBottomView *)bottomView{
    if (!_bottomView) {
        if (self.isAdmin) {
            _bottomView = [[NSBundle mainBundle] loadNibNamed:@"CompanyAdminBottomView" owner:self options:nil].firstObject;
        }else{
            _bottomView = [[NSBundle mainBundle] loadNibNamed:@"CompanyBottomView" owner:self options:nil].firstObject;
        }
    }
    return _bottomView;
}

- (UIImage *)headerImage{
    if (!_headerImage) {
        _headerImage = [[UIImage alloc]init];
    }
    return _headerImage;
}

- (DYJXXYGroupByIdResponse *)groupByIdResponse{
    if (!_groupByIdResponse) {
        _groupByIdResponse = [[DYJXXYGroupByIdResponse alloc]init];
    }
    return _groupByIdResponse;
}
@end
