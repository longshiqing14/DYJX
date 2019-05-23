//
//  DYJXAddGroupMemberPageController.h
//  user
//
//  Created by YP on 2019/5/21.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DYJXSelectMemberPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberPageController : BaseViewController
@property (nonatomic, strong) NSMutableArray<DJJXMembers*> *membersArray;
@property (nonatomic, strong) NSMutableArray<DJJXMembers*> *adminArray;
@property (nonatomic, strong)NSMutableArray<NSString *> *MemberIds;
@property (nonatomic, copy) SelectGroupCommitBlock block;
@end

NS_ASSUME_NONNULL_END
