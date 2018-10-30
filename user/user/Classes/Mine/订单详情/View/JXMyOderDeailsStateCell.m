//
//  JXMyOderDeailsStateCell.m
//  user
//
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDeailsStateCell.h"

@implementation JXMyOderDeailsStateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initCell:(NSDictionary *)dict{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.cellTitleLable.text=[dict valueForKey:@"title"];
    NSString *value=[dict valueForKey:@"value"];
    if ([value isEqualToString:@"no"]) {
        self.cellSubLable.text=@"不开发票";
        self.cellImageView.hidden=YES;
    }else if ([value isEqualToString:@"yes"]){
        self.cellImageView.hidden=NO;
        self.cellSubLable.text=@"明细";
    }else{
        
        if ([value isEqualToString:@""]) {
            self.cellTitleLable.text=@"";
            self.cellImageView.hidden=YES;
        }else{
            self.cellImageView.hidden=NO;
            self.cellTitleLable.text=[NSString stringWithFormat:@"%@：%@",[dict valueForKey:@"title"],[dict valueForKey:@"value"]];
        }
        
//        NSString *applyStatus=[dict valueForKey:@"sub"];
//        if ([applyStatus isEqualToString:@"0"]) {
//            if ([value isEqualToString:@""]) {
//                self.cellImageView.hidden=YES;
//                self.cellSubLable.text=@"";
//                self.cellTitleLable.text=@"";
//            }else
//             self.cellTitleLable.text=[NSString stringWithFormat:@"%@：待审核",[dict valueForKey:@"title"]];
//        }else if ([applyStatus isEqualToString:@"1"]){
//             self.cellTitleLable.text=[NSString stringWithFormat:@"%@：审核通过",[dict valueForKey:@"title"]];
//        }else if ([applyStatus isEqualToString:@"2"]){
//            self.cellTitleLable.text=[NSString stringWithFormat:@"%@：审核不通过",[dict valueForKey:@"title"]];
//        }else if ([applyStatus isEqualToString:@"3"]){
//            self.cellTitleLable.text=[NSString stringWithFormat:@"%@：已退货",[dict valueForKey:@"title"]];
//        }else if ([applyStatus isEqualToString:@"4"]){
//            self.cellTitleLable.text=[NSString stringWithFormat:@"%@：已退款",[dict valueForKey:@"title"]];
//        }
        
        self.cellSubLable.text=@"";

    }
}

@end
