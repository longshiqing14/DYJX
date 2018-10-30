//
//  JXActivityPage.m
//  user
//
//  Created by 岩  熊 on 2017/12/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXActivityPage.h"
#import "JXShareManager.h"
#import "XYUMSocialShareView.h"
@interface JXActivityPage ()

@end

@implementation JXActivityPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"活动";
    self.view.backgroundColor = XYGlobalBg;
//     [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    if ([self.webURLstr containsString:@"activity_template"]) {
     [self setRightImageButtonWith:@"nav_btn_share" target:self action:@selector(rightButtonClick:)];
    }

}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//
//    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
//    if (merchantId == nil) {
//        self.webURLstr = [NSString stringWithFormat:@"%@butler/activity/activity_page.html",BEST_H5_URL];
//    }else{
//        self.webURLstr = [NSString stringWithFormat:@"%@butler/activity/activity_page.html?merchantId=%@",BEST_H5_URL,merchantId];
//    }
//
//    [self loadRequestUrl];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)rightClick
//{
//    if (self.myWebView.canGoBack) {
//        [self.myWebView goBack];
//    }
//}


#pragma mark - button click

- (void)rightButtonClick:(UIButton*)sender
{
    /*请求参数  type : 0 首页 1 活动页 3 商品详情页
     type = 3 需要传productId*/
    
    //商品详情分享
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"1" forKey:@"type"];
//    [param setObject:self.productId forKey:@"productId"];
    [JXShareManager getShareInfoFromSeveiceParam:param Success:^(JXShareModel *model) {
        if (model.shares.count == 0) {
            return ;
        }
        XYUMSocialShareView * shareView = [[XYUMSocialShareView alloc] initWithTitle:nil cancelButtonTitle:nil shareContent:model.shares[0].content shareTitle:model.shares[0].title iconUrl:model.shares[0].iconUrl shareUrl:model.shares[0].shareUrl];
        [shareView show];
    } fail:^{
        
    }];
    
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
