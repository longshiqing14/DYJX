//
//  XYWebViewJavaScript.h
//  user
//
//  Created by xingyun on 2017/9/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WebKit/WebKit.h>

@interface XYWebViewJavaScript : NSObject

+(void)javaScriptUpdateGetOriginWithWebView:(WKWebView *)webView;

/**
 * 上传 sessionId 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateSessionIdWithWebView:(WKWebView *)webView;

/**
 * 上传 user info  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoWithWebView:(WKWebView *)webView;

/**
 * 上传 username  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserNameWithWebView:(WKWebView *)webView;

/**
 * 上传 merchantId  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateMerchantIdWithWebView:(WKWebView *)webView;

+(void)javaScriptUpdateCouponActivityWithWebView:(WKWebView *)webView;
/**
 * 上传 sessinid, left, top 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateClassifiCartLeftRightPositioinWithWebView:(WKWebView *)webView;
/**
 * 上传 sessinid, merchantId 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoMoreWithWebView:(WKWebView *)webView;


/**
 * 获取商品详情 图片 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptGetProductImgWithWebView:(WKWebView *)webView;
/**
 * 上传 sessionId  merchantId 通过 JavaScript
 * webView 网页
 测试
 */
+(void)javaScriptTestWithWebView:(WKWebView *)webView;

/**
 * 上传 sessionId  merchantId userName userID 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoSetInitDataWithWebView:(WKWebView *)webView;
@end
