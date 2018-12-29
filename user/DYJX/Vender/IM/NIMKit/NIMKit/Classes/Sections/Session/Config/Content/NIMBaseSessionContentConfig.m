//
//  NIMBaseSessionContentConfig.m
//  NIMKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import "NIMBaseSessionContentConfig.h"
#import "NIMTextContentConfig.h"
#import "NIMImageContentConfig.h"
#import "NIMAudioContentConfig.h"
#import "NIMVideoContentConfig.h"
#import "NIMFileContentConfig.h"
#import "NIMNotificationContentConfig.h"
#import "NIMLocationContentConfig.h"
#import "NIMUnsupportContentConfig.h"
#import "NIMTipContentConfig.h"
#import "NIMRobotContentConfig.h"

@interface NIMSessionContentConfigFactory ()
@property (nonatomic,strong)    NSDictionary                *dict;
@property (nonatomic,strong)    NIMUnsupportContentConfig   *unsupportConfig;
@end

@implementation NIMSessionContentConfigFactory

+ (instancetype)sharedFacotry
{
    static NIMSessionContentConfigFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NIMSessionContentConfigFactory alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _dict = @{@(NIMMessageTypeText)         :       [NIMTextContentConfig new],
                  @(NIMMessageTypeImage)        :       [NIMImageContentConfig new],
                  @(NIMMessageTypeAudio)        :       [NIMAudioContentConfig new],
                  @(NIMMessageTypeVideo)        :       [NIMVideoContentConfig new],
                  @(NIMMessageTypeFile)         :       [NIMFileContentConfig new],
                  @(NIMMessageTypeLocation)     :       [NIMLocationContentConfig new],
                  @(NIMMessageTypeNotification) :       [NIMNotificationContentConfig new],
                  @(NIMMessageTypeTip)          :       [NIMTipContentConfig new],
                  @(NIMMessageTypeRobot)        :       [NIMRobotContentConfig new]};
        _unsupportConfig = [[NIMUnsupportContentConfig alloc] init];
    }
    return self;
}

- (id<NIMSessionContentConfig>)configBy:(RCIMMessage *)message
{
    NSInteger type = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;
    NIMMessageType messageType = NIMMessageTypeText;
    switch (type) {
            case 0:
             messageType = NIMMessageTypeText;
            break;
            case 1:
            messageType = NIMMessageTypeImage;
            break;
            case 2:
            messageType = NIMMessageTypeVideo;
            break;
            case 3:
            messageType = NIMMessageTypeAudio;
            break;
            case 4:
            messageType = NIMMessageTypeLocation;
            break;
            case 5:
            messageType = NIMMessageTypeLocation;
            break;
            case 6:
            messageType = NIMMessageTypeTip;
            break;
        default:
            messageType = 102;
            break;
    }
    id<NIMSessionContentConfig>config = [_dict objectForKey:@(messageType)];
    if (config == nil)
    {
        config = _unsupportConfig;
    }
    return config;
}

@end