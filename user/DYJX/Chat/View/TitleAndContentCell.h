//
//  TitleAndContentCell.h
//  user
//
//  Created by 岩  熊 on 2018/11/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GroupDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TitleAndContentCell : BaseTableViewCell
@property(nonatomic, strong) UIImageView *iconImage;
@property(nonatomic, strong) UITextField* contentLb;
@property (nonatomic, strong) UIView *separatorLineView;

//@property (nonatomic, strong)GroupDetailModel *model;
@end

NS_ASSUME_NONNULL_END
