//
//  ChatManager.m
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ChatManager.h"

@interface ChatManager()


@end

@implementation ChatManager

-(instancetype)initWithSession:(NIMSession *)session {
    if (self = [super init]) {
        _session = session;
        //设置接收消息代理
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveMessageNotification:)
                                                     name:RCKitDispatchMessageNotification
                                                   object:nil];
    }
    return self;
}

@end
