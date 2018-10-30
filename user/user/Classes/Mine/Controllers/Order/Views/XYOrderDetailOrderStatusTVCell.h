//
//  XYOrderDetailOrderStatusTVCell.h
//  user
//
//  Created by xingyun on 2017/9/22.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXLogisticInfoDataModel;


@interface XYOrderDetailOrderStatusTVCell : UITableViewCell


/** 头像 */
@property (nonatomic, strong) UIImageView * iconImageView;

/** 头像上线 */
@property (nonatomic, strong) UIView * lineUpView;
/** 头像下线 */
@property (nonatomic, strong) UIView * lineDownView;

/** 状态 */
@property (nonatomic, strong) UILabel * titleLB;
/** 时间 */
@property (nonatomic, strong) UILabel * timeLB;



@property (nonatomic, strong) JXLogisticInfoDataModel * statusModel;



+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
