//
//  XYBestWebVC.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestWebVC.h"
//#import "JXCouponActivityWebPage.h"
//#import "JXCouponDetailModel.h"
//#import "XYOrderAllNet.h"
//#import "XYOrderConfirmOrderVC.h"
//#import "XYOrderConfirmOrderVC.h" // 确认订单
//#import "JXOrderSettlementViewController.h"

#import "XLPhotoBrowser.h" //图片浏览

//#import "XYOrderDetailSubClassOrderDetailVC.h" // 订单详情
//#import "JXMyOrderDetailsViewController.h"
//#import "XYMineOrderListVCViewController.h" // 订单列表

//#import "XYPreDepositVC.h" // 活动页面
//#import "JXFullReduceGoodsPage.h"
//#import "JXGoodsDetailCouponViewController.h"
//#import "XYGoodsDetailVC.h"
//#import "JXAddCartAnimationModel.h"
//#import "XYOrderAddCommentVC.h"
//#import "XYOrderCommentDetailWebVC.h"

@interface XYBestWebVC () <WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler>

/** webView 进度条 */
@property (strong, nonatomic) UIProgressView *progressView;

@end

@implementation WeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end


@implementation XYBestWebVC




- (void)viewDidLoad {
    [super viewDidLoad];
    XYLog(@"%@",self.webURLstr);

    [self loadRequestUrl];
    
    [self setLeftImageButtonWith:@"nav_btn_goback" target:self action:@selector(navLeftButtonClick:)];

}

- (void)dealloc {
    
    if ([self isViewLoaded]) {
        [self.myWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
        [self.myWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(title))];

    }
    
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"notLanded"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"noLanded"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"toPage"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"inventoryNone"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"goPage"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"GetCouponActivityGoodsList"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"getUserInfoCoupon"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"toCart"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"openCoupon"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"postMessageForId"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"jumpToGoodsDetail"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"xpPostMethods"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"turnToCommentList"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"postTitleToHelpCenter"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"getInitData"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"sweepCodeOrder"];
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"getPageFrom"];
    [self.myWebView setNavigationDelegate:nil];
    [self.myWebView setUIDelegate:nil];
    
    [self webviewClearCache];
}


#pragma mark - add view
- (WKWebView *)myWebView
{
    if (_myWebView == nil) {
        
        WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = [[WKUserContentController alloc]init];
        //支持视频播放
        configuration.allowsInlineMediaPlayback = YES;
        
        
        // js  call  oc
        WKUserContentController *userContentController = [[WKUserContentController alloc]init];
        
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"notLanded"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"noLanded"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"toPage"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"inventoryNone"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"goPage"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"GetCouponActivityGoodsList"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"getUserInfoCoupon"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"toCart"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"openCoupon"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"postMessageForId"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"jumpToGoodsDetail"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"getUserInfoMore"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"postMessageForUpdate"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"postProductImg"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"reloadPage"];
         [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"xpPostMethods"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"turnToCommentList"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"postTitleToHelpCenter"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"getInitData"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"goOrderDetails"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"Coupon"];
        [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"goEvaluateDetial"];

        [userContentController addScriptMessageHandler:self name:@"getUserInfo"];
        [userContentController addScriptMessageHandler:self name:@"goEvaluate"];
        [userContentController addScriptMessageHandler:self name:@"sweepCodeOrder"];
        [userContentController addScriptMessageHandler:self name:@"getPageFrom"];
        //        [userContentController addScriptMessageHandler:self name:@"notLanded"];
        //        [userContentController addScriptMessageHandler:self name:@"noLanded"];
//        [userContentController addScriptMessageHandler:self name:@"toPage"];
//        [userContentController addScriptMessageHandler:self name:@"inventoryNone"];
//        [userContentController addScriptMessageHandler:self name:@"goPage"];


        configuration.userContentController = userContentController;
        
        
        WKPreferences *preferences = [[WKPreferences alloc] init];
        preferences.javaScriptEnabled = YES;
        configuration.preferences = preferences;

        
        
        _myWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, XYScreenH - 64) configuration:configuration];
        _myWebView.backgroundColor = XYGlobalBg;
        _myWebView.navigationDelegate = self;
        _myWebView.UIDelegate = self;
        
        [_myWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:NSKeyValueObservingOptionNew context:NULL];
        [_myWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(title)) options:NSKeyValueObservingOptionNew context:NULL];
        
        [self.view insertSubview:_myWebView belowSubview:self.progressView];
        [_myWebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
//            make.height.mas_equalTo(45);
            if (@available(iOS 11.0, *)) {
                make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.mas_equalTo(self.view);
            }
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
    }
    return _myWebView;
}



- (UIProgressView *)progressView
{
    if(_progressView == nil){
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, 0)];
        _progressView.tintColor = XYMainColor;
        _progressView.trackTintColor = [UIColor whiteColor];
        [self.view addSubview:_progressView];
    }
    return _progressView;
}

