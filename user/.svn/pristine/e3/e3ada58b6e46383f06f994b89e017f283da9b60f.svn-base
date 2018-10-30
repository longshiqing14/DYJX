//
//  XYBoardBandEditDetailVC.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBoardBandEditDetailVC.h"
#import "XYPersonalInfoTVCell.h"
#import "XYUserInfoModel.h"
#import "XYSelectIconPopView.h"
#import "XYPickView.h"
#import "UIView+Tool.h"
#import "XYAddressNet.h"
#import "XYPay.h"
#import "XYBaseModel.h"
#import "XYBoardBandNet.h"
#import "JXSuccessAccountViewController.h"
#import "NetWorkTool.h"
#import "JXAddressModel.h"

@interface XYBoardBandEditDetailVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,XYSelectIconPopViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,XYPickViewDelegate>{
    int count;
}
@property(nonatomic,strong)NSTimer *time;
/** 表 */
@property(nonatomic,strong) UITableView *editTableView;
/** 名字 */
@property(strong,nonatomic) UITextField *nameTF ;
/** 男 */
@property(strong,nonatomic) UIButton *manBtn ;
/** 女 */
@property(strong,nonatomic) UIButton *womanBtn ;
/** 身份证号 */
@property(strong,nonatomic) UITextField *idTF ;
/** 手机号 */
@property(strong,nonatomic) UITextField *phoneLab ;
/** 城市 */
@property(strong,nonatomic) UILabel *cityLab ;
/** 指示选择器 */
@property(strong,nonatomic) UIImageView *indicatorImgV ;
/** 小区 */
@property(strong,nonatomic) UITextField *communityTF ;
/** 门牌具体地址 */
@property(strong,nonatomic) UITextField *roadTF ;
/** 提交按钮 */
@property(strong,nonatomic) UIButton *confirmBtn ;
/** 表脚 */
@property(strong,nonatomic) UIView *footView ;
/** 表脚描述标签 */
@property(strong,nonatomic) UILabel *descLab ;
@property(nonatomic,strong)UIButton *codeButton;
/*********************** 图片视图 ****************************/
/** 个人身份证 */
@property(strong,nonatomic) UILabel *identiLab ;
/**背景图*/
@property(strong,nonatomic) UIImageView *photoLeftBgImgV ;
/** 左边选择的图 */
@property(strong,nonatomic) UIImageView *leftImgV ;
/** 左边选择图片按钮 */
@property(strong,nonatomic) UIButton *leftImgBtn ;
/** 右边的背景图 */
@property(strong,nonatomic) UIImageView *photoRightBgImV ;
/** 右边选择的图 */
@property(strong,nonatomic) UIImageView *rightImgV ;

/** 右边选择图片按钮 */
@property(strong,nonatomic) UIButton *rightImgBtn ;

/** 左边描述标签 */
@property(strong,nonatomic) UILabel *leftDescLab ;
/** 左边显示的案例图 */
@property(strong,nonatomic) UIImageView *leftDescImgV ;
/** 右边描述的标签 */
@property(strong,nonatomic) UILabel *rightDescLab ;
/** 右边描述 */
@property(strong,nonatomic) UIImageView *rightDescImgV ;

@property(strong,nonatomic)UILabel *codeLable;
/****************************** 数据处理 */
/** 姓名 */
@property(copy,nonatomic) NSString *nameStr ;
/** 左边的图片 */
//@property(strong,nonatomic) UIImage *leftIDImg ;
///** 右边的图片 */
//@property(strong,nonatomic) UIImage *rightIDImg ;
/** 城市名   ps.区域名 */
@property(copy,nonatomic) NSString *cityNameStr ;
/** 区域id*/
@property(copy,nonatomic) NSString *cityIDStr ;
/** 所在小区*/
@property(copy,nonatomic) NSString *regionNameStr ;
/** 住址门牌号 */
@property(copy,nonatomic) NSString *addressStr ;
/** 选择图片的时候是否是左边的图*/
//@property(assign,nonatomic) BOOL leftIdImg ;

