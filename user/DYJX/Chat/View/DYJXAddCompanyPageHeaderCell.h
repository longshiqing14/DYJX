//
//  DYJXAddCompanyPageHeaderCell.h
//  user
//
//  Created by YP on 2019/4/24.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupDetailModel.h"
#import "BaseTableViewCell.h"
#import "OwnerImageCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddCompanyPageHeaderCell : BaseTableViewCell

@property (nonatomic, strong)UIImageView *porityImageView;

@property (nonatomic, strong)GroupDetailModel *model;
@property (nonatomic, copy)TapPorityImageViewBlock block;



@end

NS_ASSUME_NONNULL_END
