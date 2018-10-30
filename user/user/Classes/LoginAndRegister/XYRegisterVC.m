//
//  XYRegisterVC.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYRegisterVC.h"

@interface XYRegisterVC () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
}

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

/** 列表脚 */
@property (nonatomic, strong) UIView * footerView;
/** 登录按钮 */
@property (nonatomic, strong) UIButton * loginBT;

/** 用户名 */
@property(nonatomic, strong) UITextField * userNameTF;
/** 用户名 */
@property(nonatomic, strong) UITextField * codeTF;
/** 密码 */
@property(nonatomic, strong) UITextField * passWordTF;

/** 获取验证码 按钮 */
@property(nonatomic, strong) UIButton * codeBT;

@end

@implementation XYRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];
    
}

- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = self.footerView;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 70)];
        _footerView.backgroundColor = XYGlobalBg;
        
        [_footerView addSubview:self.loginBT];
        
        [self.loginBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
            make.height.mas_equalTo(40);
        }];
    }
    return _footerView;
}

- (UIButton*)loginBT
{
    if (_loginBT == nil) {
        _loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBT.frame = CGRectZero;
        
        _loginBT.backgroundColor = XYWhiteColor;
        
        [_loginBT setTitle:@"注册" forState:UIControlStateNormal];
        [_loginBT setTitleColor:XYBlackColor forState:UIControlStateNormal];
        
        _loginBT.layer.borderWidth = 1;
        _loginBT.layer.borderColor = XYGrayColor.CGColor;
        
        [_loginBT addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBT;
}

- (UIButton*)codeBT
{
    if (_codeBT == nil) {
        _codeBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _codeBT.frame = CGRectZero;
        
        [_codeBT setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        _codeBT.layer.borderWidth = 1;
        _codeBT.layer.borderColor = XYGrayColor.CGColor;
        
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
        _userNameTF.font = XYFont_16;
        _userNameTF.textColor = XYBlackColor;
        
        _userNameTF.placeholder = @"手机号码";
        
    }
    return _userNameTF;
}

- (UITextField*)codeTF
{
    if (_codeTF == nil) {
        _codeTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _codeTF.delegate = self;
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
        _codeTF.font = XYFont_16;
        _codeTF.textColor = XYBlackColor;
        
        _codeTF.placeholder = @"手机号码";
        
    }
    return _userNameTF;
}

- (UITextField*)passWordTF
{
    if (_passWordTF == nil) {
        _passWordTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _passWordTF.delegate = self;
        _passWordTF.secureTextEntry = YES;
        _passWordTF.font = XYFont_16;
        _passWordTF.textColor = XYBlackColor;
        
        _passWordTF.placeholder = @"设置密码";
        
    }
    return _passWordTF;
}


#pragma mark - button click

/** 注册 */
- (void)loginButtonClick:(UIButton*)sender
{
    [self.view endEditing:YES];
    
    
    
}

/** 获取验证码  */
- (void)codeButtonClick:(UIButton*)sender
{
    [self startWithSecond:60];
}



#pragma mark - UITableViewDelegate   UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    if (indexPath.row == 0) {
        
        [cell.contentView addSubview:self.userNameTF];
        [self.userNameTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
       
    }else if (indexPath.row == 1){
        
        [cell.contentView addSubview:self.codeTF];
        [self.codeTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        [cell.contentView addSubview:self.codeBT];
        [self.codeBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(40);
        }];
        
        
    }else if (indexPath.row == 2){
        
        [cell.contentView addSubview:self.passWordTF];
        [self.passWordTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
    }
    
    return cell;
}
#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSUInteger phoneLength = self.userNameTF.text.length;
    NSUInteger codeLength = self.codeTF.text.length;
    NSUInteger passwordLength = self.passWordTF.text.length;
    NSUInteger newLength = textField.text.length - range.length + string.length;
    if (textField == self.userNameTF) {
        if (newLength > 11) {
            return NO;
        }
        phoneLength = newLength;
    }
    
    if (textField == self.passWordTF) {
        if (newLength > 20) {
            return NO;
        }
        passwordLength = newLength;
    }
    
    if (textField == self.codeTF) {
        codeLength = newLength;
    }
    
    if (phoneLength != 0) {
        _codeBT.enabled = YES;
    }else{
        _codeBT.enabled = NO;
    }
    
    
    if (phoneLength != 0 && passwordLength != 0 && newLength != 0 && codeLength != 0) {
        _loginBT.enabled = YES;
        //        _loginBT.backgroundColor = XYWhiteColor;
    }else{
        _loginBT.enabled = NO;
        //        _loginBT.backgroundColor = XYRGBColor(175, 175, 175);
    }
    
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
