//
//  XYFindVC.m
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYFindVC.h"

@interface XYFindVC ()

@end

@implementation XYFindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    self.view.backgroundColor = XYGlobalBg;
    
//    [self setRightTitleButtonWith:@"" selectedTitle:nil target:self action:@selector(rightClick)];
    
    [self setLeftTitleButtonWith:@"" target:self action:@selector(rightClick)];
    
    self.webURLstr = [NSString stringWithFormat:@"%@butler/auction/index.html",BEST_H5_URL];
    
    [self loadRequestUrl];
    
    
}


- (void)webViewLoadingEnd
{
    self.navigationItem.title = @"发现";
    
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