@property(strong,nonatomic) NSMutableArray *regionArr ;
/** 男女 */
@property(copy,nonatomic) NSString *gendor ;
/** 身份证号*/
@property(copy,nonatomic) NSString *personId ;
/** 身份证正面照id */
//@property(copy,nonatomic) NSString *faceImgID ;
///** 身份证背面照id */
//@property(copy,nonatomic) NSString *backImgID ;
//验证码
@property(nonatomic,strong)UITextField *codeField;

@end

static NSString *const XYPersonalInfoTVCellID = @"XYPersonalInfoTVCell";

static NSString *const NOTIFICATION_CHECK = @"NOTIFICATION_CHECK";

@implementation XYBoardBandEditDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    count=60;
    self.title = @"提交宽带资料";
    [self.editTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    self.footView.frame = CGRectMake(0, 0, XYScreenW, 150);
    self.confirmBtn.frame = CGRectMake(45, 25, XYScreenW-90, 44);
    
    self.descLab.frame = CGRectMake(45, 25+44+14, XYScreenW-90, 30);
    [self.footView addSubview:self.descLab];
    [self.footView addSubview:self.confirmBtn];
    self.editTableView.tableFooterView = self.footView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealWithDataAndSetConfirmBtnAble:) name:NOTIFICATION_CHECK object:nil];
    [self naviUI];
}

-(void)naviUI{
//    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"comment-delete"] style:(UIBarButtonItemStylePlain) target:self action:@selector(blackHomeClock)];
//    self.navigationItem.rightBarButtonItem=item;
}

-(void)blackHomeClock{
    self.tabBarController.selectedIndex=0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter ]removeObserver:NOTIFICATION_CHECK];

}

-(void)dealWithDataAndSetConfirmBtnAble:(NSNotification *)noti{
    //&& self.addressStr.length!= 0
    if (self.nameStr.length != 0 &&self.cityIDStr.length !=0 && self.regionNameStr.length!=0 && [self isIDCardNumber:self.personId]) {
        self.confirmBtn.enabled = YES;
        self.confirmBtn.backgroundColor = XYMainColor;
    }else
    {
        self.confirmBtn.enabled = NO;
        self.confirmBtn.backgroundColor = XYGrayColor;
    }

}

#pragma mark - lazy
-(UITableView *)editTableView
{
    if (!_editTableView) {
        _editTableView = [[UITableView alloc] init];
        _editTableView.showsVerticalScrollIndicator = NO;
        _editTableView.showsHorizontalScrollIndicator = NO;
        _editTableView.delegate = self;
        _editTableView.dataSource = self;
        _editTableView.backgroundColor = XYGlobalBg;
        _editTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [_editTableView registerClass:[XYPersonalInfoTVCell class] forCellReuseIdentifier:XYPersonalInfoTVCellID];
        [self.view addSubview:_editTableView];
    }
    return _editTableView;

}

-(UITextField *)codeField{
    if (!_codeField) {
        _codeField =[[UITextField alloc]init];
        _codeField.textAlignment = NSTextAlignmentRight;
        _codeField.placeholder=@"请输入您收到的验证码";
        _codeField.delegate=self;
        _codeField.font = XYFont_14;
    }
    return _codeField;
}

-(UITextField *)nameTF
{

    if (!_nameTF) {
        _nameTF = [[UITextField alloc] init];
        _nameTF.textAlignment = NSTextAlignmentRight;
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"请输入您的名字"];
        [att addAttribute:NSForegroundColorAttributeName value:XYGrayColor range:NSMakeRange(0, 7)];
        _nameTF.attributedPlaceholder = att;
        _nameTF.font = XYFont_14;
        _nameTF.delegate = self;
    }
    return _nameTF;
}

