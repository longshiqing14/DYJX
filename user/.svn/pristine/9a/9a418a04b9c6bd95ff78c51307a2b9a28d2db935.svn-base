//
//  JXSuccessAccountViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSuccessAccountViewController.h"
#import "UIView+Tool.h"

@interface JXSuccessAccountViewController ()

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@end

@implementation JXSuccessAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"信息提交";
    [self.homeButton reat:5];
    [self.homeButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_btn_goback"] style:(UIBarButtonItemStylePlain) target:self action:@selector(blackHomeClock:)];
    self.navigationItem.leftBarButtonItem=item;
    if ([self.isActivity isEqualToString:@"Y"]) {
        [_homeButton setTitle:@"返回首页" forState:(UIControlStateNormal)];
    }else{
        [_homeButton setTitle:@"宽带订单" forState:(UIControlStateNormal)];
    }
}


-(IBAction)blackHomeClock:(id)sender{
    if ([self.isActivity isEqualToString:@"Y"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES ];
    }else{
        [self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES ];
    }
//    self.tabBarController.selectedIndex=0;
    
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
