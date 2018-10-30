//
//  XYHomeTVCell.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYHomeTVCellDelegate <NSObject>

@optional
/** 跳转到 商品详情 */
- (void)homeTVCellpushGoodsDetailWithProductId:(NSString*)productId;

@end

@interface XYHomeTVCell : UITableViewCell

/** 代理 */
@property (nonatomic, strong) id <XYHomeTVCellDelegate> delegate;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * dataSource;

/** 创建 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
