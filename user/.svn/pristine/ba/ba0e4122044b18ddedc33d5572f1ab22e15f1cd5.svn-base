//
//  JXOrderPricelCell.m
//  user
//
//  Created by liu_yakai on 2018/4/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOrderPricelCell.h"

@implementation JXOrderPricelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic IndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2||indexPath.section==5) {
        if (indexPath.section==2) {
            self.cellSubLable.textColor=XYRGBAColor(153, 153, 153, 1);
            self.cellTitleLable.textColor=XYRGBAColor(153, 153, 153, 1);
        }else{
            self.cellSubLable.textColor=XYRGBAColor(51, 51, 51, 1);
            self.cellTitleLable.textColor=XYRGBAColor(51, 51, 51, 1);
        } self.cellSubLable.textAlignment=NSTextAlignmentLeft;
    }else{
        self.cellSubLable.textColor=XYRGBAColor(51, 51, 51, 1);
        self.cellTitleLable.textColor=XYRGBAColor(51, 51, 51, 1); self.cellSubLable.textAlignment=NSTextAlignmentRight;
    }
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
        self.cellTitleLable.text=@"";
        self.cellSubLable.text=@"";
    }else{
        self.cellTitleLable.text=[dic valueForKey:@"title"];
        self.cellSubLable.text=[dic valueForKey:@"value"];
    }
    
}

@end
