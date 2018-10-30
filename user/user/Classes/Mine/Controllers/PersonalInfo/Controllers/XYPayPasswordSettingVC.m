//
//  XYPayPasswordSettingVC.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPayPasswordSettingVC.h"
#import "XYPayPasswordSettingTVCell.h"

#import "XYUserInfoModel.h"

#import "XYPersonInfoNet.h"

@interface XYPayPasswordSettingVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
/** 个人信息表 */
@property(nonatomic,strong) UITableView *tableView;
/** 底层视图 */
@property(strong,nonatomic) UIView *footView ;
/** 退出账号按钮 */
@property(strong,nonatomic) UIButton *confirmBtn ;
/** 手机号输入框 */
@property(strong,nonatomic) UITextField *mobileTF ;
/** 验证码输入框 */
@property(strong,nonatomic) UITextField *verificationCodeTF ;
/** 点击获取验证码按钮 */
@property(strong,nonatomic) UIButton *countBtn ;
/** 输入新密码 */
@property(strong,nonatomic) UITextField *passwordTF ;
/** 确认新密码输入框 */
@property(strong,nonatomic) UITextField *confirmPasswordTF ;

/** 倒计时 */
@property(assign,nonatomic) NSInteger countNum ;
/** timer */
@property(strong,nonatomic) NSTimer *timer ;
/** 总共点了几次获取验证码 */
@property(assign,nonatomic) NSInteger totalClickCountNum ;

/** 个人账号 */
@property(strong,nonatomic) XYUserInfoModel *infoModel ;

@end


static NSString *const XYPayPasswordSettingTVCellID = @"XYPayPasswordSettingTVCell";


@implementation XYPayPasswordSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"支付密码设置";
    
    [self initGui];
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];

}

-(void)initGui{
    
    
    NSDictionary * userinfoDict = [XYUserDefaults readUserDefaultsInfo];
    
    if (userinfoDict.count == 0) {
        return;
    }
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _infoModel = [XYUserInfoModel mj_objectWithKeyValues:userinfoDict];
    self.mobileTF.text = _infoModel.mobile;
    self.tableView.tableFooterView = self.footView;
    [self.footView addSubview:self.confirmBtn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    self.footView.frame = CGRectMake(0, 0, XYScreenW, 100);
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(47);
        make.right.mas_equalTo(-47);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(35);
    }];
    
    
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XYPayPasswordSettingTVCell class] forCellReuseIdentifier:XYPayPasswordSettingTVCellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = XYFont_14;
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmBtn setBackgroundColor:XYMainColor];
        _confirmBtn.layer.cornerRadius = 5;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn addTarget:self action:@selector(confirmPasswordSetting:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confirmBtn;
}

-(UIView *)footView{
    
    if (!_footView) {
        _footView = [[UIView alloc] init];
    }
    return _footView;
}


-(UITextField *)mobileTF
{
    if (!_mobileTF) {
        _mobileTF = [[UITextField alloc] init];
        _mobileTF.font = XYFont_14;
        _mobileTF.textColor = XYFontTitleColor;
        _mobileTF.placeholder = @"请输入绑定的手机号";
        _mobileTF.enabled = NO;
        _mobileTF.keyboardType = UIKeyboardTypeNumberPad;
        _mobileTF.delegate = self;
    }
    return _mobileTF;

}

-(UITextField *)verificationCodeTF
{
    if (!_verificationCodeTF) {
        _verificationCodeTF = [[UITextField alloc] init];
        _verificationCodeTF.placeholder = @"请输入短信验证码";
        _verificationCodeTF.font = XYFont_14;
        _verificationCodeTF.textColor = XYFontTitleColor;
        _verificationCodeTF.keyboardType = UIKeyboardTypeNumberPad;
        _verificationCodeTF.delegate = self;
    }
    return _verificationCodeTF;
    

}

-(UITextField *)passwordTF
{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.placeholder = @"请输入您的6位数字密码";
        _passwordTF.textColor = XYFontTitleColor;
        _passwordTF.font = XYFont_14;
        _passwordTF.delegate = self;
        _passwordTF.secureTextEntry = YES;
        _passwordTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _passwordTF;

}

