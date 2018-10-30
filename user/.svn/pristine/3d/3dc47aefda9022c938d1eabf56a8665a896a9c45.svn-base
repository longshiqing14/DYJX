//
//  JXMyOrderDetailsCell.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOrderDetailsCell.h"
#import "JXMyOrderDetailsModel.h"

@implementation JXMyOrderDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)initCell:(id)dict OderState:(NSString *)oderstate IndexPath:(NSIndexPath *)indexPath{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.section==7){
        self.lineLable.hidden=NO;
    }else
    self.lineLable.hidden=YES;
    self.layoutBoot.constant=0;
    if ([dict isKindOfClass:[NSDictionary class]]) {
        if (indexPath.section==7) {
            NSString *titleKey=[dict valueForKey:@"title"];
            NSString *value=[dict valueForKey:@"value"];
            if ([titleKey isEqualToString:@"留言："]&&[value isEqualToString:@""]) {
                self.cellTitleLable.text=@"";
                self.cellSubLable.text=@"";
            }else{
                if ([titleKey isEqualToString:@"留言："]) {
                    self.layoutBoot.constant=0;
                }else{
                    self.layoutBoot.constant=15;
                }
                self.cellTitleLable.text=titleKey;
                self.cellSubLable.text=value;
            }
            
            
        }
//        else if (indexPath.section==4){
//            self.lineLable.hidden=YES;
//            NSString *value=[dict valueForKey:@"value"];
//            if ([value isEqualToString:@""]) {
//                self.cellTitleLable.text=@"";
//                self.cellSubLable.text=@"";
//            }else{
//                if (indexPath.row==0) {
//                     self.cellSubLable.textColor=XYRGBAColor(51, 51, 51, 1);
//                }else{
//                    self.cellSubLable.textColor=XYRGBAColor(236, 59, 44, 1);
//                }
//
//                self.cellTitleLable.text=[dict valueForKey:@"title"];
//                self.cellSubLable.text=[dict valueForKey:@"value"];
//            }
//        }
        else{
            self.lineLable.hidden=YES;
            NSString *value=[dict valueForKey:@"value"];
            if ([value isEqualToString:@""]) {
                self.cellTitleLable.text=@"";
                self.cellSubLable.text=@"";
            }else{
                self.cellTitleLable.text=[dict valueForKey:@"title"];
                self.cellSubLable.text=[dict valueForKey:@"value"];
            }
        }
        
        
    }else{
        if ([oderstate isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
            JXMyPayRecsModel *model=dict;
            self.cellTitleLable.text=model.name;
            self.cellSubLable.text=[NSString stringWithFormat:@"￥%@",model.price];
        }else{
            self.cellTitleLable.text=@"";
            self.cellSubLable.text=@"";
        }
        
    }
    if (indexPath.section==3||indexPath.section==4) {
 self.cellSubLable.textAlignment=NSTextAlignmentRight;
        if (indexPath.section==4) {
            if (indexPath.row==0) {
                self.cellSubLable.textColor=XYRGBAColor(51, 51, 51, 1);
                }else{
                self.cellSubLable.textColor=XYRGBAColor(236, 59, 44, 1);
            }
        }
    }else{
 self.cellSubLable.textAlignment=NSTextAlignmentLeft;
    }
    
    
    
//    if ([dict isKindOfClass:[NSDictionary class]]) {
//        NSDictionary *dic=dict;
//        NSArray *array=[dic allKeys];
//        NSString *key=array[0];
//        if (index==1) {
//            if ([key isEqualToString:@"配送费"]) {
//                self.cellSubLable.text=[NSString stringWithFormat:@"+￥%@",[dic valueForKey:key]];
//            }else if ([key isEqualToString:@"商品总额"]){
//                self.cellSubLable.text=[NSString stringWithFormat:@"￥%@",[dic valueForKey:key]];
//            }else{
//                self.cellSubLable.text=[NSString stringWithFormat:@"-￥%@",[dic valueForKey:key]];
//
//            }
//        }else{
//            self.cellSubLable.text=[dic valueForKey:key];
//        }
//
//        self.cellTitleLable.text=key;
//    }else if ([dict isKindOfClass:[JXMyPayRecsModel class]]){
//        JXMyPayRecsModel *model=dict;
//        self.cellTitleLable.text=model.name;
//        self.cellSubLable.text=[NSString stringWithFormat:@"￥%@",model.price];
//    }
    
}


@end