-(NSString *)gendor
{
    if (!_gendor) {
        _gendor = @"男";
        
    }
    return _gendor;
}
-(UIButton *)manBtn
{
    if (!_manBtn) {
        _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _manBtn.titleLabel.font = XYFont_14;
        [_manBtn setTitleColor:XYBlackColor forState:UIControlStateNormal];
        [_manBtn setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        [_manBtn setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_manBtn setTitle:@"男" forState:UIControlStateNormal];
        _manBtn.selected  = YES;
        [_manBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_manBtn addTarget:self action:@selector(sexHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _manBtn;
}
-(UIButton *)womanBtn
{
    if (!_womanBtn) {
        _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _womanBtn.titleLabel.font = XYFont_14;
        [_womanBtn setTitleColor:XYBlackColor forState:UIControlStateNormal];
        [_womanBtn setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        [_womanBtn setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_womanBtn setTitle:@"女" forState:UIControlStateNormal];
        [_womanBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_womanBtn addTarget:self action:@selector(sexHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _womanBtn;
}


-(UITextField *)phoneLab
{
    if (!_phoneLab) {
        _phoneLab = [UITextField new];
        _phoneLab.textAlignment = NSTextAlignmentRight;
        NSDictionary *dic=   [XYUserDefaults readUserDefaultsInfo];
        XYUserInfoModel *model = [XYUserInfoModel mj_objectWithKeyValues:dic];
        _phoneLab.text = model.mobile;
        _phoneLab.font = XYFont_14;
        _phoneLab.placeholder=@"请输入手机号";
        _phoneLab.keyboardType=UIKeyboardTypeDecimalPad;
        _phoneLab.textColor = XYBlackColor;
    }
    return _phoneLab;
}

-(UILabel *)codeLable{
    if (!_cityLab) {
        _cityLab = [UILabel new];
        _cityLab.textAlignment = NSTextAlignmentRight;
        _cityLab.font = XYFont_14;
        
        _cityLab.text = @"请选择所在地区";
        _cityLab.textColor = XYGrayColor;
    }
    return _cityLab;
}

-(UILabel *)cityLab
{

    if (!_cityLab) {
        _cityLab = [UILabel new];
        _cityLab.textAlignment = NSTextAlignmentRight;
        _cityLab.font = XYFont_14;
      
        _cityLab.text = @"请选择所在地区";
        _cityLab.textColor = XYGrayColor;
    }
    return _cityLab;
}

-(UIImageView *)indicatorImgV
{
    if (!_indicatorImgV) {
        _indicatorImgV = [[UIImageView alloc] init];
        _indicatorImgV.image = [UIImage imageNamed:@"order_icon_more"];
        
    }
    return _indicatorImgV;

}

-(UITextField *)idTF
{
    if (!_idTF) {
        _idTF = [[UITextField alloc] init];
        _idTF.textAlignment = NSTextAlignmentRight;
        _idTF.font = XYFont_14;
        
        _idTF.delegate = self;
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"请输入身份证号"];
        [att addAttribute:NSForegroundColorAttributeName value:XYGrayColor range:NSMakeRange(0, 7)];
        _idTF.attributedPlaceholder = att;

    }
    return _idTF;
}

-(UITextField *)communityTF
{

    if (!_communityTF) {
        _communityTF = [[UITextField alloc] init];
        _communityTF.textAlignment = NSTextAlignmentRight;
        _communityTF.font = XYFont_14;
     
        _communityTF.delegate = self;
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"请输入详细地址"];
        [att addAttribute:NSForegroundColorAttributeName value:XYGrayColor range:NSMakeRange(0, 7)];
        _communityTF.attributedPlaceholder = att;
        
        _communityTF.delegate = self;
    }
    return _communityTF;
}

-(UITextField *)roadTF
{

    if (!_roadTF) {
        _roadTF = [[UITextField alloc] init];
        _roadTF.font = XYFont_14;
        _roadTF.textAlignment = NSTextAlignmentRight;
//        _roadTF.placeholder = @"请输入您的住址门牌号";
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"请输入您的住址门牌号"];
        [att addAttribute:NSForegroundColorAttributeName value:XYGrayColor range:NSMakeRange(0, 10)];
        _roadTF.attributedPlaceholder = att;
        _roadTF.delegate = self;
    }
    return _roadTF;
}


-(UIView *)footView
{
    if (!_footView) {
        _footView = [UIView new];
        _footView.backgroundColor = XYGlobalBg;
        
    }
    return _footView;

}

-(UIButton *)confirmBtn
{

    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.backgroundColor = XYMainColor;
        _confirmBtn.layer.cornerRadius = 5;
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.titleLabel.font = XYFont_14;
        [_confirmBtn addTarget:self action:@selector(clickConfirmBtnWithHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        _confirmBtn.backgroundColor = XYRGBAColor(236,59,44, 1);
//        _confirmBtn.enabled = NO;
        [_confirmBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
    }
    return _confirmBtn;
}

-(UILabel *)descLab
{
    if (!_descLab) {
        _descLab = [UILabel new];
        _descLab.numberOfLines = 0;
        _descLab.textAlignment = NSTextAlignmentCenter;
        _descLab.lineBreakMode = NSLineBreakByWordWrapping;
        _descLab.font = XYFont_10;
        _descLab.textColor = XYGrayColor;
        _descLab.text = @"您办理的宽带套餐，将在一周内安排工作人员上门安装，请留意电话通知";
    }
    return _descLab;

}
-(UILabel *)identiLab
{
    if (!_identiLab) {
        _identiLab = [UILabel new];
        _identiLab.text = @"个人身份证";
        _identiLab.textColor = XYGrayColor;
        _identiLab.font = XYFont_13;
    }
    return _identiLab;
}
-(UIImageView *)photoLeftBgImgV
{
    if (!_photoLeftBgImgV) {
        _photoLeftBgImgV = [[UIImageView alloc] init];
        _photoLeftBgImgV.image = [UIImage imageNamed:@"boardband_indentity_line"];
        _photoLeftBgImgV.userInteractionEnabled = YES;
    }
    return _photoLeftBgImgV;
}
-(UIButton *)leftImgBtn
{
    if (!_leftImgBtn) {
        _leftImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftImgBtn setImage:[UIImage imageNamed:@"boardband_upload_pic"] forState:UIControlStateNormal];
        [_leftImgBtn setTitle:@"二代身份证正面照" forState:UIControlStateNormal];
        [_leftImgBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _leftImgBtn.titleLabel.font = XYFont_13;
        [_leftImgBtn addTarget:self action:@selector(chooseIdPhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftImgBtn;
}

-(UIImageView *)photoRightBgImV
{
    if (!_photoRightBgImV) {
        _photoRightBgImV = [[UIImageView alloc] init];
        _photoRightBgImV.image = [UIImage imageNamed:@"boardband_indentity_line"];
        _photoRightBgImV.userInteractionEnabled = YES;
    }
    return _photoRightBgImV;
}
-(UIButton *)rightImgBtn
{
    if (!_rightImgBtn) {
        _rightImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightImgBtn setImage:[UIImage imageNamed:@"boardband_upload_pic"] forState:UIControlStateNormal];
        [_rightImgBtn setTitle:@"二代身份证背面照" forState:UIControlStateNormal];
        [_rightImgBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _rightImgBtn.titleLabel.font = XYFont_13;
        [_rightImgBtn addTarget:self action:@selector(chooseIdPhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightImgBtn;
}

-(UILabel *)leftDescLab
{
    if (!_leftDescLab) {
        _leftDescLab = [UILabel new];
        _leftDescLab.font = XYFont_12;
        _leftDescLab.textColor = XYGrayColor;
        _leftDescLab.textAlignment = NSTextAlignmentCenter;
        _leftDescLab.text = @"示例";
    }
    return _leftDescLab;
}

-(UIImageView *)leftDescImgV
{
    if (!_leftDescImgV) {
        _leftDescImgV = [[UIImageView alloc] init];
        _leftDescImgV.image = [UIImage imageNamed:@"boardband_indentity_head"];
    }

    return _leftDescImgV;

}


-(UILabel *)rightDescLab
{

    if (!_rightDescLab) {
        _rightDescLab = [UILabel new];
        _rightDescLab.font = XYFont_12;
        _rightDescLab.textAlignment = NSTextAlignmentCenter;
        _rightDescLab.textColor = XYGrayColor;
        _rightDescLab.text = @"示例";
    }
    return _rightDescLab;
}

-(UIImageView *)rightDescImgV
{
    if (!_rightDescImgV) {
        _rightDescImgV = [[UIImageView alloc] init];
        _rightDescImgV.image = [UIImage imageNamed:@"boardband_indentity_tail"];
    }
    return _rightDescImgV;
}

-(UIButton *)codeButton{
    if (!_codeButton) {
        _codeButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_codeButton addTarget:self action:@selector(codeClock) forControlEvents:(UIControlEventTouchUpInside)];
        [_codeButton reat:5];
        [_codeButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
        [_codeButton setTitle:@"验证" forState:(UIControlStateNormal)];
        _codeButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [_codeButton setTitleColor:XYRGBAColor(236,59,44, 1) forState:(UIControlStateNormal)];
        
    }
    return _codeButton;
}

-(void)codeClock{
    NSLog(@"获取验证码");
    if (self.phoneLab.text.length==0||self.phoneLab==nil) {
        [YDBAlertView showToast:@"请输入手机号" dismissDelay:1.0];
    }else if(self.phoneLab.text.length>11||self.phoneLab.text.length<11){
        [YDBAlertView showToast:@"请输入正确的手机号" dismissDelay:1.0];
        
    }else{
        [self getcode];
    }
    
}

-(void)getcode{
    __weak typeof(self)SelfWeek=self;
    [NetWorkTool postRequest:@{@"phone":self.phoneLab.text,@"type":@"3"} relativePath:@"sms.vcode" ShowAndDismiss:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
            [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"验证码发送成功" dismissTimeInterval:1.0];
            SelfWeek.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
        
    } failure:^() {
        NSLog(@"服务器异常");
    } UnusualFailure:^{
        NSLog(@"网络异常");
    }];
}


- (void)countdown
{
    
    count--;
    if (count == 0) {
        [_time invalidate];
        _time = nil;
        
        [self.codeButton setTitle:@"获取验证码" forState:(UIControlStateNormal) ];
        count = 60;
        return;
    }
    [self.codeButton setTitle:[NSString stringWithFormat:@"%ld秒", (long)count] forState:UIControlStateNormal];
}

-(NSMutableArray *)regionArr
{
    if (!_regionArr) {
        _regionArr = [NSMutableArray array];
    }
    return _regionArr;
}
#pragma mark - 表
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYPersonalInfoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:XYPersonalInfoTVCellID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLab.text =@"姓名";
        [cell.contentView addSubview:self.nameTF];
        [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
            
        }];
    }else if (indexPath.row == 1)
    {
        cell.titleLab.text = @"性别";
        [cell.contentView addSubview:self.manBtn];
        [cell.contentView addSubview:self.womanBtn];
        [self.womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        [self.manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_womanBtn.mas_left).offset(10);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        
        
        
    }
//    else if (indexPath.row == 2)
//    {
//        [self dealWithAddPhotoView:cell];
//
//    }
    else if (indexPath.row == 2)
    {
        cell.titleLab.text = @"身份证号";
        
        
        [cell.contentView addSubview:self.idTF];
        [self.idTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
        }];
        
        
    }else if (indexPath.row == 3)
    {
        cell.titleLab.text = @"手机号码";
        
        [cell.contentView addSubview:self.codeButton];
        [cell.contentView addSubview:self.phoneLab];
        [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-5);
            make.top.mas_equalTo(5);
//            make.left.mas_equalTo(self.phoneLab.mas_right);
            make.width.mas_equalTo(90);
        }];
        [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_codeButton.mas_left).offset(-10);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
        }];
        
         
        
    }else if (indexPath.row==4){
        cell.titleLab.text = @"手机验证码";
        
        [cell.contentView addSubview:self.codeField];
        [self.codeField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
        }];
    } else if (indexPath.row == 5)
    {
          cell.titleLab.text = @"所在地区";
        
        [cell.contentView addSubview:self.cityLab];
        [cell.contentView addSubview:self.indicatorImgV];
        [self.indicatorImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(8);
            make.height.mas_equalTo(15);
        }];
        [self.cityLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_indicatorImgV.mas_left).offset(-10);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
        }];
        
    }else if (indexPath.row == 6)
    {
        cell.titleLab.text =@"详细地址";
        
        [cell.contentView addSubview:self.communityTF];
        
        [self.communityTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            
            make.left.mas_equalTo(cell.titleLab.mas_right);
            make.top.bottom .mas_equalTo(0);
        }];
        
    }
//    else if (indexPath.row == 6)
//    {
//           cell.titleLab.text =@"住址门牌号";
//        [cell.contentView addSubview:self.roadTF];
//
//        [self.roadTF mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(XY_Right_Margin);
//
//            make.left.mas_equalTo(cell.titleLab.mas_right);
//            make.top.bottom .mas_equalTo(0);
//        }];
//    }
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 2) {
//        return [self heightForCell];
//    }else
//    {
        return 44;
//    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        [self showPicker];
    }
}

