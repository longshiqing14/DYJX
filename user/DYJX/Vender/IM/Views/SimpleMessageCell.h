//
//  SimpleMessageCell.h
//  user
//
//  Created by longshiqing on 2018/12/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

/**
 * 文本消息Cell
 */
@interface SimpleMessageCell : RCMessageCell

/**
 * 消息显示Label
 */
@property(strong, nonatomic) RCAttributedLabel *textLabel;

/**
 * 消息背景
 */
@property(nonatomic, strong) UIImageView *bubbleBackgroundView;

@property(nonatomic, strong)UILabel *nickLabel;

@property(nonatomic, strong)UILabel *timeLabel;

/**
 * 设置消息数据模型
 *
 * @param model 消息数据模型
 */
- (void)setDataModel:(RCMessageModel *)model;
@end
