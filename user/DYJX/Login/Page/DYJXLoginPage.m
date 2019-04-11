//
//  DYJXLoginPage.m
//  user
//
//  Created by 岩  熊 on 2018/10/25.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLoginPage.h"
#import "DYJXLoginViewModel.h"
#import "DYJXRegistePage.h"
#import "DYJXFindPasswordPage.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "AppDelegate.h"
#import "iPhoneXBottomBackgroundView.h"

@interface DYJXLoginPage ()
@property (weak, nonatomic) IBOutlet UIView *verticationBackView;
@property (weak, nonatomic) IBOutlet UIView *passwordBackView;
@property (weak, nonatomic) IBOutlet UIButton *passwordButton;
@property (weak, nonatomic) IBOutlet UIButton *mobileButton;
@property (weak, nonatomic) IBOutlet UIButton *obtainVerCodeButton;
@property (weak, nonatomic) IBOutlet UITextField *veriticationTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPsButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property(nonatomic ,strong) DYJXLoginViewModel *viewModel;
@property(nonatomic, strong)iPhoneXBottomBackgroundView *bottomBackgroundView;
@property(nonatomic, copy)NSString *rndCode;
@property(nonatomic, strong)UIButton *button1;
@property(nonatomic, strong)UIButton *button2;

@end

@implementation DYJXLoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"登录";
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self initSubViews];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.veriticationTextField.secureTextEntry = NO;

    self.obtainVerCodeButton.hidden = NO;
    self.veriticationTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.loginButton.frame = CGRectMake((kScreenWidth - 137)/2.0, 186, 137, 45);

    self.userNameTF.placeholder = @"手机号";
    self.userNameTF.keyboardType = UIKeyboardTypeNumberPad;
    self.forgetPsButton.hidden = YES;
    self.registerButton.hidden = YES;
    self.passwordTF.hidden = YES;
    self.passwordBackView.hidden = YES;
    [self.mobileButton setSelected:YES];
    [self.passwordButton setSelected:NO];

    [self.mobileButton addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
    [self.passwordButton addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];

    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button1 setTitle:@"手机验证码登录" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateSelected];
    _button1.tag = 3;
    [_button1 setSelected:YES];
    [_button1 addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_button1];

    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:@selector(emptyClick)];
    item1.width = 30;

    self.navigationItem.leftBarButtonItems = @[item1,item];

    _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button2 setTitle:@"密码登录" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateSelected];
    _button2.tag = 4;
    [_button2 addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:_button2];

    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:@selector(emptyClick)];
    item3.width = 40;

    self.navigationItem.rightBarButtonItems = @[item3,item2];

//    self.userNameTF.text = @"13612846724";
//    self.passwordTF.text = @"111111";
//    self.userNameTF.text = @"13750820441";
//    self.passwordTF.text = @"654321";
}

-(void)emptyClick {

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
//    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSubViews{
    [self.view addSubview:self.bottomBackgroundView];
    [self.view sendSubviewToBack:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(34);
    }];
}

-(void)selectType:(UIButton *)sender {
    if (sender.tag == 3) {
        [self.button1 setSelected:YES];
        [self.button2 setSelected:NO];
        [self.mobileButton setSelected:YES];
        [self.passwordButton setSelected:NO];
        self.obtainVerCodeButton.hidden = NO;
        self.veriticationTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.veriticationTextField.hidden = NO;
        self.verticationBackView.hidden = NO;

        self.loginButton.frame = CGRectMake((kScreenWidth - 137)/2.0, 186, 137, 45);
        self.userNameTF.placeholder = @"手机号";
        self.userNameTF.keyboardType = UIKeyboardTypeNumberPad;
        self.forgetPsButton.hidden = YES;
        self.registerButton.hidden = YES;
        self.passwordTF.hidden = YES;
        self.passwordBackView.hidden = YES;
    }
    else {
        [self.button1 setSelected:NO];
        [self.button2 setSelected:YES];
        [self.mobileButton setSelected:NO];
        [self.passwordButton setSelected:YES];
        self.obtainVerCodeButton.hidden = YES;
        self.veriticationTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.veriticationTextField.hidden = YES;
        self.verticationBackView.hidden = YES;
        self.loginButton.frame = CGRectMake((kScreenWidth - 137)/2.0, 206, 137, 45);
        self.userNameTF.placeholder = @"用户名/手机号/ID号";
        self.userNameTF.keyboardType = UIKeyboardTypeDefault;
        self.forgetPsButton.hidden = NO;
        self.registerButton.hidden = NO;
        self.passwordTF.hidden = NO;
        self.passwordBackView.hidden = NO;
    }
}

