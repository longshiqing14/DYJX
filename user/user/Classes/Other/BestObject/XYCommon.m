//
//  XYCommon.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYCommon.h"

//#import "XYTabbarController.h"
#import "XYLoginVC.h"
#import "DYJXLoginPage.h"
@implementation XYCommon

/**  */
const CGFloat XY_Left_Margin = 10.0;
/**  */
const CGFloat XY_Right_Margin = -10.0;


//NSString * const BEST_URL = @"http://bisdevapi.xiaopenglife.com/api/rest";
//NSString * const BEST_H5_URL = @"http://bisdevh5.xiaopenglife.com/";

/** 生产 */
//NSString * const BEST_URL = @"https://bisapi.xiaopenglife.com/api/rest";
//NSString * const BEST_H5_URL = @"https://bish5.xiaopenglife.com/";



/** 2017-10-21 更新 UAT */
//NSString * const BEST_URL = @"http://bisuatapi.xiaopenglife.com/api/rest";
//NSString * const BEST_H5_URL = @"http://bisuath5.xiaopenglife.com/";



/** key */
NSString * const UMENG_KEY = @"59c485621c5dd071cd000019";
NSString * const JPUSH_KEY = @"d59bc96d3bf9348b2966d6b1";
NSString * const GAODE_KEY =@"5d8f6df00b841a0b02fa6ac3073dd0ad";// @"10a27069f4b488573d4b7e9d9dd5df0d";


/** 支付类型  */
//微信
NSString * const XY_PAY_TYPE_WEIXIN = @"payi_129";
//支付宝
NSString * const XY_PAY_TYPE_AIL = @"payi_132";



/** 字典 转换 json */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
 
    
}


/*
 * @brief 把格式化的JSON格式的字符串转换成字典或者数组
 * @param jsonString JSON格式的字符串
 * @return 返回 id类型数据
 */
+ (id)dataFromJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSString * onejson = [jsonString stringByReplacingOccurrencesOfString:@":null" withString:@":\"\""];
    NSString * twojson = [onejson stringByReplacingOccurrencesOfString:@":<null>" withString:@":\"\""];
    
    NSData *jsonData = [twojson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



/** 把字典中的 null 转换成 @"" */
+ (NSDictionary*)removeNull:(NSDictionary*)dict
{
     NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithDictionary:dict];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
               
                [dic setValue:@"" forKey:key];
            }
        }];
    }
    return dic;
}

/** 跳转到登录界面 */
+ (void)setPresentViewControllerWithLoginView
{
//    XYKeyWindow.rootViewController = [[XYTabbarController alloc]init];
//    XYKeyWindow.rootViewController = [[XYLoginVC alloc]init];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[XYCommon getCurrentVC] presentViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil] animated:YES completion:^{
            
        }];
    });
    
}


/** 获取 当前的vc */
+(UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}



+ (void)login
{
    
    
    
    
}

+ (void)getOut
{
    
}










@end
