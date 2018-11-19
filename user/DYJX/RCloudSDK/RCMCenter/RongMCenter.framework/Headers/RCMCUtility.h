//
//  RCMCUtility.h
//
//  Created by Jue on 2018/7/13.
//  Copyright © 2018年 Jue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define ImageFor(fileName) [[RCMCUtility sharedManager] imageFor:fileName]

@interface RCMCUtility : NSObject

+ (instancetype)sharedManager;

- (UIImage *)imageFor:(NSString *)fileName;

- (void)addUnreadCount:(UIView *)view viewWidth:(CGFloat)viewWidth unreadCountWidth:(CGFloat) unreadCountWidth count:(int)count;

- (NSString *)coverChatTime:(long long)sendTime;

@end
