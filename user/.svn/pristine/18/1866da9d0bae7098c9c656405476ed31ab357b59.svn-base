//
//  XYNotificationCenterWebVC.m
//  user
//
//  Created by xingyun on 2017/10/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYNotificationCenterWebVC.h"

@interface XYNotificationCenterWebVC ()

@end

@implementation XYNotificationCenterWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = XYGlobalBg;
    self.webURLstr = [NSString stringWithFormat:@"%@message/#/message_center",BEST_H5_URL];
    
    [self loadRequestUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewLoadingEnd
{
    
    
        [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
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
