//
//  DYJXContactDetailsController.h
//  user
//
//  Created by YP on 2019/5/12.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXContactDetailsController : BaseViewController

@property (nonatomic, copy)NSString *userIconImageURL;
@property (nonatomic, assign)BOOL isAdmin;
@property (nonatomic, copy) NSString *groupNumber;
@property (nonatomic, copy) NSString *targetId;

@end

NS_ASSUME_NONNULL_END
