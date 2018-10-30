//
//  XYFindVideoVC.m
//  user
//
//  Created by xingyun on 2017/10/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYFindVideoVC.h"

@interface XYFindVideoVC ()

@end

@implementation XYFindVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"视频";
    self.view.backgroundColor = XYGlobalBg;
    
    //    [self setRightTitleButtonWith:@"" selectedTitle:nil target:self action:@selector(rightClick)];
    
//    [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    //http://h5.xiaopengpeng.xingyun.net/butler/video/index.html
//    self.webURLstr = [NSString stringWithFormat:@"%@butler/auction/index.html",BEST_H5_URL];
    self.webURLstr = @"http://h5.xiaopengpeng.xingyun.net/butler/video/index.html";
    [self loadRequestUrl];
    
    
}


- (void)webViewLoadingEnd
{
    self.navigationItem.title = @"视频";
    
    [XYWebViewJavaScript javaScriptUpdateUserInfoWithWebView:self.myWebView];
    [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    if (self.myWebView.canGoBack) {
        [self setLeftImageButtonWith:@"nav_btn_goback" target:self action:@selector(rightClick)];
    }else{
        [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    }
    
    
}
#pragma mark - button Click

- (void)rightClick
{
    if (self.myWebView.canGoBack) {
        [self.myWebView goBack];
    }
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
