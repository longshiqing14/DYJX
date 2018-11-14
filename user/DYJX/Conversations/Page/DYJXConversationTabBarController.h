//
//  DYJXConversationTabBarController.h
//  user
//
//  Created by 岩  熊 on 2018/11/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYJXConversationTabBarController : UITabBarController
- (instancetype)initWithIconUrl:(NSString*)iconUrl;
@property(nonatomic, copy)NSString *iconUrl;
@end
