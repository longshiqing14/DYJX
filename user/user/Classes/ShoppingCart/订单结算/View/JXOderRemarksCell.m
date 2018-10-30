//
//  JXOderRemarksCell.m
//  user
//
//  Created by liu_yakai on 2018/3/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderRemarksCell.h"

@implementation JXOderRemarksCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic IndexPath:(NSIndexPath *)indexPath{
    self.titleLable.text=[dic valueForKey:@"title"];
    self.cellOrderNotesTextField.placeholder=[dic valueForKey:@"value"];
    if (indexPath.row==0) {
        self.cellOrderNotesTextField.keyboardType=UIKeyboardTypeDefault;
    }else{
        self.cellOrderNotesTextField.keyboardType=UIKeyboardTypeNumberPad;
    }
}

@end
