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
#import "XYSelectIconPopView.h"

static NSString *kGroupDetailModelTipsFooter = @"kGroupDetailModelTipsFooter";
static NSString *kGroupDetailModelBusinessLicenceFooter = @"kGroupDetailModelBusinessLicenceFooter";
static NSString *kGroupDetailModelSpaceFooter = @"kGroupDetailModelSpaceFooter";

@interface DYJXUserInfoDetailPage ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,XYSelectIconPopViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)DYJXUserInfoDetailViewModel *viewModel;
@property(strong,nonatomic) NSMutableArray *imgArr ;

@end

@implementation DYJXUserInfoDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

- (void)registerTableViewCell{
    [self.tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
    [self.tableView registerClass:[SampleButtonTableViewCell class] forCellReuseIdentifier:kGroupDetailModelSampleCellId];
    [self.tableView registerClass:[TitleAndContentCell class] forCellReuseIdentifier:kGroupDetailModelTitleAndContentCell];
    [self.tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    
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
                cell = ownerImageCell;
            }
                break;
            case 1:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"shanghao"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
            case 2:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"phone"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
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
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"person_orange"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
            case 1:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"sign"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 2:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"id"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 3:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 4:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 5:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"location_blue"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 6:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"share_qq"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 7:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"share_weixin"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            case 8:
            {
                TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
                [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"alipay"]];
                titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
                cell = titleAndContentCell;
            }
                break;
                
            default:
                break;
        }
    }else if(indexPath.section == 2){
        TitleAndContentCell *titleAndContentCell = [tableView dequeueReusableCellWithIdentifier:kGroupDetailModelTitleAndContentCell forIndexPath:indexPath];
        [titleAndContentCell.iconImage setImage:[UIImage imageNamed:@"unionpay"]];
        titleAndContentCell.contentLb.placeholder = [self.viewModel content:indexPath];
        cell = titleAndContentCell;
    }else if(indexPath.section == 3){
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
        return 160;
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
    
    
    [self.imgArr addObject:image];
    
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:3] ;
    [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
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
@end
