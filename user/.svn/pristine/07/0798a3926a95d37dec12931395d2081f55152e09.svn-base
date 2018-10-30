//
//  XYPersonalInfoVC.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPersonalInfoVC.h"
#import "JXGetSetCityModel.h"
#import "XYPersonalInfoTVCell.h"

#import "XYLoginAndRegisterNet.h"
#import "XYUserInfoModel.h"// 模型

#import "XYSelectIconPopView.h"
#import "XYPayPasswordSettingVC.h"


#import "XYPersonInfoNet.h"

#import "XYLoginVC.h"

#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>

@interface XYPersonalInfoVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,XYSelectIconPopViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** 个人信息表 */
@property(nonatomic,strong) UITableView *tableView;
/** 头像 */
@property(strong,nonatomic) UIImageView *iconImgView ;
/** 头像箭头 */
@property(strong,nonatomic) UIImageView *iconIndicatorImgView ;

/** 用户名 */
@property(strong,nonatomic) UILabel *userNameLab ;
/** 昵称 */
@property(strong,nonatomic) UITextField *nickNameTF;
/** 点击修改昵称 */
@property(strong,nonatomic) UIButton *nickNameEditBtn ;
/** 绑定的手机号 */
@property(strong,nonatomic) UILabel *mobileLab ;
/** 支付密码箭头 */
@property(strong,nonatomic) UIImageView *payPasswordIndicatorImgView ;
/** 底层视图 */
@property(strong,nonatomic) UIView *footView ;
/** 退出账号按钮 */
@property(strong,nonatomic) UIButton *signOutBtn ;
/** 字体颜色 */
@property(strong,nonatomic) UIColor *fontColor ;



@property(strong,nonatomic) XYUserInfoModel *infoModel ;

@end

static NSString *XYPersonalInfoTVCellID = @"XYPersonalInfoTVCell";

@implementation XYPersonalInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"个人信息";
    self.view.backgroundColor = XYGlobalBg;
    
    [self initGui];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}




-(void)updateUserInfo{

    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_infoModel.userImage]] placeholderImage:[UIImage imageNamed:@"placeholder_person"]];
    
    self.nickNameTF.text = _infoModel.nickName;
    self.mobileLab.text = _infoModel.mobile;
    
    
    
    
}




-(void)initGui{


    self.tableView.tableFooterView = self.footView;
    [self.footView addSubview:self.signOutBtn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
    self.footView.frame = CGRectMake(0, 0, XYScreenW, 100);    
    self.signOutBtn.frame = CGRectMake(47, 35, XYScreenW -47*2, 44);
    NSDictionary * userinfoDict = [XYUserDefaults readUserDefaultsInfo];
    
    if (userinfoDict.count == 0) {
        return;
    }
    
    _infoModel = [XYUserInfoModel mj_objectWithKeyValues:userinfoDict];
    self.mobileLab.text =_infoModel.mobile;
    NSString *phoneStr;
    if (_infoModel.mobile.length == 11) {
        phoneStr = [_infoModel.mobile stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        self.mobileLab.text = phoneStr;
    }
    
    
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_infoModel.userImage]] placeholderImage:[UIImage imageNamed:@"placeholder_person"] options:SDWebImageHandleCookies];
    self.nickNameTF.text = _infoModel.nickName;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
