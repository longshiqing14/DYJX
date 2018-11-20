//
//  BaseListViewController.h
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import "HeadSearchView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseListViewController : RCConversationListViewController

@property (nonatomic, strong)HeadSearchView *headView;

@end

NS_ASSUME_NONNULL_END