-(void)showPicker{
    
    if (self.regionArr.count != 0) {
        XYPickView *picker = [[XYPickView sharedInstance] initPickviewWithArray:self.regionArr key:@"name" idkey:@"id"];
        
        picker.delegate = self;
        [picker show];
    }else
    {
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"regionId"] = [XYUserDefaults readAppDlegateOfUser_cityOfcityid];
        WeakSelf;
        [XYAddressNet netGetCityZone:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
            
            if (error == nil) {
//                NSArray *arr = [blockDictionary objectForKey:@"list"];
//                for (NSDictionary *dic in arr) {
//                    [weakSelf.regionArr addObject:dic];
//                }
                
                //                JXAddressModel *model = [JXAddressModel modelWithJSON:blockDictionary];
                
                JXAddressModel *model = [JXAddressModel modelWithJSON:blockDictionary];
                weakSelf.regionArr = [model.list mutableCopy];
                XYPickView *picker = [[XYPickView sharedInstance] initPickviewWithArray:weakSelf.regionArr key:@"name" idkey:@"id"];
                picker.delegate = self;
                [picker show];
            }
        }];
        
    }
    
    
}
#pragma mark -


-(void)dealWithAddPhotoView:(XYPersonalInfoTVCell *)cell
{
    [cell.contentView addSubview:self.identiLab];
//    [cell.contentView addSubview:self.photoLeftBgImgV];
//    [self.photoLeftBgImgV addSubview:self.leftImgBtn];
//    [cell.contentView addSubview:self.photoRightBgImV];
//    [self.photoRightBgImV addSubview:self.rightImgBtn];
//    [cell.contentView addSubview:self.leftDescImgV];
    
    [cell.contentView addSubview:self.leftDescLab];
    [cell.contentView addSubview:self.rightDescLab];
    [cell.contentView addSubview:self.rightDescImgV];
    
    self.identiLab.frame = CGRectMake(XY_Left_Margin, 17, XYScreenW-34, 13);
   
    
    CGFloat imgW = [self imgWidth];
    CGFloat imgH = [self imgHeight];
    self.photoLeftBgImgV.frame = CGRectMake(XY_Left_Margin, 34+13, imgW, imgH);
    self.photoRightBgImV.frame = CGRectMake(XYScreenW/2 +7, 34+13, imgW, imgH);
    
    self.leftImgBtn.frame = CGRectMake(1, 1, imgW-2, imgH-2);
    self.rightImgBtn.frame = CGRectMake(1, 1, imgW-2, imgH-2);
    
    
    self.leftDescLab.frame = CGRectMake(0, 34+13+imgH+12, XYScreenW/2, 12);
  
    self.rightDescLab.frame = CGRectMake(XYScreenW/2, 34+13+imgH+12, XYScreenW/2, 12);
   
    self.leftDescImgV.frame = CGRectMake((XYScreenW/2 -80)/2, 34+13+imgH+12+12+9, 80, 50);
    
 
    self.rightDescImgV.frame = CGRectMake(XYScreenW/2+(XYScreenW/2 -80)/2, 34+13+imgH+12+12+9, 80, 50);
    
    [self setButtonContentCenter:self.leftImgBtn];
    [self setButtonContentCenter:self.rightImgBtn];



}
//选照片的行高
-(CGFloat)heightForCell{

    return 103+34+13+[self imgHeight];
}


