//
//  NIMKitAudioCenter.h
//  NIMKit
//
//  Created by chris on 2017/1/13.
//  Copyright © 2017年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RCIMMessage;

@interface NIMKitAudioCenter : NSObject

@property (nonatomic,strong) RCIMMessage *currentPlayingMessage;

+ (instancetype)instance;

- (void)play:(RCIMMessage *)message;

@end
