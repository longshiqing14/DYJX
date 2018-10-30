//
//  XYShopingCartListModel.h
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYShopingCartPromotionsModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *discount;
@end

@interface XYShopingCartProductLevelPromotionLabelsModel : NSObject
@property(nonatomic,strong)NSString *label;
@property(nonatomic,strong)NSArray *promotions;
@end


@interface XYShopingCartListModel : NSObject
//休会提示在商品上面
@property (nonatomic, strong) XYShopingCartProductLevelPromotionLabelsModel * productLevelPromotionLabels;
/** 商品状态 */
/** state   商品状态 非0为不可用 */
@property (nonatomic, copy) NSString * state;
/** stateTip 如果state为非0，提示是 缺货或者下架等不可用原因 */
@property (nonatomic, copy) NSString * stateTip;

/** 均价 */
@property (nonatomic, copy) NSString * balancePrice;
/** 购物车 id */
@property (nonatomic, copy) NSString * cartId;
/** 购物车类型名 */
@property (nonatomic, copy) NSString * cartType;
/** 选中的 */
@property (nonatomic, copy) NSString * checked;
/**  */
@property (nonatomic, copy) NSString * depositPrice;
/**  */
@property (nonatomic, copy) NSString * diffPrice;
/**  */
@property (nonatomic, copy) NSString * icon;
/**  */
@property (nonatomic, copy) NSString * itemId;
/**  */
@property (nonatomic, copy) NSString * number;
//折扣后 - 单品价格
@property (nonatomic, copy) NSString *unitDealPrice;
@property (nonatomic, copy) NSString *unitDiscountedPrice;

/**  */
@property (nonatomic, copy) NSString * productId;
/**  */
@property (nonatomic, copy) NSString * productName;
/**  */
@property (nonatomic, copy) NSString * realSkuId;
/**  */
@property (nonatomic, copy) NSString * selectedOrderRuleId;
@property (nonatomic, copy) NSString * marketUnitPrice;
/**  */
@property (nonatomic, copy) NSString * skuId;
/**  */
@property (nonatomic, copy) NSString * totalBalancePrice;
/**  */
@property (nonatomic, copy) NSString * totalDepositPrice;
/**  */
@property (nonatomic, copy) NSString * totalPayPrice;
/**  */
@property (nonatomic, copy) NSString * totalPrice;
/**  */
@property (nonatomic, copy) NSString * unitPrice;


/** 本地使用 是否是 编辑选择  */
@property (nonatomic, assign, getter = isSelectEdit) BOOL selectEdit;

@end


