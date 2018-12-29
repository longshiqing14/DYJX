//
//  DJContactsChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJContactsChatViewController.h"
#import "ContractHeadView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"

@interface DJContactsChatViewController ()

@property (nonatomic, strong)ContractHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation DJContactsChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"联系人";
    [self initNavigator];
    [self.view addSubview:self.headView];
}

- (void)initNavigator{
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 25;
    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}
#pragma mark - Action
-(void)searchClick {

}
-(void)buttonClick:(UIButton *)sender {
    [self.headView.goodContractButton setSelected:NO];
    [self.headView.nestContractButton setSelected:NO];
    [self.headView.generaContractButton setSelected:NO];
    [self.headView.hitContractButton setSelected:NO];
    [sender setSelected:YES];
    switch (sender.tag) {
        case 1:
            NSLog(@"好友联系人");
            break;
        case 2:
            NSLog(@"普通联系人");
            break;
        case 3:
            NSLog(@"新的联系人");
            break;
        case 4:
            NSLog(@"黑名单");
            break;
        case 5:
            NSLog(@"新增");
            break;
        default:
            break;
    }
}

#pragma mark - UI
-(ContractHeadView *)headView {
    if (!_headView) {
        _headView = [[ContractHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 110)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.goodContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.generaContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.nestContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.hitContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackPage)];
    }
    return _tapGestureRecognizer;
}

- (void)goBackPage{
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    XYKeyWindow.rootViewController = appDelegate.rootViewController;
//    [appDelegate.rootViewController.navigationController popViewControllerAnimated:YES];
    XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
    
}

@end
