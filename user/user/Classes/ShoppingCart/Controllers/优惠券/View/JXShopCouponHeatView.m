//
//  JXShopCouponHeatView.m
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShopCouponHeatView.h"

@interface JXShopCouponHeatView ()

@end


@implementation JXShopCouponHeatView
- (IBAction)selectClock:(id)sender {
    UIButton *button=(UIButton *)sender;
//    button.selected=!button.selected;
    if (self.SelectClock) {
        self.SelectClock(!button.selected,self.numberButton.textField.text);
    }
}



-(void)heat_init:(NSInteger)tag ImageName:(NSString *)imageName shopModel:(JXHhopAvailableBatchesModel *)model{
    
        WeakSelf;
    self.numberButton.numberBlock = ^(NSString *num){
        NSLog(@"%@",num);
        if (weakSelf.ClockPlus) {
            weakSelf.ClockPlus(num);
        }
    };
    
    self.numberButton.PPClockSmall = ^{
        if (weakSelf.ClockSmall) {
            weakSelf.ClockSmall();
        }
    };
    self.numberButton.maxnumber=[model.maxUseCount integerValue];
    [self.numberButton setBorderColor:XYRGBAColor(238,238,238, 1)];
    [self.allCoupons setTitle:[NSString stringWithFormat:@"%@张",model.maxUseCount] forState:(UIControlStateNormal)];
//    if ([model.maxUseCount integerValue]>1) {
//        self.allCoupons.hidden=NO;
//    }else
//    self.allCoupons.hidden=YES;
    
    if ([model.usedCount isEqualToString:@"0"]) {
        self.numberButton.textField.text=@"1";
    }else
        self.numberButton.textField.text=model.usedCount;
    
    /*@property (weak, nonatomic) IBOutlet PPNumberButton *numberButton;
     
     
     @property(nonatomic,copy)void (^ Clock)(BOOL isOpen);
     //箭头
     @property (weak, nonatomic) IBOutlet UIButton *heatUpDown;
     //点击
     @property (weak, nonatomic) IBOutlet UIButton *clockButton;
     
     */
   
    //用户类型
    self.userTypeLable.text=model.outerName;
     //优惠券类型
    self.voucherLable.text=model.range;
    
    //优惠券时间
    self.vocherTime.text=[NSString stringWithFormat:@"%@-%@",model.effectedBeginString,model.effectedEndString];
    self.fullDenomination.text=model.threshold;
    NSLog(@"%@",model.usedCount);
    if (![model.usedCount isEqualToString:@"0"]) {
        self.selectButton.selected=YES;
    }else{
        self.selectButton.selected=NO;
    }
   
    self.backgroundImageView.image=SETIMAGENAME(@"bg_coupons_red");
    //优惠券面额
    self.moneyLable.attributedText=[self string:@"￥" Value:model.faceValue Color16:@"EC3B2C"];
    self.fullDenomination.textColor=XYRGBAColor(236,59,44, 1);
    self.allCoupons.selected=NO;
//    else{
//   self.selectButton.selected=NO; self.backgroundImageView.image=SETIMAGENAME(@"bg_coupons_gray");
//        //优惠券面额
//        self.moneyLable.attributedText=[self string:@"￥" Value:model.faceValue Color16:@"999999"];
//        self.fullDenomination.textColor=XYRGBAColor(153,153,153, 1);
//        self.allCoupons.selected=YES;
//    }
     /*
     //优惠券背景
     @property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
     //点View
     @property (weak, nonatomic) IBOutlet UILabel *circularLable;
     @property (weak, nonatomic) IBOutlet UILabel *circular;
     //内容
     @property (weak, nonatomic) IBOutlet UILabel *contentLable;
     @property (weak, nonatomic) IBOutlet UILabel *content;
    */

    
}


-(NSAttributedString *)string:(NSString *)keyStr Value:(NSString *)value Color16:(NSString *)color16{
    NSString *str=[NSString stringWithFormat:@"<html><body><font face=\"PingFang-SC-Regular\" size=\"4\" color=\"#%@\">%@ </font><font face=\"PingFang-SC-Regular\" size=\"7\" color=\"#%@\">%@ </font></body></html>",color16,keyStr,color16,value];
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attrStr;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
