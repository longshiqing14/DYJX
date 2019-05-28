//
//  DYJXConversationTabBarController.h
//  user
//
//  Created by 岩  熊 on 2018/11/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYJXConversationTabBarController : UITabBarController
-(instancetype)initWithIconUrl:(NSString*)iconUrl;
-(instancetype)initWithIconUrl:(NSString*)iconUrl personIdentification:(BOOL)isPersonIdentification;
@property(nonatomic, copy)NSString *iconUrl;
@property(nonatomic, assign) BOOL isPersonIdentification;
@end
