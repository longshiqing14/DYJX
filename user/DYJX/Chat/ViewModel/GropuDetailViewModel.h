//
//  GropuDetailViewModel.h
//  user
//
//  Created by longshiqing on 2018/11/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJInfoDetailPage.h"

NS_ASSUME_NONNULL_BEGIN

@interface GropuDetailViewModel : NSObject

-(void)attachPage:(id)page;

@property (nonatomic, assign)XJGroupType type;

@end

NS_ASSUME_NONNULL_END