//        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XYPersonalInfoTVCell class] forCellReuseIdentifier:XYPersonalInfoTVCellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(UIImageView *)iconImgView
{

    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.layer.cornerRadius = 32.5/2;
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

-(UIImageView *)iconIndicatorImgView
{
    if (!_iconIndicatorImgView) {
        _iconIndicatorImgView = [[UIImageView alloc] init];
        _iconIndicatorImgView.image = [UIImage imageNamed:@"order_icon_more"];
        
    }
    return _iconIndicatorImgView;

}

-(UILabel *)userNameLab
{
    if (!_userNameLab) {
        _userNameLab = [UILabel new];
        _userNameLab.font = XYFont_14;
        _userNameLab.textColor = self.fontColor;
        _userNameLab.textAlignment = NSTextAlignmentRight;
    }
    return _userNameLab;

}


-(UITextField *)nickNameTF
{

    if (!_nickNameTF) {
        _nickNameTF = [[UITextField alloc] init];
        _nickNameTF.font = XYFont_14;
        _nickNameTF.text = @"";
        _nickNameTF.textColor = self.fontColor;
        _nickNameTF.textAlignment = NSTextAlignmentRight;
        _nickNameTF.enabled = NO;
        _nickNameTF.delegate = self;
    }
    return _nickNameTF;
}

-(UIButton *)nickNameEditBtn
{
    if (!_nickNameEditBtn) {
        _nickNameEditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nickNameEditBtn setImage:[UIImage imageNamed:@"info_icon_edit"] forState:UIControlStateNormal];
        [_nickNameEditBtn addTarget:self action:@selector(checkNickNameTFStatus:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nickNameEditBtn;

}

-(UILabel *)mobileLab
{
    if (!_mobileLab) {
        _mobileLab = [UILabel new];
        _mobileLab.textAlignment = NSTextAlignmentRight;
        _mobileLab.textColor = self.fontColor;
        _mobileLab.font = XYFont_14;
    }
    return _mobileLab;

}

-(UIImageView *)payPasswordIndicatorImgView
{
    if (!_payPasswordIndicatorImgView) {
        _payPasswordIndicatorImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order_icon_more"]];
    }
    return _payPasswordIndicatorImgView;

}

-(UIColor *)fontColor
{
    if (!_fontColor) {
        _fontColor = XYFontTitleColor;
    }
    return _fontColor;
}

-(UIButton *)signOutBtn
{
    if (!_signOutBtn) {
        _signOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _signOutBtn.titleLabel.font = XYFont_14;
        [_signOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_signOutBtn setBackgroundColor:BALANCEColor];
        _signOutBtn.layer.cornerRadius = 5;
        _signOutBtn.layer.masksToBounds = YES;
        [_signOutBtn addTarget:self action:@selector(clickToSignOut:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _signOutBtn;
}

-(UIView *)footView{

    if (!_footView) {
        _footView = [[UIView alloc] init];
    }
    return _footView;
}



//点击按钮用于编辑昵称
-(void)checkNickNameTFStatus:(UIButton *)sender
{

    if (self.nickNameTF.enabled) {
        self.nickNameTF.enabled = NO;
        [self.nickNameTF resignFirstResponder];
    }else
    {
        self.nickNameTF.enabled = YES;
        [self.nickNameTF becomeFirstResponder];
    }

}
//点击退出登录
-(void)clickToSignOut:(UIButton *)btn{

    WeakSelf;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认退出登录？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  
        [XYPersonInfoNet netSignOutResultBlock:^(NSDictionary *blockDictionary, NSError *error) {
            if (error == nil) {
//
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                    [weakSelf updateSessionID];
                    
//                });
            
            }
        }];
        

    }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];

   }

#pragma Mark - table view datasource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 45.f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYPersonalInfoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:XYPersonalInfoTVCellID forIndexPath:indexPath];
    
//    if (indexPath.section == 0) {
//        
//    }
    [self cellWithIndexPath:indexPath cell:cell];
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.f;
    }else
    {
        return 13.f;
    }
    

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        XYSelectIconPopView *popView = [[XYSelectIconPopView alloc]init];
        [popView show];
        popView.delegate = self;
    }
    
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        XYPayPasswordSettingVC *settingVC = [[XYPayPasswordSettingVC alloc]init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
}

#pragma mark - 抽取cell

-(void)cellWithIndexPath:(NSIndexPath *)indexPath cell:(XYPersonalInfoTVCell *)cell
{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"头像";
            [cell.contentView addSubview:self.iconImgView];
            [cell.contentView addSubview:self.iconIndicatorImgView];
            [self.iconIndicatorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-10);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.width.mas_equalTo(8);
                make.height.mas_equalTo(15);
            }];
            
            [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(_iconIndicatorImgView.mas_left).offset(-10);
                make.width.height.mas_equalTo(32.5);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            }];
            
        }else
        {
            cell.titleLab.text = @"小朋昵称";
            [cell.contentView addSubview:self.nickNameEditBtn];
            [cell.contentView addSubview:self.nickNameTF];
            [self.nickNameEditBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(0);
                make.width.height.mas_equalTo(30);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            }];
            
            [self.nickNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.titleLab.mas_right);
                make.right.mas_equalTo(_nickNameEditBtn.mas_left).offset(0);
                make.top.bottom.mas_equalTo(0);
            }];
            
        }
    }else
    {
    
        if (indexPath.row == 0) {
            cell.titleLab.text = @"绑定手机";
            [cell.contentView addSubview:self.mobileLab];
            [self.mobileLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-10);
                make.left.mas_equalTo(cell.titleLab.mas_right);
                make.top.bottom.mas_equalTo(0);
            }];
        }else
        {
        
            cell.titleLab.text = @"支付密码";
            [cell.contentView addSubview:self.payPasswordIndicatorImgView];
            [self.payPasswordIndicatorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-10);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.width.mas_equalTo(8);
                make.height.mas_equalTo(15);
            }];
            
           
        }
    
    }

}