#pragma mark - 懒加载


#pragma mark - 启动

- (void)loadRequestUrl
{
    if (self.webURLstr == nil) {
        return;
    }
    
    NSString * strUrl = [self.webURLstr stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSMutableURLRequest * mutableRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:strUrl]];
    
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (sessionId != nil) {
        [mutableRequest setValue:sessionId forHTTPHeaderField:@"sessionId"];
    }
    
//    NSURLRequest *reuqest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:strUrl]];
    [self.myWebView loadRequest:mutableRequest];
    
}



#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *URL = navigationAction.request.URL;
    
    NSString *scheme = [URL scheme];
    NSLog(@"%@",scheme);
    if ([scheme isEqualToString:@"xycallback"]) {
        
        NSString * resourceSpecifier = [URL resourceSpecifier];
        
        XYLog(@" resourceSpecifier  %@",resourceSpecifier);
        
        if ([resourceSpecifier hasPrefix:@"//success"]){ // 提交 创建成功 返回原生页面
            [self.navigationController popViewControllerAnimated:YES];
        }else if ([resourceSpecifier hasPrefix:@"//goback"]){ // 返回 上一页
            
            if (self.myWebView.canGoBack) {
                [self.myWebView goBack];
//                [self.myWebView reload];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
       
        }else if ([resourceSpecifier hasPrefix:@"//getSessionId"]){ //  js  上传

            [XYWebViewJavaScript javaScriptUpdateSessionIdWithWebView:self.myWebView];
            
        }else if ([resourceSpecifier hasPrefix:@"//getUserInfo"]){ // js 上传 userid name
            
            [XYWebViewJavaScript javaScriptUpdateUserInfoWithWebView:self.myWebView];
        }else if ([resourceSpecifier hasPrefix:@"//goFormDetail"]){ // 切换到商品详情页

            [self webViewGoFormDetail];
            
        }else if ([resourceSpecifier hasPrefix:@"//checkout"]){ // 结算

            
        }else if ([resourceSpecifier hasPrefix:@"//showImage"]){ // 图片浏览

             resourceSpecifier = [resourceSpecifier stringByRemovingPercentEncoding];
            
            NSArray * array = [resourceSpecifier componentsSeparatedByString:@"?"];
            if (array.count > 1) {
//                NSArray * typeArray = [array[1] componentsSeparatedByString:@"&"];
//                NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//                dict = [self arrayToDictionaryWithArray:array[1]];
                
                NSDictionary * dict = [XYCommon dataFromJsonString:array[1]];
                
                if (dict[@"path"] != nil && dict[@"index"] != nil && [dict[@"path"] isKindOfClass:[NSArray class]]) {
                    
                    NSArray * imageArray = dict[@"path"];
                    NSMutableArray * imageUrlArray = [NSMutableArray array];
                    for (id imagUrlStr in imageArray) {
                        if ([imagUrlStr isKindOfClass:[NSString class]]) {
                            NSString *strUrl = [imagUrlStr stringByReplacingOccurrencesOfString:@" " withString:@""];
                            [imageUrlArray addObject:strUrl];
                        }
                    }

                    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithImages:[imageUrlArray copy] currentImageIndex:[dict[@"index"] integerValue]];
                    browser.browserStyle = XLPhotoBrowserStyleIndexLabel;
                    
                }
            }
            
        }else if ([resourceSpecifier hasPrefix:@"//msg"]){ //  信息 点击

            resourceSpecifier = [resourceSpecifier stringByRemovingPercentEncoding];
            
            NSArray * array = [resourceSpecifier componentsSeparatedByString:@"?"];
            
            if (array.count > 1) {
                NSArray * typeArray = [array[1] componentsSeparatedByString:@"&"];
                NSMutableDictionary * dict = [NSMutableDictionary dictionary];
                dict = [self arrayToDictionaryWithString:typeArray[0]];
                
                if ([dict[@"type"] isEqualToString:@"details"]) { // 订单详情
                    

                    
                }else if([dict[@"type"] isEqualToString:@"comment"]){ //  评论列表
                    
            
                    
                }
                
                
                XYLog(@" typeArray %@ ",typeArray);
                
            }
        }
        
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }else if([scheme isEqualToString:@"tel"]){
//        点击网页电话唤起电话
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:navigationAction.request.URL.absoluteString]];
            //                decisionHandler(WKNavigationActionPolicyCancel);
            //
