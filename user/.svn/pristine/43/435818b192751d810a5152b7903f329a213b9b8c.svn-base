//
//  JXShoppingCartView.m
//  user
//
//  Created by liu_yakai on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShoppingCartHeatView.h"

@implementation JXShoppingCartHeatView

-(void)heat_init:(NSInteger)tag Model:(XYShopTargetsModel *)model{
    [self.dotLable reat:4];
//    self.typeWidth.constant=0;
    self.singleButton.tag=tag;
    self.clockButton.tag=tag;
    
    self.typeLable.text=model.actionType;
    self.typeWidth.constant=[self lableWidth];
    self.moneyLable.text = model.userFriendlyMessage;
    if (!model.userNextFriendlyMessag||[model.userNextFriendlyMessag isEqualToString:@"null"]) {
        return;
    }
    NSString *titles=[NSString stringWithFormat:@"%@%@",model.userFriendlyMessage,model.userNextFriendlyMessag];
    NSLog(@"%lu",(unsigned long)titles.length);
    NSString *title=[NSString stringWithFormat:@"%@",model.userNextFriendlyMessag];
    NSRange range = NSMakeRange(titles.length - title.length, title.length); //获取字符串最后三位
    
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc]initWithString:titles];
    
    [mutAttStr addAttribute:NSForegroundColorAttributeName value:XYRGBAColor(236,59,44, 1) range:range]; //设置颜色
    
    self.moneyLable.attributedText = mutAttStr;
}

-(CGFloat)lableWidth{
    [self.typeLable reat:5];
    [self.typeLable sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
    UIFont *fnt = [UIFont systemFontOfSize:12];
    self.typeLable.font = fnt;
    // 根据字体得到NSString的尺寸
    CGSize size = [self.typeLable.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    // 名字的W
    return size.width+10;
}

- (IBAction)clock:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (self.ClockSingle) {
        self.ClockSingle(button.tag);
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
