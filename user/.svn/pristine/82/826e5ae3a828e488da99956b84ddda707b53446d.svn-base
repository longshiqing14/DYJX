//
//  ViewController.m
//  ARP
//
//  Created by liu_yakai on 2017/11/5.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UIViewController+Tool.h"
#import "NetWorkTool.h"
#import "NoNetworkView.h"


@implementation UIViewController (Tool)

//-(void)Prompt:(NSString *)prompt{
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
//        hud.label.text = prompt;
//        // Move to bottm center.
//        hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
//
//        [hud hideAnimated:YES afterDelay:3.f];
//}
//
//-(void)Loading:(NSString *)loading{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    // Set the label text.
//    hud.label.text = loading;
//
//}
//
//-(void)dismissLoading{
//
//    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
//}

-(void)network:(id )parse relativePath:(NSString *)url ShowAndDismiss:(BOOL)showAndDismiss   success:(void (^)(id responseObject))success failure:(void (^)())failure UnusualFailure:(void (^)())unusualFailure{
    __weak typeof(self)SelfWeek=self;
//    [self Loading:@"获取中..."];
    [NetWorkTool postRequest:parse relativePath:url ShowAndDismiss:showAndDismiss success:^(id responseObject) {
//        [SelfWeek dismissLoading];
        success(responseObject);
        
    } failure:^{
        failure();
    } UnusualFailure:^{
        unusualFailure();
        
        
//        [SelfWeek noNetWorkUI];
    }];
}

-(void)noNetWorkUI{
    NoNetworkView *noNetworkView=[self.view viewWithTag:1000000];
    noNetworkView=nil;
    [noNetworkView removeFromSuperview];
    noNetworkView=[[[NSBundle mainBundle]loadNibNamed:@"NoNetworkView" owner:self options:nil]lastObject];
    noNetworkView.frame=self.view.frame;
    noNetworkView.tag=1000000;
    [self.view addSubview:noNetworkView];
}

//
//-(void)getnetwork:(id )parse relativePath:(NSString *)url  success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
//    __weak typeof(self)SelfWeek=self;
//    [self Loading:@"获取中..."];
//    [NetWorkTool getParameter:parse relativePath:url success:^(id responseObject) {
//        [SelfWeek dismissLoading];
//        BaseModel *baseModel=[[BaseModel alloc]initWithDictionary:responseObject error:nil];
//        if ([baseModel.resultCode isEqualToString:@"200"]) {
//            success(responseObject);
//        }else{
//            [SelfWeek Prompt:baseModel.errorMessage];
//        }
//        
//    } failure:^(NSError *error) {
//        [SelfWeek dismissLoading];
//        [SelfWeek Prompt:@"请检查网络"];
//        failure(error);
//    }];
//}
@end
