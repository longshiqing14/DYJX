//
//  DYJXLatestListCell.h
//  user
//
//  Created by longshiqing on 2018/11/23.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYJXLatestListCell : RCConversationBaseCell

@property (nonatomic, strong)UIImageView *porityImageView;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *info;
@property (nonatomic, strong)UILabel *dotLabel;
@property (nonatomic, strong)UILabel *time;

@end

NS_ASSUME_NONNULL_END
