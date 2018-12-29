//
//  DJCompanyChatHeader.m
//  user
//
//  Created by 岩  熊 on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJCompanyChatHeader.h"

@implementation DJCompanyChatHeader


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
}

- (IBAction)addSubCompanyButton:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
}

@end
