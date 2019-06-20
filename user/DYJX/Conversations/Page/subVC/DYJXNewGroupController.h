//
//  DYJXNewGroupController.h
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXNewGroupController : BaseViewController
@property (nonatomic, assign) DYJXGroupType groupType;
@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, copy)NSString *userIconImageURL;
@end

NS_ASSUME_NONNULL_END
