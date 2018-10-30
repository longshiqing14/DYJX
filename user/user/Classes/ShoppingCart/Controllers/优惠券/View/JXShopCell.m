//
//  JXShopCell.m
//  user
//
//  Created by liu_yakai on 2017/12/1.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShopCell.h"
@interface JXShopCell()
@property (nonatomic, assign) BOOL clicked;
@end

@implementation JXShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clicked = NO;
}
- (IBAction)clickButton:(id)sender {
    self.clicked = !self.clicked;
//    if (self.clicked) {
//        [self.button setImage:[UIImage imageNamed:@"ic_arrow_up"] forState:(UIControlStateNormal)];
//    }else{
//         [self.button setImage:[UIImage imageNamed:@"ic_arrow_down"] forState:(UIControlStateNormal)];
//    }
    if (self.block) {
        self.block(self.button);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init{
    [self.circularLable reat:3];
    [self.circular reat:3];
}


@end
