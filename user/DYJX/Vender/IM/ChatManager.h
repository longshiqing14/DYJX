//
//  ChatManager.h
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMMessage.h"

@protocol IMChatDelegate <NSObject>

- (void)onRecvMessages:(RCIMMessage *)message;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ChatManager : NSObject

-(instancetype)initWithSession:(NIMSession *)session;

@property(nonatomic, strong)NIMSession *session;

@property(nonatomic,weak) id<IMChatDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
