//
//  XYOrderConfirmInvoiceSubTVCell.h
//  user
//
//  Created by xingyun on 2017/10/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYOrderConfirmInvoiceSubTVCell : UITableViewCell

@property(nonatomic,copy)void (^ PopClock)();

@property(nonatomic,strong)UIButton *explainButton;
/**  */
@property (nonatomic, strong) UILabel     * titleLB;

/**  */
@property (nonatomic, strong) UILabel     * subLB;

/**  */
@property (nonatomic, strong) UIImageView * iconImageView;





/** 创建 cell  */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
