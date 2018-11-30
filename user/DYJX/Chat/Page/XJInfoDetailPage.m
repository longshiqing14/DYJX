//
//  XJInfoDetailPage.m
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "XJInfoDetailPage.h"

@interface XJInfoDetailPage ()

@property (nonatomic, strong)GropuDetailViewModel *viewModel;

@end

@implementation XJInfoDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
           make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
           make.bottom.mas_equalTo(self.view);
        }
    }];
    [self.viewModel attachPage:self];
}

-(void)setType:(XJGroupType)type {
//    if (_type != type) {
        _type = type;
        self.viewModel.type = type;
    NSArray *titles = @[@"本人账户管理",@"公司账户管理",@"信息查看"];
    self.navigationItem.title = titles[(int)type];
//    }
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
-(GropuDetailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[GropuDetailViewModel alloc] init];
    }
    return _viewModel;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delaysContentTouches = NO;
    }
    return _tableView;
}
@end

