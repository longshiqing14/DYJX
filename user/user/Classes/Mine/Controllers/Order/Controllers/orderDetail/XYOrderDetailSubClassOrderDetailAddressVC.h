//
//  XYOrderDetailSubClassOrderDetailAddressVC.h
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYOrderDetailModel;

@interface XYOrderDetailSubClassOrderDetailAddressVC : UITableViewController


@property (nonatomic, strong) XYOrderDetailModel * detailModel;
//支付状态是否显示支付方式
- (void)setDetailModel:(XYOrderDetailModel *)detailModel OderType:(NSString *)oderType;
@end
