//
//  JXVersionUpdateView.m
//  user
//
//  Created by 岩  熊 on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXVersionUpdateView.h"


@interface JXVersionUpdateView()

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation JXVersionUpdateView

- (void)awakeFromNib{
    [super awakeFromNib];

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bottomView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5,5)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bottomView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    self.bottomView.layer.mask = maskLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)updateBTBClick:(UIButton*)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/jie-zou-da-shi/id1308191405?mt=8"]];
//    if (self.goToAppStoreBlock) {
//        self.goToAppStoreBlock();
//    }
    
    
}
- (IBAction)closeUpdateClick:(UIButton *)sender {
    [YWDPopupControl hide];
    [self dismissPOP];
}


@end
