//
//  ConversionManager.h
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXIdentitySwitchingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConversionManager : NSObject

-(instancetype)initWithIdentity:(DYJXIdentitySwitchingModel *)identity;

@property(nonatomic, strong)DYJXIdentitySwitchingModel *identity;
@property(nonatomic,weak) id<NIMConversationManagerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
