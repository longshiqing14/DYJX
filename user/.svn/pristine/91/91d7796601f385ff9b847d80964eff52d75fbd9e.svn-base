//
//  XYGoodsDetailWebVC.m
//  user
//
//  Created by xingyun on 2017/9/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsDetailWebVC.h"
#import <JavaScriptCore/JavaScriptCore.h>




@interface XYGoodsDetailWebVC ()<WKNavigationDelegate>
@property (nonatomic, assign) NSInteger lastcontentOffset;


@end

@implementation XYGoodsDetailWebVC

//NSString * const goods_detail_url = @"/product_detail/#/?";
NSString * const goods_detail_url = @"choice/product_detail.html?product_id=%@&merchantId=%@";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  商品
    self.view.backgroundColor = XYGlobalBg;
//    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
//    self.webURLstr = [NSString stringWithFormat:@"%@%@product_id=%@&sessionId=%@",BEST_H5_URL,goods_detail_url,self.productId,sessionId];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
      self.webURLstr = [NSString stringWithFormat:@"%@choice/product_detail.html?product_id=%@&merchantId=%@",BEST_H5_URL,self.productId,merchantId];
//    self.myWebView.scrollView.bounces=NO;
    [self loadRequestUrl];
    
    

}
- (void)viewWillAppear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
- (void)viewDidDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

//#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
    [webView evaluateJavaScript:@"turnCB()" completionHandler:^(id _Nullable item, NSError * _Nullable error) {
        if (error == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        
    }];
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat hight = scrollView.frame.size.height;
//    CGFloat contentOffset = scrollView.contentOffset.y;
//    CGFloat distanceFromBottom = scrollView.contentSize.height - contentOffset;
//    CGFloat offset = contentOffset - self.lastcontentOffset;
//    self.lastcontentOffset = contentOffset;
//
//    if (offset > 0 && contentOffset > 0) {
//        NSLog(@"上拉行为");
//    }
//    if (offset < 0 && distanceFromBottom > hight) {
//        NSLog(@"下拉行为");
//    }
//    if (contentOffset == 0) {
//        NSLog(@"滑动到顶部");
//    }
//    if (distanceFromBottom < hight) {
//        NSLog(@"滑动到底部");
//        if (self.RollDown) {
//            self.RollDown();
//        }
//    }
//
//}



#pragma mark - 继承 父类

- (void)webViewLoadingEnd
{
    if (self.productId != nil) {
        
        [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];

    }
     [XYWebViewJavaScript javaScriptGetProductImgWithWebView:self.myWebView];
}

- (void)webViewGoFormDetail
{
    if (self.goodsDetailDelegate != nil && [self.goodsDetailDelegate respondsToSelector:@selector(goodsDetailPushGoodsDetailParameterWeb)]) {
        [self.goodsDetailDelegate goodsDetailPushGoodsDetailParameterWeb];
    }
}

- (void)webViewWithDetailInventoryNone
{
    if (self.goodsDetailDelegate != nil && [self.goodsDetailDelegate respondsToSelector:@selector(goodsDetailBottomButton)]) {
        [self.goodsDetailDelegate goodsDetailBottomButton];
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
