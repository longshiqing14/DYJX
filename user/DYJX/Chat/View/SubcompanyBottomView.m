//
//  SubcompanyBottomView.m
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "SubcompanyBottomView.h"

@implementation SubcompanyBottomView

- (IBAction)sendConversation:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
}


@end
