//
//  JXShopOpenCell.m
//  user
//
//  Created by liu_yakai on 2017/12/1.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShopOpenCell.h"
@interface JXShopOpenCell()
@property (nonatomic, assign) BOOL clicked;

@end

@implementation JXShopOpenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clicked = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickButton:(id)sender {
    self.clicked = !self.clicked;
//    if (self.clicked) {
//        [self.button setImage:[UIImage imageNamed:@"ic_arrow_up"] forState:(UIControlStateNormal)];
//    }else{
//        [self.button setImage:[UIImage imageNamed:@"ic_arrow_down"] forState:(UIControlStateNormal)];
//    }
    if (self.block) {
        self.block(self.button);
    }
}
-(void)cell_init{
    [self.circularLable reat:3];
}

@end
