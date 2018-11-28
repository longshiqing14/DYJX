//
//  DYJXLasterListCell.h
//  user
//
//  Created by longshiqing on 2018/11/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYJXLasterListCell : RCConversationBaseCell

@property (nonatomic, strong)UIImageView *porityImage;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *dotLabel;
@property (nonatomic, strong)UILabel *line;

-(void)setNumber:(NSInteger)number;
-(void)setCircle:(BOOL)isCircle;


@end

NS_ASSUME_NONNULL_END
