//
//  DYJXAddGroupMemberCell.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddGroupMemberModel.h"

@class DYJXAddGroupMemberCell;

typedef void(^SelectBtnBlock)(DYJXAddGroupMemberCell *cell, BOOL isSelected);

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberCell : UITableViewCell

@property (nonatomic, strong) DYJXAddGroupSubMemberModel *model;

@property (nonatomic, assign) BOOL isSelection;

@property (nonatomic, assign) BOOL isSearchUser;

@property (nonatomic, copy) SelectBtnBlock block;

@property (nonatomic, assign) OperatorMember operatorType;

- (void)tapSelectionClcik;

@end

NS_ASSUME_NONNULL_END
