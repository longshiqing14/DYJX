//
//  RCMLImgTxtBaseCell.h
//  SealTalk
//
//  Created by Jue on 2018/5/23.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface RCMLImgTxtBaseCell : RCMessageBaseCell

- (void)setDataModel:(RCMessageModel *)model;

- (void)setCellContentWithimageUrl:(NSString *)imageUrl title:(NSString *)title content:(NSString *)content cellHeight:(CGFloat)cellHeight;

@end
