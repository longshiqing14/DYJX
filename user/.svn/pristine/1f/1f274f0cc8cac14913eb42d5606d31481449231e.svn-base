//
//  JXProcessingInformationViewController.m
//  user
//  提交宽带办理资料
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXProcessingInformationViewController.h"
#import "XYBoardBandEditDetailVC.h"
#import "JXRenewViewController.h"

@interface JXProcessingInformationViewController ()

@end

@implementation JXProcessingInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提交宽带办理资料";
}
- (IBAction)newUserClock:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (button.tag==1000) {
        XYBoardBandEditDetailVC * editDetailVC = [[XYBoardBandEditDetailVC alloc]init];
        editDetailVC.oders=self.oderID;
        [self.navigationController pushViewController:editDetailVC animated:YES];
    }else{
        [self performSegueWithIdentifier:@"JXRenew" sender:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"JXRenew"]) {
        JXRenewViewController *details=[segue destinationViewController];
        details.oderID=self.oderID;
        details.isActivity=self.isActivity;
        
    }
}


@end
