//
//  JXHomeLifeView.m
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeLifeView.h"

@implementation JXHomeLifeView
- (IBAction)ClockCity:(id)sender {
    if (self.Clock) {
        self.Clock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
