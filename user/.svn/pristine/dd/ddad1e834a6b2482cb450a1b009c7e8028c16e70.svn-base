//
//  JXOderDistributionTypeView.m
//  user
//
//  Created by liu_yakai on 2018/4/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderDistributionTypeView.h"

@implementation JXOderDistributionTypeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)oderDistributionInit:(NSString *)type{
    if (![type isEqualToString:@""]) {
        self.distributionTypeLable.text=type;
    }else{
        self.distributionTypeLable.text=@"";
        self.distributionTitleLable.text=@"";
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.SelectClock) {
        self.SelectClock();
    }
}

@end
