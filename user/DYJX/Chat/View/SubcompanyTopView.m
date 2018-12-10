//
//  SubcompanyTopView.m
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "SubcompanyTopView.h"

@implementation SubcompanyTopView

- (IBAction)friendBTNSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(ContacterTypeFriend);
    }
    
}
- (IBAction)normalBTNSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(ContacterTypeNormal);
    }
}
- (IBAction)blackBTNSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(ContacterTypeBlack);
    }
}
- (IBAction)deleteBTNSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(ContacterTypeDelete);
    }
}


@end
