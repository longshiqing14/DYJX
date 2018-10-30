//
//  JXRenewInInPutCell.m
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXRenewInInPutCell.h"
#import "UIView+Tool.h"

@implementation JXRenewInInPutCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic CellButtonTag:(NSInteger)tag{
    NSString *key=[dic allKeys][0];
    [self.cellButton reat:3];
    [self.cellButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
    self.cellTextField.tag=tag+100;
    self.cellLbale.text=key;
    self.cellButton.tag=tag+1000;
    self.cellTextField.placeholder=[dic objectForKey:key];
}
- (IBAction)codeClock:(id)sender {
    if (self.ClockCode) {
        self.ClockCode();
    }
}


@end
