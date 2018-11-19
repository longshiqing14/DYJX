//
//  RCMLInteractionBaseCell.h
//  SealTalk
//
//  Created by Jue on 2018/5/23.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface RCMLInteractionBaseCell : RCMessageBaseCell

- (void)setDataModel:(RCMessageModel *)model;

- (void)setCellContentWithPortraitUrl:(NSString *)portraitUrl nickname:(NSString *)nickname content:(NSString *)content;
@end
