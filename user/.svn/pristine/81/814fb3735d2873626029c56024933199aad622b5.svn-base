//
//  JXOderIntegralCell.m
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderIntegralCell.h"
#import "NSString+Tool.h"

@implementation JXOderIntegralCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//提示按钮

- (IBAction)popClock:(id)sender {
    if (self.ClockPop) {
        self.ClockPop();
    }
}
- (IBAction)openAndCloseClock:(id)sender {
    UISwitch *openSwitch=(UISwitch *)sender;
    if (self.ClockSwitch) {
        self.ClockSwitch(openSwitch.isOn);
    }
}

-(void)cell_init:(NSDictionary *)dic{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.cellTitleLable.text=[dic valueForKey:@"title"];
    NSLog(@"%@",[dic valueForKey:@"value"]);
    if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
        self.cellSwitch.on=NO;
    }else{
        self.cellSwitch.on=YES;
    }
//    self.cellSwitch.on=[[dic valueForKey:@"value"] boolValue];
    if ([[dic valueForKey:@"subvalue1"] isEqualToString:@"1"]) {
        self.cellSwitch.hidden=NO;
        NSString *subvalue=[NSString stringWithFormat:@"￥%@",[dic valueForKey:@"subvalue"]];
        self.cellSubLable.attributedText=[[NSString stringWithFormat:@"可用%@积分,抵扣%@",[dic valueForKey:@"sub"],subvalue] changeColour:subvalue FountColour:XYRGBAColor(236, 59, 44, 1)];
    }else{
        self.cellSwitch.hidden=YES;
        self.cellSubLable.text=[NSString stringWithFormat:@"共%@积分,当前不可用",[dic valueForKey:@"sub"]];
    }
    
}

@end
