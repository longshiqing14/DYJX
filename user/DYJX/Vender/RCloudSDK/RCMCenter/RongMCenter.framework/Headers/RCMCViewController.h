//
//  RCMCViewController.h
//
//  Created by Jue on 2018/6/5.
//  Copyright © 2018年 Jue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCMCChatListViewController.h"

//点击Header中图标的通知
FOUNDATION_EXPORT NSString *const RCMCGotoMessageDisplayNotification;

@interface RCMCViewController : UIViewController

@property (nonatomic, strong)RCMCChatListViewController *chatListVC;

@end
