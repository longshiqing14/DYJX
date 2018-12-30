//
//  DJCompanyChatCell.m
//  user
//
//  Created by 岩  熊 on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJCompanyChatCell.h"

@implementation DJCompanyChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