-(void)setButtonContentCenter:(UIButton *) btn

{
    
    CGSize imgViewSize,titleSize,btnSize;
    
    UIEdgeInsets imageViewEdge,titleEdge;
    
    CGFloat heightSpace = 25;
    
    //设置按钮内边距
    
    imgViewSize = btn.imageView.bounds.size;
    
    titleSize = btn.titleLabel.bounds.size;
    
    btnSize = btn.bounds.size;
    
    imageViewEdge = UIEdgeInsetsMake(heightSpace,0.0, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
    
    [btn setImageEdgeInsets:imageViewEdge];
    
    titleEdge = UIEdgeInsetsMake(imgViewSize.height +heightSpace, - imgViewSize.width, 0.0, 0.0);
    
    [btn setTitleEdgeInsets:titleEdge];
    
}


//身份证图片宽
-(CGFloat)imgWidth{
    
    return (XYScreenW -20-14)/2;
}
//身份证图片高
-(CGFloat)imgHeight{

    return [self imgWidth]*106/170;
}

#pragma mark -   数据处理
- (BOOL)isIDCardNumber:(NSString *)IDCardNum
{
    NSString * IDCard = @"(\\d{15}$)|(\\d{18}$)|(\\d{17}(\\d|X|x)$)";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDCard];
    if ([regextestiph evaluateWithObject:IDCardNum] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}
-(void)toobarDonBtnHaveClick:(XYPickView *)pickView resultString:(NSString *)resultString resultIDString:(NSString *)resultIDString isHaveStreetArea:(BOOL)isHaveStreetArea
{

    self.cityLab.text = resultString;
    self.cityLab.textColor = XYBlackColor;
    self.cityNameStr = resultString;
    self.cityIDStr = resultIDString;
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHECK object:nil];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    if (textField == self.nameTF) {
        self.nameStr = [textField.text stringByAppendingString:string];
    }else if (textField == self.communityTF)
    {
        self.regionNameStr = [textField.text stringByAppendingString:string];
        
    }else if (textField == self.roadTF)
    {
        self.addressStr = [textField.text stringByAppendingString:string];
    }else if (textField == self.idTF)
    {
        self.personId = [textField.text stringByAppendingString:string];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHECK object:nil];

    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.nameTF) {
        self.nameStr = textField.text;
    }else if (textField == self.communityTF)
    {
        self.regionNameStr = textField.text;
        
    }else if (textField == self.roadTF)
    {
        self.addressStr = textField.text;
    }else if (textField == self.idTF)
    {
        self.personId = textField.text;
        if ([self isIDCardNumber:textField.text]== NO ) {
            [YDBAlertView showToast:@"身份证格式错误" dismissDelay:1.0];
        }
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHECK object:nil];

}


