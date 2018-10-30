//
//  JXRefundAddressCell.m
//  user
//
//  Created by 岩  熊 on 2018/4/8.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundAddressCell.h"

@implementation JXRefundAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellEditingStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
