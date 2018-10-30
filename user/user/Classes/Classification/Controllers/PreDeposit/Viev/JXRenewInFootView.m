//
//  JXRenewInFootView.m
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXRenewInFootView.h"
#import "UIView+Tool.h"

@implementation JXRenewInFootView

-(void)layoutSubviews{
    [super layoutSubviews];
    [_footButton reat:5];
}

- (IBAction)submitClock:(id)sender {
    if (self.ClockSubmit) {
        self.ClockSubmit();
    }
}


@end
