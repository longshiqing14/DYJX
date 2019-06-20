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
#import "DYJXFindGroup.h"
#import "DYJXNewGroupController.h"

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
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
}

- (IBAction)createGroup:(UIButton *)sender {
    //创建群
    DYJXNewGroupController *NewGroupVC = [[DYJXNewGroupController alloc]init];
    NewGroupVC.navigationItem.title = @"新增群";
    [self.navigationController pushViewController:NewGroupVC animated:YES];
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
            DYJXFindGroup *findGroup = [[DYJXFindGroup alloc]init];
            findGroup.Keyword = result.Id;
            [self.navigationController pushViewController:findGroup animated:YES];
        }
        
    };
    [self.navigationController pushViewController:qrcodeVC animated:YES];
    
}
- (IBAction)searchGroup:(UIButton *)sender {
    DYJXFindGroup *findGroup = [[DYJXFindGroup alloc]init];
    [self.navigationController pushViewController:findGroup animated:YES];
    
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
