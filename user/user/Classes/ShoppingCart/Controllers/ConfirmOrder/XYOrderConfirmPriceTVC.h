//
//  XYOrderConfirmPriceTVC.h
//  user
//  商品金额
//  Created by xingyun on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYOrderFromDetailocsModel;

@interface XYOrderConfirmPriceTVC : UITableViewController

extern const  CGFloat orderConfirm_price_cell_height;

@property (nonatomic, strong) XYOrderFromDetailocsModel * orderOcsModel;
- (void)setOrderOcsModel:(XYOrderFromDetailocsModel *)orderOcsModel isHide:(NSString *)hide;


@end
