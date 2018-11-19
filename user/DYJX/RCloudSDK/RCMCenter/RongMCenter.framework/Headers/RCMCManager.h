//
//  RCMCManager.h
//
//  Created by Jue on 2018/4/25.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>

@interface RCMCManager : NSObject

+ (instancetype)sharedManager;

/**
 判断是否是消息中心的会话

 @param conversationModel 会话Model
 @return 如果返回值是YES，就是消息中心的会话，反之则不是。
 */
- (BOOL)isMCenterConversation:(RCConversationModel *)conversationModel;

/**
 获取消息中心所有会话的未读数

 @return 未读数消息数
 */
- (int)getUnreadNewsMessageCount;

/**
 用户配置文件
 */
@property (nonatomic, strong) NSDictionary *userConfigDic;

/**
 在消息页面，需要置顶横向展示的用户
 */
@property (nonatomic, strong) NSArray *HUsers;

/**
 在消息页面，需要纵向展示在会话列表中的用户
 */
@property (nonatomic, strong) NSArray *VUsers;

/**
 是否需要显示“我的好友”
 */
@property (nonatomic, assign) BOOL isDisplayMyFriends;


/**
 运营账号列表
 */
@property(nonatomic, strong) NSArray *senderUserIdList;

@end
