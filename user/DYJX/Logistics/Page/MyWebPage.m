//
//  MyWebPage.m
//  user
//
//  Created by longshiqing on 2019/1/29.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "MyWebPage.h"
#import <WebKit/WebKit.h>

@interface MyWebPage ()

@property (nonatomic, strong)WKWebView *webView;

@end

@implementation MyWebPage

- (void)viewDidLoad {
    [super viewDidLoad];

    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];

    [self.view addSubview:_webView];

    //1、生成请求体
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];

    //2、webView加载请求体
    [_webView loadRequest:request];
}

-(void)reloadData {


}


@end
