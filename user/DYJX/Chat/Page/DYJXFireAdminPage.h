//
//  DYJXFireAdminPage.h
//  user
//
//  Created by 岩  熊 on 2018/12/28.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
#import "DJJXMembers.h"

typedef void(^DeleteCommitBlock)(NSMutableArray<DJJXMembers*> *);

@interface DYJXFireAdminPage : BaseViewController
@property (nonatomic, strong)NSMutableArray<DJJXMembers*> *fireAdminArray;
@property (nonatomic, assign) OperatorMember operatorType;
@property (nonatomic, copy) DeleteCommitBlock block;
@end
