//
//  JXRefundFooterView.m
//  user
//
//  Created by 岩  熊 on 2018/4/8.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundFooterView.h"

@implementation JXRefundFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)confirmClick:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
}

@end
