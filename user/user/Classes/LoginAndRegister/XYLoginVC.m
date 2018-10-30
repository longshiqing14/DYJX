//
//  XYLoginVC.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//  登录

#import "XYLoginVC.h"


#import "XYLoginAndRegisterNet.h"

#import "XYLocalCheck.h"  //判断

#import "XYTabbarController.h"

NSString *const LOGIN_SUCCESS = @"LOGIN_SUCCESS";
@interface XYLoginVC () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
}

/** 底图 */
@property (nonatomic, strong) UIImageView * bgImageView;

/** 返回 按钮 */
@property(nonatomic, strong) UIButton * leftNavBT;

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

/** 列表头 */
@property (nonatomic, strong) UIView * headerView;
/** 列表头 图 */
@property (nonatomic, strong) UIImageView * headerImageView;
/** 列表脚 */
@property (nonatomic, strong) UIView * footerView;
/** 登录按钮 */
@property (nonatomic, strong) UIButton * loginBT;
///** 找回密码 按钮 */
//@property (nonatomic, strong) UIButton * findPasswordBT;

/** 用户名 */
@property(nonatomic, strong) UITextField * userNameTF;
/** 密码 */
@property(nonatomic, strong) UITextField * codeTF;

/** 获取验证码 按钮 */
@property(nonatomic, strong) UIButton * codeBT;

@end

@implementation XYLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];
    
}


- (void)addViewAndLayout
{
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.leftNavBT];
    [self.leftNavBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.width.mas_equalTo(44);
    }];
    
    
}

#pragma mark - 懒加载

- (UIImageView*)bgImageView
{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImageView.backgroundColor = XYWhiteColor;
        _bgImageView.image = [UIImage imageNamed:@"login_bg"];
//        _headerImageView.contentMode = UIViewContentModeCenter;
    }
    return _bgImageView;
}

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = self.footerView;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}

- (UIButton*)leftNavBT
{
    if (_leftNavBT == nil) {
        _leftNavBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftNavBT.frame = CGRectZero;
        [_leftNavBT setImage:[UIImage imageNamed:@"nav_btn_black_goback"] forState:UIControlStateNormal];
        
        [_leftNavBT addTarget:self action:@selector(leftNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftNavBT;
}

/** 头 */
- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 172 + 64)];
        _headerView.backgroundColor = [UIColor clearColor];
        
        [_headerView addSubview:self.headerImageView];
        
        [self.headerImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView.mas_centerX);
            make.top.mas_equalTo(21 + 64);
//            make.height.width.mas_equalTo(40);
        }];
    }
    return _headerView;
}

- (UIImageView*)headerImageView
{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _headerImageView.contentMode = UIViewContentModeCenter;
        
        _headerImageView.image = [UIImage imageNamed:@"login_logo"];
        
    }
    return _headerImageView;
}

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]init];
        _footerView.frame = CGRectMake(0, 0, XYScreenW, 82);
        _footerView.backgroundColor = [UIColor clearColor];
        
        [_footerView addSubview:self.loginBT];
        [self.loginBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.mas_equalTo(43);
            make.right.mas_equalTo(-43);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _footerView;
}

