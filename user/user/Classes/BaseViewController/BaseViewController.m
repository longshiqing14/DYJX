//
//  BaseViewController.m
//  user
//
//  Created by 岩  熊 on 2018/10/25.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self baseUI];
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    
    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
//    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

-(void)black_controller{
    
    [self.navigationController popViewControllerAnimated:YES];
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
