//
//  XYBestWebVC.h
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYBestVC.h"
#import "XYWebViewJavaScript.h"

#import <WebKit/WebKit.h>

@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end



@protocol XYBestVCDelegate <NSObject>

@optional


/** 活动跳转到活动充值 */
- (void)webViewGoFormActivityVC;

/** 切换到商品详情页 */
- (void)webViewGoFormDetail;

/** 商品详情页 库存为空 */
- (void)webViewWithDetailInventoryNone;


/** 加载结束 */
- (void)webViewLoadingEnd;



@end


@interface XYBestWebVC : XYBestVC

@property (nonatomic, weak) id<XYBestVCDelegate> delegate;

/** webView */
@property (nonatomic, strong) WKWebView * myWebView;

/** 链接地址 必传 */
@property (nonatomic, copy) NSString * webURLstr;

/** 商品 id 仅商品 详情时使用 */
//@property (nonatomic, copy) NSString * productId;


/** 子类 启动调用 */
- (void)loadRequestUrl;

@property (nonatomic, copy) NSString *imageUrl;
@end