//-(void)chooseIdPhoto:(UIButton *)btn{
//
//    if (btn == self.leftImgBtn) {
//        self.leftIdImg = YES;
//    }else
//    {
//        self.leftIdImg = NO;
//    }
//
//    XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
//    popView.delegate = self;
//    [popView show];
//}
//
//-(void)selectWayIndex:(NSInteger)index
//{
//    if (index == 0) {//选择照片
//
//
//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//
//            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            picker.delegate = self;
//            [self.navigationController presentViewController:picker animated:YES completion:nil];
//
//        }else
//        {
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"没有获取到相册权限，请到设置中重新设置" dismissTimeInterval:1.0];
//
//        }
//
//
//
//    }else//拍照
//    {
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
//
//    }
//
//
//}
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//
//
//    [self dealWithPickerImgL:image];
//}


////处理选择的身份图片
//-(void)dealWithPickerImgL:(UIImage *)img{
//
//    if (self.leftIdImg) {
//        self.leftIDImg = img;
//        [self.leftImgBtn setBackgroundImage:img forState:UIControlStateNormal];
//        [self.leftImgBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        [self.leftImgBtn setTitle:@"" forState:UIControlStateNormal];
//
//    }else
//    {
//        self.rightIDImg = img;
//        [self.rightImgBtn setBackgroundImage:img forState:UIControlStateNormal];
//
//        [self.rightImgBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        [self.rightImgBtn setTitle:@"" forState:UIControlStateNormal];
//    }
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHECK object:nil];
//
//
//}
/** 性别选取器 */
-(void)sexHandler:(UIButton *)sender{
    if (sender == self.manBtn) {
        self.gendor = @"男";
        self.manBtn.selected = YES;
        self.womanBtn.selected = NO;
    }else
    {
        self.manBtn.selected = NO;
        self.womanBtn.selected = YES;
        self.gendor = @"女";
    }
}
//点击确认
-(void)clickConfirmBtnWithHandler:(UIButton *) sender{
   
   
//    sender.enabled = NO;
    if (self.nameStr.length==0||self.nameStr==nil) {
         [YDBAlertView showToast:@"请输入姓名" dismissDelay:1.0];
    }else if (self.gendor.length==0||self.gendor==nil){
        [YDBAlertView showToast:@"请选择性别" dismissDelay:1.0];
    }else if (self.personId.length==0||self.personId==nil){
        [YDBAlertView showToast:@"请输入身份证号码" dismissDelay:1.0];
    }else if (self.phoneLab.text.length==0||self.phoneLab==nil){
         [YDBAlertView showToast:@"请输入手机号码" dismissDelay:1.0];
    }else if (self.cityIDStr.length==0||self.cityIDStr==nil){
        [YDBAlertView showToast:@"请选择地区" dismissDelay:1.0];
    }else if (self.regionNameStr.length==0||self.regionNameStr==nil){
        [YDBAlertView showToast:@"请输入详细地址" dismissDelay:1.0];
    }else{
        [self uploadData];
    }
//    [self upLoadFirstImg:self.leftIDImg];
    
}