#pragma mark -  输入框代理

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (textField.text.length>15) {
        [YDBAlertView showToast:@"昵称最多输入15个字" dismissDelay:1.0];
        return NO;
    }
  
    NSInteger length = textField.text.length +string.length;
    if (length>15) {
        [YDBAlertView showToast:@"昵称最多输入15个字" dismissDelay:1.0];
        return NO;
    }
    
    
    return YES;

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"nickName"] = textField.text;
    [XYPersonInfoNet netUpdatePersonInfoWithDic:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            [XYLoginAndRegisterNet netGetUserInfoListBlock:^(NSDictionary *blockDictionary, NSError *error) {
                
            }];
        }
    }];
}
#pragma mark - 选择页面

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
        
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
        {
            //无权限 做一个友好的提示
            [YDBAlertView showToast:@"获取相机权限失败" dismissDelay:1.0];
        } else {
            //调用相机
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.navigationBar.tintColor = XYBlackColor;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
        }
        

//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear] &&[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
//            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//            picker.delegate = self;
//            [self.navigationController presentViewController:picker animated:YES completion:nil];
//            
//        }else
//        {
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"获取相机权限失败" dismissTimeInterval:1.0];
//            
//        }
    
    }

}

#pragma mark - 

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
//    NSData *data = UIImageJPEGRepresentation(image, 0.5);
//    NSString *imgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

    self.iconImgView.image = image;
    WeakSelf;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [XYBestAllNet  commonUploadImgHeadPortraitWith:image resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
            if (error == nil) {
                NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
                param[@"logoFileId"] = blockDictionary[@"fileId"];
                [weakSelf.iconImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",blockDictionary[@"fullPath"]]]];
                [XYPersonInfoNet netUpdatePersonInfoWithDic:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
                    if (error == nil) {
                        [XYLoginAndRegisterNet netGetUserInfoListBlock:^(NSDictionary *blockDictionary, NSError *error) {
                            if (error == nil) {
                                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"头像修改成功" dismissTimeInterval:1.0];
                            }
                        }];
                    }
                }];
            
            }
        }];
    });
    

    
}


- (void)updateSessionID{
    WeakSelf;
    [XYLoginAndRegisterNet netGetSessionIdWithForce:@"1"  WithBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            XYSelectCommuityModel *selectCommuityModel=[XYUserDefaults readAppDlegateOfUser_city];
            [weakSelf getSetCity:selectCommuityModel.cityId TheMerchantId:selectCommuityModel.merchantId];
            [XYUserDefaults deleteUserDefaultsRegistered];
            [XYUserDefaults deleteUserDefaultsInfo];
            
            [weakSelf.navigationController popViewControllerAnimated:NO];
            
            [XYUserDefaults writeAppDlegateOfOrderCountDict:@{}];
            [XYUserDefaults writeAppDlegateOfCartCountStr:@"0"];
            [XYUserDefaults writeAppDlegateOfOrderMerchantId:@{}];
            [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_ItemsBadge object:@"0"];
            [XYUserDefaults writeUserDefaultsSessionIdDict:blockDictionary];
            [XYCommon setPresentViewControllerWithLoginView];
            
            weakSelf.tabBarController.selectedIndex = 0;
        }else{
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0/*延迟执行时间*/ * NSEC_PER_SEC));
            
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [weakSelf updateSessionID];
            });
        }
    }];
}

//是否设置城市
-(void)getSetCity:(NSString *)cityId TheMerchantId:(NSString *)theMerchantId{
    WeakSelf;
    NSDictionary *dic;
    if ([cityId isEqualToString:@""]) {
        dic=[NSDictionary new];
    }else{
        cityId=cityId.length==0?@"":cityId;
        theMerchantId=theMerchantId.length==0?@"":theMerchantId;
        dic=@{@"cityId":cityId,@"theMerchantId":theMerchantId};
    }
    [self network:dic relativePath:kJXAPI_user_selectCommuity ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXGetSetCityModel *cityModel=[JXGetSetCityModel modelWithJSON:responseObject];
        if (cityModel.merchantId.length!=0) {
            
            
           
            
            //更新 购物车数量
           
            
            //            [weakSelf getCityList];
            
            
            //            [XYUserDefaults writeAppDlegateOfOrderMerchantId:[XYCommon removeNull:responseObject]];
        }else{
            
            
        }
        
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}


@end
