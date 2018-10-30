//
//  XYHomeHotGoodsCVCell.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYGoodsDetailModel;

@interface XYHomeHotGoodsCVCell : UICollectionViewCell

/** 商品图 */
@property (nonatomic, strong) UIImageView * iconImageView;
/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
///** 份量 单位 */
//@property (nonatomic, strong) UILabel * weightLB;
/** 价格 */
@property (nonatomic, strong) UILabel * priceLB;

/** 无库存 显示 */
@property (nonatomic, strong) UILabel * sellOutLB;

/** 编辑 购物车 底层图 */
@property (nonatomic, strong) UIImageView * editShoppingCartView;
/** 添加商品 按钮 */
@property (nonatomic, strong) UIButton * addBT;

//水印icon
@property(nonatomic,strong)UIImageView *markLocinImageView;

/** 详情数据  */
@property (nonatomic, strong) XYGoodsDetailModel * detailModel;


@end
