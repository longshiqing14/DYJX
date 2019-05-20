//
//  DYJXAddGroupMemberCell.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddGroupMemberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddGroupMemberCell : UITableViewCell

@property (nonatomic, strong) DYJXAddGroupSubMemberModel *model;

@property (nonatomic, assign) BOOL isSelection;

@property (nonatomic, assign) BOOL isSearchUser;

- (void)tapSelectionClcik;

@end

NS_ASSUME_NONNULL_END
