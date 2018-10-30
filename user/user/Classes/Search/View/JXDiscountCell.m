//
//  JXDiscountCell.m
//  user
//
//  Created by liu_yakai on 2017/12/3.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXDiscountCell.h"


@implementation JXDiscountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cell_init:(NSString *)title{
    if ([title isEqualToString:@"券"]) {
        [self.cellButton setBackgroundImage:SETIMAGENAME(@"ic_prolist_ticket") forState:(UIControlStateNormal)];
        [self.cellButton setTitle:title forState:UIControlStateNormal];
        [self.cellButton reat:0];
    }else{
        [self.cellButton setBackgroundImage:SETIMAGENAME(@"") forState:(UIControlStateNormal)];
        [self.cellButton setTitle:title forState:UIControlStateNormal];
        [self.cellButton reat:5];
        [self.cellButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
       
    }
    
    
        
}


@end
