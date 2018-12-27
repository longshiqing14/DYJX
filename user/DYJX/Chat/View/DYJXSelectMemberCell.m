//
//  DYJXSelectMemberCell.m
//  user
//
//  Created by 岩  熊 on 2018/12/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXSelectMemberCell.h"

@implementation DYJXSelectMemberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
