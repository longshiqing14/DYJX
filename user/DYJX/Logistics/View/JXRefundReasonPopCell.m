//
//  JXRefundReasonPopCell.m
//  user
//
//  Created by 岩  熊 on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundReasonPopCell.h"

@implementation JXRefundReasonPopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    if (selected) {
//        [self.imageIcon setImage:[UIImage imageNamed:@"buy_icon_cir_pre"]];
//
//    }else{
//        [self.imageIcon setImage:[UIImage imageNamed:@"buy_icon_cir"]];
//    }
    
}


@end