//-(void)upLoadFirstImg:(UIImage *)img{
//    WeakSelf;
//    [XYBestAllNet commonUploadImgWith:img resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
//        if (error == nil) {
//            weakSelf.faceImgID = blockDictionary[@"fileId"];
//            [weakSelf uploadSecondImg:self.rightIDImg];
//        }
//    }];
//
//}
//-(void)uploadSecondImg:(UIImage *)img{
//    WeakSelf;
//    [XYBestAllNet commonUploadImgWith:img resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
//        if (error == nil) {
//            weakSelf.backImgID = blockDictionary[@"fileId"];
//            [weakSelf uploadData];
//        }
//    }];
//}

//提交信息
-(void)uploadData{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"name"]= self.nameStr;
    param[@"mobilePhone"] = self.phoneLab.text;
    param[@"sex"] = self.gendor;
    param[@"regionId"] = self.cityIDStr;
    param[@"mobileCode"] = self.codeField.text;
    NSLog(@"%@",self.oders);
    param[@"orderId"] = self.oders;
    param[@"address"] = self.regionNameStr;
//    param[@"regionId"] = self.gendor;
    param[@"idNum"] = self.personId;
    param[@"type"]=@"1";

    WeakSelf;
    [XYBoardBandNet netSupplyBoardbandInfo:param block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //这个字符串是你要跳转面板的名字
            JXSuccessAccountViewController *main =[board instantiateViewControllerWithIdentifier:@"JXSuccessAccountID"];
            main.isActivity=weakSelf.isActivity;
            [weakSelf.navigationController pushViewController:main animated:YES];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(needRefreshData)]) {
//                    [weakSelf.delegate needRefreshData];
//                }
//                [weakSelf.navigationController popViewControllerAnimated:YES];
//            });
        }
    }];
}




@end