-(UITextField *)confirmPasswordTF
{
    if (!_confirmPasswordTF) {
        _confirmPasswordTF = [[UITextField alloc] init];
        _confirmPasswordTF.placeholder = @"请输入确认密码";
        _confirmPasswordTF.textColor = XYFontTitleColor;
        _confirmPasswordTF.font = XYFont_14;
        _confirmPasswordTF.delegate = self;
        _confirmPasswordTF.secureTextEntry = YES;
        _confirmPasswordTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _confirmPasswordTF;

}

-(UIButton *)countBtn
{
    if (!_countBtn) {
        _countBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _countBtn.titleLabel.font = XYFont_14;
        _countBtn.backgroundColor = XYWhiteColor;
        [_countBtn setTitleColor:XYMainColor forState:UIControlStateNormal];
        [_countBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        _countBtn.layer.cornerRadius = 3;
        _countBtn.layer.borderWidth = 0.5;
        _countBtn.layer.borderColor = XYMainColor.CGColor;
        _countBtn.layer.masksToBounds = YES;
        
        [_countBtn addTarget:self action:@selector(countBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _countBtn;

}

//获取验证码
-(void)countBtnHandler:(UIButton *)sender
{
    WeakSelf;
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"phone"] = _infoModel.mobile;
    param[@"type"] =@"2";
    [XYPersonInfoNet netGetVeriCodeWithDic:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            weakSelf.countNum = 60;
            
            
            weakSelf.countBtn.enabled = NO;
            self.totalClickCountNum ++;
            
            [weakSelf.countBtn setTitle:@"60S" forState:UIControlStateNormal];
            weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
            
            [[NSRunLoop currentRunLoop] addTimer:weakSelf.timer forMode:NSRunLoopCommonModes];
        }
    }];
    
 
    
}

//倒计时
- (void)timerStart:(NSTimer*)sender{
    WeakSelf;
    weakSelf.countNum -- ;
    
    if (weakSelf.countNum == -1) {
        [weakSelf.countBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [_timer invalidate];
        if (weakSelf.totalClickCountNum <3) {
            weakSelf.countBtn.enabled = YES;
        }else
        {
            weakSelf.countBtn.enabled = NO;
            weakSelf.countBtn.layer.borderColor = XYGrayColor.CGColor;
            [weakSelf.countBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        }
        
    }else
    {
        [weakSelf.countBtn setTitle:[NSString stringWithFormat:@"%ldS",(long)_countNum] forState:UIControlStateNormal];
        
        
    }
    
}
//确认
-(void)confirmPasswordSetting:(id)sender
{
    
    if (self.verificationCodeTF.text.length != 6) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"没有输入验证码" dismissTimeInterval:1.0];
        return;
    }
    
    
    if (self.passwordTF.text != self.confirmPasswordTF.text) {
        
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"两个密码不相同" dismissTimeInterval:1.0];
        return;
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"mobileCode"] = self.verificationCodeTF.text;
    param[@"password"] = self.passwordTF.text;
    WeakSelf;
    [XYPersonInfoNet netChangePayWithDic:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }
    }];
    
}


#pragma Mark - table view datasource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44.f;
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
    XYPayPasswordSettingTVCell *cell = [tableView dequeueReusableCellWithIdentifier:XYPayPasswordSettingTVCellID forIndexPath:indexPath];

    [self cellWithIndexPath:indexPath cell:cell];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
        return 13.f;
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
///处理cell
-(void)cellWithIndexPath:(NSIndexPath *)indexPath cell:(XYPayPasswordSettingTVCell *)cell{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"绑定手机";
            
            [cell.contentView addSubview:self.mobileTF];
            [self.mobileTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.lineView.mas_right).offset(XY_Left_Margin);
                make.top.bottom.mas_equalTo(0);
                make.right.mas_equalTo(XY_Right_Margin);
            }];
            
        }else
        {
            cell.titleLab.text = @"验证码";
            [cell.contentView addSubview:self.countBtn];
            [cell.contentView addSubview:self.verificationCodeTF];
            [self.countBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(XY_Right_Margin);
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.width.mas_equalTo(86);
                make.height.mas_equalTo(26);
            }];
            [self.verificationCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.lineView.mas_right).offset(XY_Left_Margin);
                make.top.bottom.mas_equalTo(0);
                make.right.mas_equalTo(_countBtn.mas_left).offset(-10);
            }];
            
            
        }
    }else
    {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"输入新密码";
            [cell.contentView addSubview:self.passwordTF];
            [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.lineView.mas_right).offset(XY_Left_Margin);
                make.right.mas_equalTo(XY_Right_Margin);
                make.top.bottom.mas_equalTo(0);
            }];
            
        }else
        {
            cell.titleLab.text = @"确认新密码";
            [cell.contentView addSubview:self.confirmPasswordTF];
            [self.confirmPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.lineView.mas_right).offset(XY_Left_Margin);
                make.right.mas_equalTo(XY_Right_Margin);
                make.top.bottom.mas_equalTo(0);
            }];
        }
    
    }

}


#pragma mark -  输入框代理

-(void)textFieldDidEndEditing:(UITextField *)textField
{

}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (textField == self.verificationCodeTF) {
        if (textField.text.length >5) {
            return NO;
        }
    }
    if (textField == self.passwordTF) {
        if (textField.text.length >5) {
            return NO;
        }
    }
    
    if (textField == self.confirmPasswordTF) {
        if (textField.text.length >5) {
            return NO;
        }

    }
    
    return YES;
}



@end
