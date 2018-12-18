//
//  IMSDK.m
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "IMSDK.h"

@implementation IMSDK

+ (IMSDK *)sharedManager{
    static IMSDK *singler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (singler == NULL) {
            singler = [[IMSDK alloc] init];
        }
    });
    return singler;
}


-(ChatManager *)chatManager {
    if (!_chatManager) {
        _chatManager = [[ChatManager alloc] init];
    }
    return _chatManager;
}

-(ConversionManager *)conversionManager {
    if (!_conversionManager) {
        _conversionManager = [[ConversionManager alloc] init];
    }
    return _conversionManager;
}

@end
