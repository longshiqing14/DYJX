//
//  AppDelegate.h
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIViewController *rootViewController;

@property (strong, nonatomic) UIWindow *window;

/** cart count */
@property (nonatomic, strong) NSString * cartCountStr;
/** order count */
@property (nonatomic, strong) NSDictionary * orderCountDict;

/** 选择的 城市 商户 id */
@property (nonatomic, strong) NSDictionary * user_city;

//唤醒app跳转到对应的活动，商详页面
@property (nonatomic, strong) NSDictionary * pushJumpDic;
@property (nonatomic, strong) NSString * pushJumpStr;
@end

