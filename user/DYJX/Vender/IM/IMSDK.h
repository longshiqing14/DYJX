//
//  IMSDK.h
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatManager.h"
#import "ConversionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface IMSDK : NSObject

+ (IMSDK *)sharedManager;

@property (nonatomic, strong)ChatManager *chatManager;
@property (nonatomic, strong)ConversionManager *conversionManager;

@end

NS_ASSUME_NONNULL_END
