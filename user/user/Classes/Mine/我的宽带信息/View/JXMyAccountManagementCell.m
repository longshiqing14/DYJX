//
//  JXMyAccountManagementCell.m
//  user
//
//  Created by liu_yakai on 2017/11/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyAccountManagementCell.h"
#import "UIView+Tool.h"

@implementation JXMyAccountManagementCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(MyBroadbandDetailsModel *)model{
    self.cellTitle.text=@"宽带账号";
    self.cellSubtitle.text=model.serviceNum;
    [self.cellButton reat:5];
    [self.cellButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
}

- (IBAction)delectClock:(id)sender {
    if (self.Clock) {
        self.Clock();
    }
}

@end