//            [[UIApplication sharedApplication].keyWindow addSubview:webView];
    }else{
        
//        NSMutableURLRequest *mutableRequest = [navigationAction.request mutableCopy];
//        NSDictionary *requestHeaders = navigationAction.request.allHTTPHeaderFields;
//        if (requestHeaders[@"sessionId"]) {
//            decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
//        }else{
//            //这里添加请求头，把需要的都添加进来
//            NSString * sessionId = [XYUserDefaults readUserDefaultsRegisteredOfSessionId];
//            if (sessionId != nil) {
//                [mutableRequest setValue:sessionId forHTTPHeaderField:@"sessionId"];
//            }
//            [webView loadRequest:mutableRequest];
//            decisionHandler(WKNavigationActionPolicyCancel);//不允许跳转
//        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
 
}
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    
}

-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    WKFrameInfo * frameInfo = navigationAction.targetFrame;
    if (![frameInfo isMainFrame]) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"title"])
    {
        if (object == self.myWebView) {
            self.navigationItem.title = self.myWebView.title;
        }
    }
    
    if (object == self.myWebView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
            
            [self webViewLoadingEnd];
            
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}


#pragma mark - WKScriptMessageHandler

/*
 1、js调用原生的方法就会走这个方法
 2、message参数里面有2个参数我们比较有用，name和body，
 2.1 :其中name就是之前已经通过addScriptMessageHandler:name:方法注入的js名称
 2.2 :其中body就是我们传递的参数了
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    XYLog(@"%@,%@",message.name,message.body);
    
    if ([message.name isEqualToString:@"toPage"]) {
        
        if ([message.body isKindOfClass:[NSString class]]) {

        }
        
    }
    

    
}

/** 立即购买 */
- (void)buyNowButtonClick:(NSString *)productId PartnerId:(NSString *)partnerId
{
    if (productId == nil) {
        return;
    }
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    WeakSelf;
    
}

#pragma mark - WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [[XYCommon getCurrentVC] presentViewController:alert animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(nonnull NSString *)message initiatedByFrame:(nonnull WKFrameInfo *)frame completionHandler:(nonnull void (^)(BOOL))completionHandler {
    
    // alert弹出框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    // 按钮
    UIAlertAction *alertActionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 返回用户选择的信息
        completionHandler(NO);
    }];
    UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }];
    
    [alertController addAction:alertActionCancel];
    [alertController addAction:alertActionOK];
    [[XYCommon getCurrentVC] presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - button click
- (void)navLeftButtonClick:(UIButton*)sender
{
    if (self.myWebView.canGoBack) {
        [self.myWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma  mark - delegate



- (void)webViewLoadingEnd
{
    if (_delegate) {
        [_delegate webViewLoadingEnd];
    }
    
    if ([self.webURLstr rangeOfString:@"butler/activity/activity_page"].location != NSNotFound) {
        
        [XYWebViewJavaScript javaScriptUpdateUserNameWithWebView:self.myWebView];
        
    }
    
   
//    else if ([self.webURLstr rangeOfString:@"butler/coupon/full_cut"].location != NSNotFound){
//        NSString *sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
//        NSString *merchantId = [XYUserDefaults readUserDefaultsOfSessionId];
//        NSString *actionUserNames = [[XYUserDefaults readUserDefaultsInfo] valueForKey:@"nickName"];
//        NSString *jsStr = [NSString stringWithFormat:@"getUserInfo('%@','%@','%@')",sessionId,merchantId,actionUserNames];
//        [self.myWebView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//            XYLog(@"%@----%@",result, error);
//        }];
//    }
    
}

- (void)webViewGoFormActivityVC
{
    if (_delegate ) {
        [_delegate webViewGoFormActivityVC];
    }
}

- (void)webViewGoFormDetail
{
    if (_delegate ) {
        [_delegate webViewGoFormDetail];
    }
}

- (void)webViewWithDetailInventoryNone
{
    if (_delegate) {
        [_delegate webViewWithDetailInventoryNone];
    }
}

#pragma mark - 缓存
/** 清除缓存 */
- (void)webviewClearCache
{
//    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
//    //// Date from
//
//    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
//    //// Execute
//
//    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
//
//        // Done
//
//    }];
}




//返回 数据处理 json 转 数组 转 字典

- (NSMutableDictionary*)arrayToDictionaryWithArray:(NSArray*)arrray
{
    NSMutableDictionary * selectDict = [NSMutableDictionary dictionary];
    
    for (NSString * dictString in arrray) {
        NSArray * typeArray = [dictString componentsSeparatedByString:@"="];
        if (typeArray.count == 2) {
            [selectDict setValue:typeArray[1] forKey:typeArray[0]];
        }
    }
    
    return selectDict;
}

//返回 数据处理 json 转 字符串 转 字典
- (NSMutableDictionary*)arrayToDictionaryWithString:(NSString*)string
{
    NSMutableDictionary * selectDict = [NSMutableDictionary dictionary];
    NSArray * typeArray = [string componentsSeparatedByString:@":"];
    [selectDict setValue:typeArray[1] forKey:typeArray[0]];
    
    return selectDict;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushController:(UIViewController *)controller{
    
    [controller setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
