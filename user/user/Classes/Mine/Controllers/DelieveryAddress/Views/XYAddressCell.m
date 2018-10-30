//
//  XYAddressCell.m
//  user
//
//  Created by liu_yakai on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYAddressCell.h"

@implementation XYAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    if (selected) {
//        [self.selectImage setImage:[UIImage imageNamed:@"payment_icon_gx"]];
//        [self.cellImageView setImage:[UIImage imageNamed:@"add_red"]];
//        [self.cellTitle setTextColor:[UIColor colorWithHexString:@"#EC3B2C"]];
//    }else{
//       [self.selectImage setImage:[UIImage imageNamed:@""]];
//       [self.cellImageView setImage:[UIImage imageNamed:@"ic_locate_normal"]];
//       [self.cellTitle setTextColor:[UIColor colorWithHexString:@"#333333"]];
//    }
//}

-(void)cell_init{
    
}

@end
