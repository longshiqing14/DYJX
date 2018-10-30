//
//  XYShoppingCartTVCell.h
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXSpecialOfferView1.h"
#import "XYShoppingCartCommon.h"
#import "JXSpecialOfferView.h"

@class XYShopingCartListModel;

@protocol XYShoppingCartTVCellDelegate <NSObject>

//- (void)shoppingCartTVCellEdit;

/** 修改购物车 商品 数量 */
- (void)shoppingCartChangeAmount:(int)amount model:(XYShopingCartListModel*)model;

/** 购物车 商品  选择 取消 */
- (void)shoppingCartCheckwithChecked:(NSString *)checked model:(XYShopingCartListModel*)model;

/** 购物车 商品 编辑状态 选择 取消  改变底部按钮  */
- (void)shoppingCartCheckWithEdit;


@end


@interface XYShoppingCartTVCell : UITableViewCell

/** cell 类型  */
@property (nonatomic) XYShoppingCartCellType cellType;

@property (nonatomic ,weak) id<XYShoppingCartTVCellDelegate> delegate;
@property(nonatomic,strong)UIImageView *uplineImageView;
@property(nonatomic,strong)UIImageView *downlineImageView;
@property(nonatomic,strong)UILabel *lineLable;
//删除购物车已过期的显示垃圾桶
@property(nonatomic,strong)void(^ BuyDeleteCommodity)();
/** 购物车数据 数据 */
@property (nonatomic, strong) XYShopingCartListModel * cartListModel;
@property(nonatomic,strong)JXSpecialOfferView1 *specialOfferView1;
@property(nonatomic,strong)JXSpecialOfferView *specialOfferView;

/** 创建 cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
