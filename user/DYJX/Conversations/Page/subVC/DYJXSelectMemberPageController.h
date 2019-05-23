//
//  DYJXSelectMemberPageController.h
//  user
//
//  Created by YP on 2019/5/21.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddGroupMemberController.h"

typedef void(^SelectGroupCommitBlock)(NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels,NSMutableArray<DJJXMembers *> *membersArray,NSMutableArray<NSString *> *MemberIds);
NS_ASSUME_NONNULL_BEGIN

@interface DYJXSelectMemberPageController : UIViewController
@property (nonatomic, assign) OperatorMember operatorType;
@property (nonatomic, copy) SelectGroupCommitBlock block;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels;
@property (nonatomic, strong) NSMutableArray<DJJXMembers*> *membersArray;
@property (nonatomic, strong)NSMutableArray<NSString *> *MemberIds;
@end

NS_ASSUME_NONNULL_END