- (UIButton*)loginBT
{
    if (_loginBT == nil) {
        _loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBT.frame = CGRectZero;
        
        _loginBT.backgroundColor = XYBlackColor;
        
        [_loginBT setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBT.titleLabel setFont:XYFont_16];
        
//        [_loginBT setBackgroundImage:[UIImage imageNamed:@"login_btn_login"] forState:UIControlStateNormal];
        
        _loginBT.layer.cornerRadius = 4;
        _loginBT.layer.masksToBounds = YES;
        
        
        
        
        [_loginBT addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBT;
}

- (UIButton*)codeBT
{
    if (_codeBT == nil) {
        _codeBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _codeBT.frame = CGRectZero;
        _codeBT.backgroundColor = [UIColor clearColor];
        
        [_codeBT setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_codeBT setTitleColor:XYBlackColor forState:UIControlStateNormal];
        
        [_codeBT.titleLabel setFont:XYFont_14];
        
        [_codeBT addTarget:self action:@selector(codeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _codeBT;
}

- (UITextField*)userNameTF
{
    if (_userNameTF == nil) {
        _userNameTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _userNameTF.delegate = self;
        _userNameTF.keyboardType = UIKeyboardTypeNumberPad;
        [_userNameTF setClearButtonMode:UITextFieldViewModeWhileEditing];
        _userNameTF.font = XYFont_14;
        _userNameTF.textColor = XYBlackColor;
//        _userNameTF.borderStyle=UITextBorderStyleRoundedRect;
        
        _userNameTF.layer.cornerRadius = 4;
        _userNameTF.layer.masksToBounds = YES;
        
        _userNameTF.layer.borderWidth = 0.5;
        _userNameTF.layer.borderColor = XYBlackColor.CGColor;
        
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_phone"]];
        _userNameTF.leftView = imgView;
        _userNameTF.leftViewMode=UITextFieldViewModeAlways;
        
        _userNameTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入手机号码"
                                                                            attributes:@{NSFontAttributeName:XYFont_14,
                                                                                           NSForegroundColorAttributeName:XYGrayColor}];
        
    }
    return _userNameTF;
}

- (UITextField*)codeTF
{
    if (_codeTF == nil) {
        _codeTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _codeTF.delegate = self;
        _codeTF.font = XYFont_14;
        _codeTF.textColor = XYBlackColor;
        
        _codeTF.layer.cornerRadius = 4;
        _codeTF.layer.masksToBounds = YES;
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
        _codeTF.layer.borderWidth = 0.5;
        _codeTF.layer.borderColor = XYBlackColor.CGColor;
        
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_code"]];
        _codeTF.leftView = imgView;
        _codeTF.leftViewMode=UITextFieldViewModeAlways;
        
        _codeTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入验证码"
                                                                    attributes:@{NSFontAttributeName:XYFont_14,
                                                                                NSForegroundColorAttributeName:XYGrayColor}];
        
    }
    return _codeTF;
}


#pragma mark - button click

/** 登录 */
- (void)loginButtonClick:(UIButton*)sender
{
    [self.view endEditing:YES];
    
    if ([self.userNameTF.text isEqualToString:@""]) {
        [YDBAlertView showToast:@"请输入手机号" dismissDelay:1.0];
        return;
    }
    
//    if (![XYLocalCheck ismobile:self.userNameTF.text]) {
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"手机号不正确" dismissTimeInterval:1.0];
//        return;
//    }

    
    if ([self.codeTF.text isEqualToString:@""]) {
        [YDBAlertView showToast:@"请输入验证码" dismissDelay:1.0];
        return;
    }
    
    WeakSelf;
    [XYLoginAndRegisterNet netUserLoginByCodeWithMobile:self.userNameTF.text vcode:self.codeTF.text block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            [XYUserDefaults writeUserDefaultsRegisteredDict:[XYCommon removeNull:blockDictionary]];
//            [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_SUCCESS object:nil];
            [XYLoginAndRegisterNet netUpdateCIDBindBlock:nil];
//            XYKeyWindow.rootViewController = [[XYTabbarController alloc]init];
            [weakSelf leftNavButtonClick];
            
            
            
        }else{
            
        }
        
    }];
    
    
}

/** 获取验证码 */
- (void)codeButtonClick:(UIButton*)sender
{
    [self.view endEditing:YES];
    if ([self.userNameTF.text isEqualToString:@""]) {
        [YDBAlertView showToast:@"请输入手机号" dismissDelay:1.0];
        return;
    }
    
//    if (![XYLocalCheck ismobile:self.userNameTF.text]) {
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"手机号不正确" dismissTimeInterval:1.0];
//        return;
//    }
    
    sender.enabled = NO;
    
    WeakSelf;
    [XYLoginAndRegisterNet netGetVcodeWithMobile:self.userNameTF.text block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            [weakSelf startWithSecond:60];
        }else{
            sender.enabled = YES;
        }
        
        
    }];
    
    
}

/** 返回 */
- (void)leftNavButtonClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - UITableViewDelegate   UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    
    if (indexPath.row == 0) {
        
        [cell.contentView addSubview:self.userNameTF];
        
        [self.userNameTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(47);
            make.right.mas_equalTo(-47);
        }];
        
    }else if (indexPath.row == 1){
        
        [cell.contentView addSubview:self.codeTF];
        
        [self.codeTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(47);
            make.right.mas_equalTo(-47);
        }];
        
        [cell.contentView addSubview:self.codeBT];
        [self.codeBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-50);
            make.centerY.mas_equalTo(_codeTF.mas_centerY);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(35);
        }];
        
    }
    
    return cell;
}

/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSUInteger phoneLength = self.userNameTF.text.length;
    NSUInteger codeLength = self.codeTF.text.length;
    NSUInteger newLength = textField.text.length - range.length + string.length;
    if (textField == self.userNameTF) {
        if (newLength > 11) {
            return NO;
        }
        phoneLength = newLength;
    }
    
    if (textField == self.codeTF) {
        if (newLength > 20) {
            return NO;
        }
        codeLength = newLength;
    }
    
    
//    if (phoneLength != 0 && newLength != 0) {
//        _codeBT.enabled = YES;
//    }else{
//        _codeBT.enabled = NO;
//    }
//    
//    if (phoneLength != 0 && codeLength != 0 && newLength != 0) {
//        _loginBT.enabled = YES;
////        _loginBT.backgroundColor = XYWhiteColor;
//    }else{
//        _loginBT.enabled = NO;
////        _loginBT.backgroundColor = XYRGBColor(175, 175, 175);
//    }
    
    return YES;
}

#pragma mark - 倒计时 button
/** 按钮 开始 倒计时 */
-(void)startWithSecond:(int)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}


-(void)timerStart:(NSTimer *)theTimer {
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
    _second = _totalSecond - (int)(deltaTime+0.5) ;
    
    if (_second< 0.0)
    {
        [self stop];
    }
    else
    {
        NSString *title = [NSString stringWithFormat:@"%d秒",_second];
        [_codeBT setTitle:title forState:UIControlStateNormal];
        
    }
}

- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _codeBT.enabled = YES;
                [_codeBT setTitle:@"重新获取" forState:UIControlStateNormal];
            }
        }
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
