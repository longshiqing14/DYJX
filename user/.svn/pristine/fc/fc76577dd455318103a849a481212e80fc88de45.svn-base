//
//  XYOrderListModel.h
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYOrderListBuyerInfoModel;
@class XYOrderListProcessStateInfoModel;


@interface XYOrderModel : NSObject
@property(nonatomic,strong)NSArray *orderList;
@property(nonatomic,strong)NSString *totalOrderAmount;
@end


@interface XYOrderListModel : NSObject


/** 购买 用户信息  */
@property (nonatomic, strong) XYOrderListBuyerInfoModel * buyerInfo;


/** 订单 id  订单单号 */
@property (nonatomic, copy) NSString * aliasCode;
/** 订单创建 时间 */
@property (nonatomic, copy) NSString * createTime;
/** 字符串形式订单创建时间 */
@property (nonatomic, strong) NSString * formatCreateTime;


/** 配送费 */
@property (nonatomic, copy) NSString * deliveryPrice;
/** 配送名称 */
@property (nonatomic, copy) NSString * deliveryRuleName;
/**  */
//@property (nonatomic, copy) NSString * description;


/**  */
@property (nonatomic, copy) NSString * isDeliveryPoint;
/** 是否需要自提 */
@property (nonatomic, copy) NSString * isDeliveryPointName;

/** 商品列表 */
@property (nonatomic, strong) NSMutableArray * items;

/** 订单状态 */
@property (nonatomic, strong) XYOrderListProcessStateInfoModel * processStateInfo;

/** 订单待支付总金额 */
@property (nonatomic, copy) NSString * totalOrderNeedPayPrice;

//商品件数
@property (nonatomic, copy) NSString * orderItemCount;
/** 订单商品总金额 */
@property (nonatomic, copy) NSString * totalProductPrice;






@end



/*************************************************************************/
/** 订单列表 用户信息 */
@interface XYOrderListBuyerInfoModel : NSObject

/**  地址 */
@property (nonatomic, copy) NSString * address;
/** 电话 */
@property (nonatomic, copy) NSString * mobile;
/** 收件人 */
@property (nonatomic, copy) NSString * userName;

@end

/*************************************************************************/
/** 订单列表 商品列表 */
@interface XYOrderListGoodsListModel : NSObject

/** 数量 */
@property (nonatomic, copy) NSString * amount;
/** 图片 */
@property (nonatomic, copy) NSString * logo;


/** 名称 */
@property (nonatomic, copy) NSString * name;
/**  */
@property (nonatomic, copy) NSString * totalPrice;
/**  */
@property (nonatomic, copy) NSString * unitPrice;

@end

/*************************************************************************/
/** 订单列表 订单状态 */
@interface XYOrderListProcessStateInfoModel : NSObject

/**  */
@property (nonatomic, copy) NSString * name;
/**  */
@property (nonatomic, copy) NSString * state;

@end








