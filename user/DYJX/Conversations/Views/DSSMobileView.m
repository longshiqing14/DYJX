//
//  DSSMobileView.m
//  user
//
//  Created by longshiqing on 2019/5/5.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "DSSMobileView.h"

@implementation DSSMobileView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSString *name = NSStringFromClass(self.class);
        self = [[NSBundle mainBundle]loadNibNamed:name owner:self options:nil].firstObject;
        self.frame = frame;
    }
    return self;
}
- (IBAction)allSelected:(UIButton *)sender {
    if (self.block) {
        self.block(MobileTypeAll);
    }
}
- (IBAction)clearClick:(UIButton *)sender {
    if (self.block) {
        self.block(MobileTypeClear);
    }
}
- (IBAction)friendSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(MobileTypeFriend);
    }
}
- (IBAction)normalClick:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(MobileTypeNormal);
    }
}
- (IBAction)blackSelect:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.deleteBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(MobileTypeBlack);
    }
}
- (IBAction)deleteClick:(UIButton *)sender {
    [sender setImage:[UIImage imageNamed:@"register_checkbox_active"] forState:(UIControlStateNormal)];
    [self.NormalBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.BlackBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    [self.friendBTN setImage:[UIImage imageNamed:@"register_checkbox"] forState:(UIControlStateNormal)];
    if (self.block) {
        self.block(MobileTypeDelete);
    }
}


@end
