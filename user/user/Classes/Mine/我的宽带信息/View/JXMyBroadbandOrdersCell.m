//
//  JXMyBroadbandOrdersCell.m
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyBroadbandOrdersCell.h"

@implementation JXMyBroadbandOrdersCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(JXMyOrderListModel *)model{
    self.celltime.text= [NSString stringWithFormat:@"申请时间：%@",model.formatCreateTime];
    if ([model.isInstallInformationReady isEqualToString:@"1"]||[model.isInstallInformationReady isEqualToString:@"2"]) {
        self.cellstate.text=model.isInstallInformationReadyLabel;
        self.cellstate.textColor = [UIColor colorWithHexString:@"#DAB485"];
        [self.cellstate sideLine:1 SideLineColor:[UIColor colorWithHexString:@"#DAB485"]];
    }else{
        self.cellstate.text=model.isInstallInformationReadyLabel;
        [self.cellstate sideLine:1 SideLineColor:[UIColor colorWithHexString:@"#EC3B2C"]];
        self.cellstate.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }
    self.cellTitle.text= model.boardName;
}

@end
