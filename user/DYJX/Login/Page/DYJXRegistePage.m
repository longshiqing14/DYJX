//
//  DYJXRegistePage.m
//  user
//
//  Created by 岩  熊 on 2018/10/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXRegistePage.h"
#import "DYJXRegisteViewModel.h"

@interface DYJXRegistePage ()
@property (weak, nonatomic) IBOutlet UITextField *userPhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *secondPasswodeTF;
@property (weak, nonatomic) IBOutlet UIImageView *severImage;
@property (weak, nonatomic) IBOutlet UIButton *backToLoginBTN;
@property (nonatomic, assign) BOOL selectedSeverProtocol;
@property (nonatomic, strong) DYJXRegisteViewModel *viewModel;
@property(nonatomic, copy)NSString *randCode;
@property(nonatomic, strong)UIView *bottomBackgroundView;
@end

@implementation DYJXRegistePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    self.selectedSeverProtocol = YES;
    [self initNavigation];
    [self initSubViews];
    [self.backToLoginBTN setAttributedTitle:[YWDTools combineAttributeStr:@"已有账号 ？" color:@"#FFFFFF" secondAttributeStr:@"请登录》" color:@"#F2A73B"] forState:(UIControlStateNormal)];
}

- (void)initSubViews{
    [self.view addSubview:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(34);
    }];
}

- (void)initNavigation{
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(registeInfo) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

- (void)backToLastPage{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAuthorizationCode:(UIButton *)sender {
    if ([YWDTools isNil:self.userPhoneTF.text]) {
        [YDBAlertView showToast:@"请填写手机号"];
        return;
    }
    
    [self.viewModel getAuthorizationCodeWithPhoneNumber:self.userPhoneTF.text Success:^(NSString *randCode) {
        if (![YWDTools isNil:randCode]) {
            [YDBAlertView showToast:@"验证码发送成功！"];
            self.randCode = randCode;
        }
    } failed:^(NSString *errorMsg) {
        
    }];
    
}


- (IBAction)severBTNClick:(UIButton *)sender {
    self.selectedSeverProtocol = !self.selectedSeverProtocol;
    if (self.selectedSeverProtocol) {
        [self.severImage setImage:[UIImage imageNamed:@"register_checkbox_active"]];
    }else{
        [self.severImage setImage:[UIImage imageNamed:@"register_checkbox"]];
    }
}

- (void)registeInfo{
    if ([YWDTools isNil:self.userPhoneTF.text]) {
        [YDBAlertView showToast:@"请输入手机号！"];
        return;
    }
    if ([YWDTools isNil:self.verificationCodeTF.text]) {
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
    if ([YWDTools isNil:self.secondPasswodeTF.text]) {
        [YDBAlertView showToast:@"请确认新密码！"];
        return;
    }
    if (![self.passwordTF.text isEqualToString:self.secondPasswodeTF.text]) {
        [YDBAlertView showToast:@"两次密码不一致！"];
        return;
    }
    [self.viewModel registeWithPhoneNumber:self.userPhoneTF.text AuthorizationCode:self.verificationCodeTF.text ranCode:self.randCode password:self.passwordTF.text Success:^{
        [YDBAlertView showToast:@"注册成功！"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failed:^(NSString *errorMsg) {
        
    }];
}


- (DYJXRegisteViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXRegisteViewModel alloc]init];
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
