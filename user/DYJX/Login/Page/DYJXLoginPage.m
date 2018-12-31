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

@interface DYJXLoginPage ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property(nonatomic ,strong) DYJXLoginViewModel *viewModel;
@end

@implementation DYJXLoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};

//    self.userNameTF.text = @"13612846724";
//    self.passwordTF.text = @"111111";
//    self.userNameTF.text = @"13750820441";
//    self.passwordTF.text = @"654321";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClick:(UIButton *)sender {
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
