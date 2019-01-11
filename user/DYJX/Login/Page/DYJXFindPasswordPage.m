//
//  DYJXFindPasswordPage.m
//  user
//
//  Created by 岩  熊 on 2018/10/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXFindPasswordPage.h"
#import "DYJXGetBackPwdAuthorizationCodeViewModel.h"

@interface DYJXFindPasswordPage ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *secondPasswordTF;

@property(nonatomic, strong)DYJXGetBackPwdAuthorizationCodeViewModel *viewModel;
@property(nonatomic, copy)NSString *randCode;
@property(nonatomic, strong)UIView *bottomBackgroundView;
@end

@implementation DYJXFindPasswordPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密码设置";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
    NSFontAttributeName:[UIFont systemFontOfSize:18]};

    [self initNavigation];
    [self initSubViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)initNavigation{
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(getBackPwd) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

- (void)initSubViews{
    [self.view addSubview:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(34);
    }];
}

- (IBAction)getBackPwdAuthorizationCode:(UIButton *)sender {
    if ([YWDTools isNil:self.phoneNumTF.text]) {
        [YDBAlertView showToast:@"请输入手机号！"];
        return;
    }
    [self.viewModel getBackPwdAuthorizationCodeWithPhoneNumber:self.phoneNumTF.text Success:^(NSString *randCode) {
        if (![YWDTools isNil:randCode]) {
            [YDBAlertView showToast:@"验证码发送成功！"];
             self.randCode = randCode;
        }
    } failed:^(NSString *errorMsg) {
        
    }];
    
}

- (void)getBackPwd{
    if ([YWDTools isNil:self.phoneNumTF.text]) {
        [YDBAlertView showToast:@"请输入手机号！"];
        return;
    }
    if ([YWDTools isNil:self.codeTF.text]) {
        [YDBAlertView showToast:@"请输入验证码！"];
        return;
    }
    if ([YWDTools isNil:self.randCode]) {
        [YDBAlertView showToast:@"请重新获取验证码！"];
        return;
    }
    if ([YWDTools isNil:self.passwordTF.text]) {
        [YDBAlertView showToast:@"请输入新密码！"];
        return;
    }
    if ([YWDTools isNil:self.secondPasswordTF.text]) {
        [YDBAlertView showToast:@"请确认新密码！"];
        return;
    }
    if (![self.passwordTF.text isEqualToString:self.secondPasswordTF.text]) {
        [YDBAlertView showToast:@"两次密码不一致！"];
        return;
    }
    [self.viewModel resetPwdWithPhoneNumber:self.phoneNumTF.text AuthorizationCode:self.codeTF.text ranCode:self.randCode password:self.passwordTF.text Success:^{
        [YDBAlertView showToast:@"重置密码成功！"];
        [self.navigationController popViewControllerAnimated:YES];

    } failed:^(NSString *errorMsg) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYJXGetBackPwdAuthorizationCodeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXGetBackPwdAuthorizationCodeViewModel alloc]init];
    }
    return _viewModel;
}

- (UIView *)bottomBackgroundView{
    if (!_bottomBackgroundView) {
        _bottomBackgroundView = [[UIView alloc]init];
        _bottomBackgroundView.backgroundColor = [UIColor colorWithHexString:@"#15293B"];
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
