//
//  DYJXAddGroupMemberController.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddGroupMemberModel.h"

typedef void(^AddGroupCommitBlock)(NSMutableArray<DJJXMembers *> *memberModels,NSMutableArray<NSString *> *MemberIds);

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberController : UIViewController

@property (nonatomic, strong)NSMutableArray<NSString *> *MemberIds;

@property (nonatomic, assign) OperatorMember operatorType;
@property (nonatomic, copy) AddGroupCommitBlock block;
@end

NS_ASSUME_NONNULL_END