- (IBAction)loginButtonClick:(UIButton *)sender {
    if (self.mobileButton.isSelected == YES) {
        if ([YWDTools isNil:self.userNameTF.text]) {
            [YDBAlertView showToast:@"请输入账号"];
            return;
        }
        if ([YWDTools isNil:self.veriticationTextField.text]) {
            [YDBAlertView showToast:@"请输入验证码"];
            return;
        }
        [self.viewModel loginCodeWithPhoneNumber:self.userNameTF.text Password:self.veriticationTextField.text rndCode:self.rndCode Success:^{
            DYJXIdentitySwitchingPage *identitySwitchingPage = [[DYJXIdentitySwitchingPage alloc]initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil];
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.rootViewController = [[NaviViewController alloc]initWithRootViewController:identitySwitchingPage];
            XYKeyWindow.rootViewController = appDelegate.rootViewController;
        } failed:^(NSString *errorMsg) {

        }];
    }
    else {
        if ([YWDTools isNil:self.userNameTF.text]) {
            [YDBAlertView showToast:@"请输入账号"];
            return;
        }
        if ([YWDTools isNil:self.passwordTF.text]) {
            [YDBAlertView showToast:@"请输入密码"];
            return;
        }
        [self.viewModel loginWithPhoneNumber:self.userNameTF.text Password:self.passwordTF.text Success:^{
            DYJXIdentitySwitchingPage *identitySwitchingPage = [[DYJXIdentitySwitchingPage alloc]initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil];
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.rootViewController = [[NaviViewController alloc]initWithRootViewController:identitySwitchingPage];
            XYKeyWindow.rootViewController = appDelegate.rootViewController;
        } failed:^(NSString *errorMsg) {

        }];
    }
}

- (IBAction)registerCode:(id)sender {
    if ([YWDTools isNil:self.userNameTF.text]) {
        [YDBAlertView showToast:@"请填写手机号"];
        return;
    }

    [self.viewModel getAuthorizationCodeWithPhoneNumber:self.userNameTF.text Success:^(NSString *randCode) {
        if (![YWDTools isNil:randCode]) {
            [YDBAlertView showToast:@"验证码发送成功！"];
            self.rndCode = randCode;
        }
    } failed:^(NSString *errorMsg) {

    }];
}

- (IBAction)registeBTNClick:(UIButton *)sender {
    DYJXRegistePage *registePage = [[DYJXRegistePage alloc]initWithNibName:@"DYJXRegistePage" bundle:nil];
    [self.navigationController pushViewController:registePage animated:YES];
}
- (IBAction)findPasswordBtnClick:(UIButton *)sender {
    
    DYJXFindPasswordPage *findPasswordPage = [[DYJXFindPasswordPage alloc]initWithNibName:@"DYJXFindPasswordPage" bundle:nil];
    [self.navigationController pushViewController:findPasswordPage animated:YES];
}


- (DYJXLoginViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXLoginViewModel alloc]init];
    }
    return _viewModel;
}

- (iPhoneXBottomBackgroundView *)bottomBackgroundView{
    if (!_bottomBackgroundView) {
        _bottomBackgroundView = [[NSBundle mainBundle]loadNibNamed:@"iPhoneXBottomBackgroundView" owner:self options:nil].firstObject;

    }
    return _bottomBackgroundView;
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
