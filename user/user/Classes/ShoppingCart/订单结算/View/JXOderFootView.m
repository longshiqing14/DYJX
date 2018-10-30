//
//  JXOderFootView.m
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderFootView.h"
#import "NSString+Tool.h"

@implementation JXOderFootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)foot_init:(NSString *)paymentPrice
{
    NSString *price=[NSString stringWithFormat:@"￥%@",paymentPrice];
    self.footTitleLable.attributedText=[[NSString stringWithFormat:@"应付金额：%@",price] changeColour:price FountColour:XYRGBAColor(236, 59, 44, 1)];
}



- (IBAction)footClock:(id)sender {
    if (self.ClockSubmit) {
        self.ClockSubmit();
    }
}

@end
