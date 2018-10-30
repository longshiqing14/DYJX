//
//  JXOderCell.m
//  user
//
//  Created by liu_yakai on 2018/3/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderCell.h"

@implementation JXOderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic Index:(NSInteger)index{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
        self.cellSubLable.text=@"";
        self.cellTitleLable.text=@"";
        self.cellSubPopLable.text=@"";
        self.arrowImageView.hidden=YES;
    }else{
        self.arrowImageView.hidden=NO;
        self.cellTitleLable.text=[dic valueForKey:@"title"];
//        self.cellSubPopLable.text=[dic valueForKey:@"value"];
            NSString *sub=[dic valueForKey:@"sub"];
            if ([sub intValue]>0) {
                self.cellSubLable.text=[NSString stringWithFormat:@"已选择%@张",sub];
                self.cellSubPopLable.text=[NSString stringWithFormat:@"-￥%@",[dic valueForKey:@"subvalue"]];
                [self.cellSubLable reat:5];
                [self.cellSubLable sideLine:1 SideLineColor:XYRGBAColor(236, 59, 44, 1)];
            }else{
                [self.cellSubLable reat:5];
                [self.cellSubLable sideLine:1 SideLineColor:XYRGBAColor(236, 59, 44, 1)];
                self.cellSubPopLable.text=[NSString stringWithFormat:@"-￥%@",[dic valueForKey:@"subvalue"]];
                self.cellSubLable.text=[NSString stringWithFormat:@"%@张可用",[dic valueForKey:@"value"]];
            }
        self.cellSubWidth.constant=[self subWidth:self.cellSubLable.text];
    }
    
//    self.cellSubLable.text=subTitle;
}

-(CGFloat)subWidth:(NSString *)subText{
    CGSize titleSize = [subText sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    return titleSize.width+10;
}


- (IBAction)popClock:(id)sender {
    if (self.ClockPop){
        self.ClockPop();
    } 
}

@end
