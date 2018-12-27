//
//  DYJXSelectMemberPage.h
//  user
//
//  Created by 岩  熊 on 2018/12/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
#import "DYJXAddMemberTopView.h"
#import "XYDYJXResult.h"

typedef void(^CommitBlock)(NSMutableArray<XYDYJXResult*> *);

@interface DYJXSelectMemberPage : BaseViewController
@property (nonatomic, assign) OperatorMember operatorType;
@property (nonatomic, copy) CommitBlock block;


@end
