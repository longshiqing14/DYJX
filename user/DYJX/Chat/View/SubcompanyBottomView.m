//
//  SubcompanyBottomView.m
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "SubcompanyBottomView.h"

@interface SubcompanyBottomView ()
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;

@end

@implementation SubcompanyBottomView

- (IBAction)sendConversation:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
    
}

- (void)setSubcompanyBottomBtnWithTitle:(NSString *)title {
    [self.bottomBtn setTitle:title forState:(UIControlStateNormal)];
}

- (void)setSubcompanyBottomBtnWithBackgroundColor:(UIColor *)backgroundColor {
    self.bottomBtn.backgroundColor = backgroundColor;
}

- (void)setSubcompanyBottomBtnWithTitleColor:(UIColor *)titleColor {
    [self.bottomBtn setTitleColor:titleColor forState:(UIControlStateNormal)];
}

@end
