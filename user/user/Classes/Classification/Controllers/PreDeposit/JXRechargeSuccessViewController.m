//
//  JXRechargeSuccessViewController.m
//  user
//  充值成功
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXRechargeSuccessViewController.h"
#import "UIView+Tool.h"
#import "JXProcessingInformationViewController.h"
#import "XYPay.h"
#import "XYBaseModel.h"
#import "JXRechargeSuccessModel.h"
#import "NetWorkTool.h"

@interface JXRechargeSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rechargeButton;
//充值结果
@property (weak, nonatomic) IBOutlet UILabel *rechargeResults;
//充值标题
@property (weak, nonatomic) IBOutlet UILabel *rechargeTitle;
//充值副标题
@property (weak, nonatomic) IBOutlet UILabel *rechargeSubtitle;


@end

@implementation JXRechargeSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"预存款充值";
    [self.rechargeButton reat:5];
    [self.rechargeButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
    NSLog(@"%@",_oderID);
//    self.oderID=@"2017111516553320007";
//   [self.navigationController setNavigationBarHidden:YES animated:YES];
    if ([self.isActivity isEqualToString:@"Y"]) {
        [self.rechargeButton setTitle:@"提交宽带办理资料" forState:(UIControlStateNormal)];
    }else
        [self.rechargeButton setTitle:@"返回首页" forState:(UIControlStateNormal)];
    
    [self getPlayessage];
}
- (IBAction)rechargeClock:(id)sender {
    if ([self.isActivity isEqualToString:@"Y"]) {
        [self performSegueWithIdentifier:@"JXProcessingInformation" sender:nil];
    }else{
        self.tabBarController.selectedIndex=0;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
- (IBAction)blackHomeClock:(id)sender {
    if ([self.isActivity isEqualToString:@"Y"]) {
    }else{
        self.tabBarController.selectedIndex=0;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
}

-(void)getPlayessage{
    [NetWorkTool postRequest:@{@"orderId":self.oderID} relativePath:kJXAPI_user_orderRechargeDetail ShowAndDismiss:YES  success:^(id responseObject) {
        
            JXRechargeSuccessModel *model=[JXRechargeSuccessModel mj_objectWithKeyValues:responseObject];
            _rechargeResults.text=model.orderInfo.payResult;
            _rechargeTitle.text=model.orderInfo.rechargePriceTip;
            _rechargeSubtitle.text=model.orderInfo.rechargeGiveTimesTip;
    } failure:^() {
        NSLog(@"服务器异常");
    } UnusualFailure:^{
        NSLog(@"网络异常");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"JXProcessingInformation"]) {
        JXProcessingInformationViewController *details=[segue destinationViewController];
        details.oderID=self.oderID;
        details.oderID=self.oderID;
        
    }
}


@end
