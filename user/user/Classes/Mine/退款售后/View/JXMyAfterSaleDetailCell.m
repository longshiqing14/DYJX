//
//  JXMyAfterSaleDetailCell.m
//  user
//
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailCell.h"

@implementation JXMyAfterSaleDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(JXMyAfterSaleDetailProcessFlowModel *)model{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self.roundDot reat:5];
    self.cellSpeedProgressLable.text=model.name;
    self.cellTimeLable.text=model.createTime;
}

@end
