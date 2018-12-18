//
//  DYJXAddMemberTopView.m
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXAddMemberTopView.h"

@implementation DYJXAddMemberTopView

- (IBAction)addMemberClick:(UIButton *)sender {
    if (self.block) {
        self.block(OperatorMemberAdd);
    }
}

- (IBAction)deleteMemberClick:(UIButton *)sender {
    if (self.block) {
        self.block(OperatorMemberDelete);
    }
}

- (IBAction)giveAccsessAdminClick:(UIButton *)sender {
    if (self.block) {
        self.block(OperatorMemberAccessAdmin);
    }
}
- (IBAction)fireAdminClick:(UIButton *)sender {
    if (self.block) {
        self.block(OperatorMemberFireAdmin);
    }
}

@end
