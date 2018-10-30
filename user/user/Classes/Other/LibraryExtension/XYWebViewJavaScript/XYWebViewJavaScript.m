//
//  XYWebViewJavaScript.m
//  user
//
//  Created by xingyun on 2017/9/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYWebViewJavaScript.h"

#import "XYUserInfoModel.h"

@implementation XYWebViewJavaScript

/**
 * 上传 是否浏览扫码情况  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateGetOriginWithWebView:(WKWebView *)webView
{
    NSString *jsStr = @"getOrigin('1')";
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
    
}


/**
 * 上传 sessionId  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateSessionIdWithWebView:(WKWebView *)webView
{
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (sessionId == nil) {
        return;
    }
    
    NSString *jsStr = [NSString stringWithFormat:@"setSessionId('%@')",sessionId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
    
}

/**
 * 上传 user info  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoWithWebView:(WKWebView *)webView
{
    NSDictionary * infoDict = [XYUserDefaults readUserDefaultsRegistered];
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (infoDict.count == 0) {
        return;
    }
    
    XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:infoDict];
    
    NSString *jsStr = [NSString stringWithFormat:@"setUserInfo('%@','%@','%@')",infoModel.userId,infoModel.mobile,sessionId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
    
}

/**
 * 上传 username  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserNameWithWebView:(WKWebView *)webView
{
    NSDictionary * infoDict = [XYUserDefaults readUserDefaultsRegistered];
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (infoDict.count == 0) {
        return;
    }
    XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:infoDict];
    
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    
    NSString *jsStr = [NSString stringWithFormat:@"setUserInfo('%@','%@','%@')",infoModel.userId,sessionId,merchantId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 上传 merchantId  通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateMerchantIdWithWebView:(WKWebView *)webView
{
    NSDictionary * infoDict = [XYUserDefaults readUserDefaultsRegistered];
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (infoDict.count == 0) {
        return;
    }
    XYUserInfoModel * infoModel = [XYUserInfoModel mj_objectWithKeyValues:infoDict];
    
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    
    if (merchantId == nil) {
        return;
    }
    
    NSString *jsStr = [NSString stringWithFormat:@"setUserInfo('%@','%@',@'%@')",infoModel.realName,sessionId,merchantId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}


/**
 * 上传 username  merchantId 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateCouponActivityWithWebView:(WKWebView *)webView
{
    NSDictionary * infoDict = [XYUserDefaults readUserDefaultsInfo];
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    NSString * nickName = [infoDict valueForKey:@"nickName"];

    
    NSString *jsStr = [NSString stringWithFormat:@"setUserInfoCoupon('%@','%@','%@')",nickName,sessionId,merchantId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 上传 sessinid, left, top 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateClassifiCartLeftRightPositioinWithWebView:(WKWebView *)webView
{
    CGPoint endPoint = CGPointMake(XYScreenW/10*7, XYScreenH-30);
    
    if (XYScreenH == 812) {
        endPoint = CGPointMake(XYScreenW/10*7, XYScreenH-34-30);
    }
    
    NSString * sessionid = [XYUserDefaults readUserDefaultsOfSessionId];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    NSString *version = [UIDevice currentDevice].systemVersion;
    
    if([version rangeOfString:@"10"].location !=NSNotFound)//_roaldSearchText
    {
        version=@"10";
    }
    else
    {
        version=@"11";
    }
    NSString *jsStr = [NSString stringWithFormat:@"setOverPram('%@','%@','%@')",sessionid,merchantId,version];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 上传 sessionId  merchantId 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoMoreWithWebView:(WKWebView *)webView
{
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    
    
    NSString *jsStr = [NSString stringWithFormat:@"setUserInfoMore('%@','%@')",sessionId,merchantId];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 获取商品详情 图片 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptGetProductImgWithWebView:(WKWebView *)webView
{
    NSString *jsStr = [NSString stringWithFormat:@"getProductImg()"];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 上传 sessionId  merchantId 通过 JavaScript
 * webView 网页
 测试
 */
+(void)javaScriptTestWithWebView:(WKWebView *)webView
{
    NSString * key = @"1";
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"hzifjakljf" forKey:key];
    NSString *jsString = [dic mj_JSONString];
    
    NSString *jsStr = [NSString stringWithFormat:@"xpAcceptMethods ('%@', '%@')",key,jsString];
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
    }];
}

/**
 * 上传 sessionId  merchantId userName userID 通过 JavaScript
 * webView 网页
 */
+(void)javaScriptUpdateUserInfoSetInitDataWithWebView:(WKWebView *)webView
{
    __weak typeof(WKWebView) *weekWebView = webView;
    
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    NSDictionary * infoDict = [XYUserDefaults readUserDefaultsInfo];
    NSString * nickName = [infoDict valueForKey:@"nickName"];
    NSString * userID = [infoDict valueForKey:@"userId"];
    
    NSString *jsStr = [NSString stringWithFormat:@"setInitData('%@','%@','%@','%@')",sessionId,merchantId,nickName,userID];
    
    NSString *jsString = [NSString stringWithFormat:@"setdatamessage('%@','%@','%@','%@')",sessionId,merchantId,nickName,userID];
    
    [webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XYLog(@"%@----%@",result, error);
        
        if (error) {
            [weekWebView evaluateJavaScript:jsString completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                
            }];
        }
        
    }];
}
@end
