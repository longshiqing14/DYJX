//
//  OwnerImageCell.h
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GroupDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OwnerImageCell : BaseTableViewCell

@property (nonatomic, strong)UIImageView *porityImageView;
@property (nonatomic, strong)UIImageView *qcoreImageView;

@property (nonatomic, strong)GroupDetailModel *model;

@end

NS_ASSUME_NONNULL_END