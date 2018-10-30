//
//  JXCouponHeatView.m
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCouponHeatView.h"

@implementation JXCouponHeatView

-(id)initWith:(NSString *)xibName{
    self=[[[NSBundle mainBundle]loadNibNamed:xibName owner:self options:nil]lastObject];
    if (self) {
        
    }
    return self;
}

-(void)heat_init:(NSInteger)tag IsOpen:(BOOL)isOpen ImageName:(NSString *)imageName{
    /*//箭头
     @property (weak, nonatomic) IBOutlet UIButton *heatUpDown;
     //点击
     @property (weak, nonatomic) IBOutlet UIButton *clockButton;

*/
    self.heatUpDown.selected=isOpen;
    //优惠券面额
//    self.moneyLable.text
    //用户类型
//    self.userTypeLable.text
    //优惠券类型
//    self.voucherLable.text
    //优惠券时间
//    self.vocherTime.text
//   优惠券背景
//    self.backgroundImageView.image=SETIMAGENAME(imageName);
//    点view
    [self.circularLable reat:3];
    [self.circular reat:3];
//    限制
//    self.contentLable.text
//    self.content.text
}
- (IBAction)clockCoupon:(id)sender {
    UIButton *button=(UIButton *)sender;
    button.selected=!button.selected;
    if (self.Clock) {
        self.Clock(button.selected);
    }
}

@end
