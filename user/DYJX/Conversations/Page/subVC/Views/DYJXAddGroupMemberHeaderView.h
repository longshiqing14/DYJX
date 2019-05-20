//
//  DYJXAddGroupMemberHeaderView.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddGroupMemberModel.h"

@class DYJXAddGroupMemberHeaderView;

typedef void(^TapGroupMemberHeaderViewBlock)(DYJXAddGroupMemberHeaderView *headerView);

typedef void(^TapAllElectionBtnBlock)(DYJXAddGroupMemberHeaderView *headerView);

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) DYJXAddGroupMemberModel *model;

@property (nonatomic, copy) TapGroupMemberHeaderViewBlock block;
@property (nonatomic, copy) TapAllElectionBtnBlock allElectionBlock;
@end

NS_ASSUME_NONNULL_END
