//
//  JXMyAfterSaleDetailInformationCell.m
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailInformationCell.h"
#import "NSString+Tool.h"

@implementation JXMyAfterSaleDetailInformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)cell_init:(NSDictionary *)dic IndexPath:(NSIndexPath *)indexPath{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.section==1) {
        self.lineLable.hidden=NO;
        //            申请原因
        self.cellTitleLable.textColor=XYRGBAColor(51, 51, 51, 1);
        self.cellSubLbale.textColor=XYRGBAColor(51, 51, 51, 1);
        self.cellTitleLable.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
        self.cellSubLbale.text=[dic valueForKey:@"value"];
    }else if(indexPath.section==5){
        self.lineLable.hidden=YES;
        //            订单金额
        self.cellTitleLable.textColor=XYRGBAColor(153, 153, 153, 1);
        self.cellSubLbale.textColor=XYRGBAColor(236, 59, 44, 1);
        self.cellTitleLable.text=[dic valueForKey:@"title"];
        self.cellSubLbale.text=[dic valueForKey:@"value"];
        
    }else{
        self.lineLable.hidden=YES;
        //            售后单号 申请时间 订单编号 联系人 联系电话 取货地址
        self.cellTitleLable.textColor=XYRGBAColor(153, 153, 153, 1);
        self.cellSubLbale.textColor=XYRGBAColor(153, 153, 153, 1);
        self.cellTitleLable.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
        self.cellSubLbale.text=[dic valueForKey:@"value"];
    }
}
@end
