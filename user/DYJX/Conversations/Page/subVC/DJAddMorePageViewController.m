//
//  DJAddMorePageViewController.m
//  user
//
//  Created by 岩  熊 on 2019/4/30.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DJAddMorePageViewController.h"
#import "SWQRCodeViewController.h"
#import "DYXJResult.h"

@interface DJAddMorePageViewController ()

@end

@implementation DJAddMorePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    [self initNavigation];
}

- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
}
- (IBAction)createGroup:(UIButton *)sender {
    //创建群
}

- (IBAction)scanJoinFroup:(UIButton *)sender {
    //扫一扫
    SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
    config.scannerType = SWScannerTypeBoth;
    
    SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
    qrcodeVC.codeConfig = config;
    qrcodeVC.callBack = ^(id anyobject){
        if (anyobject) {
            DYXJResult *result = (DYXJResult *)anyobject;
//            [self.userLists removeAllObjects];
//            [self.userLists addObject:result];
//            [self.tableView reloadData];
        }
        
    };
    [self.navigationController pushViewController:qrcodeVC animated:YES];
    
}
- (IBAction)searchGroup:(UIButton *)sender {
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
