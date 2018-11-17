//
//  RCMCChatListViewController.h
//
//  Created by Jue on 2018/6/5.
//  Copyright © 2018年 Jue. All rights reserved.
//

#import "RCMCConversationListViewController.h"

//跳转到消息中心的消息展示页面的代理
@protocol RCMCGotoMessageDisplayDelegate <NSObject>

/**
 跳转到消息中心的消息展示页面的代理方法

 @param targetId 会话Id
 @param title 会话标题
 */
- (void)gotoChatView:(NSString *)targetId title:(NSString *)title;

@end

@interface RCMCChatListViewController : RCMCConversationListViewController

@property (nonatomic, weak)id<RCMCGotoMessageDisplayDelegate> gotoMessageDisplayDelegate;

@end
