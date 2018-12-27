//
//  ConversionManager.m
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ConversionManager.h"

@implementation ConversionManager

-(instancetype)initWithIdentity:(DYJXIdentitySwitchingModel *)identity {
    if (self = [super init]) {
        _identity = identity;
        //设置接收消息代理
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveMessageNotification:)
                                                     name:RCKitDispatchMessageNotification
                                                   object:nil];
    }
    return self;
}

- (void)didReceiveMessageNotification:(NSNotification *)notification {
    __weak typeof(self) blockSelf_ = self;
    //处理好友请求
    RCMessage *message = notification.object;
    NSLog(@"%ld",message.conversationType);

}

@end
