//
//  DYJXGroupPage.m
//  user
//
//  Created by 岩  熊 on 2018/11/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXGroupPage.h"

@interface DYJXGroupPage ()

@end

@implementation DYJXGroupPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"群组";
    [self initNavigation];
}

- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    UIImage *image = [UIImage imageNamed:@"btn_home"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    
    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
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
