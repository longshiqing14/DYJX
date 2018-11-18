//
//  XYOrderDetailModel.h
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYOrderDetailBuyerInfoModel;
@class XYOrderDetailInvoiceInfoModel;
@class XYOrderDetailDeliveryPointInfoModel;
@class XYOrderDetailSellerInfoModel;
@class XYOrderDetailProcessStateInfoModel;
@class XYOrderDetailModel;
@interface XYOrderDetailAndPaymentModel : NSObject
/** 订单号 */
@property (nonatomic, strong) NSArray<NSString*> *paymentArr;
@end

@interface XYOrderDetailModel : NSObject
@property(nonatomic,strong)NSString *descriptionCount;
/** 订单号 */
@property (nonatomic, copy) NSString * aliasCode;

/** 购买人信息 */
@property (nonatomic, strong) XYOrderDetailBuyerInfoModel * buyerInfo;

/** 创建 时间 */
@property (nonatomic, copy) NSString * createTime;
/** 创建时间  */
@property (nonatomic, copy) NSString * formatCreateTime;

/** 发票信息 */
@property (nonatomic, strong) XYOrderDetailInvoiceInfoModel * invoiceInfo;

/** 自提信息 */
@property (nonatomic, strong) XYOrderDetailDeliveryPointInfoModel * deliveryPointInfo;

/** 配送费 */
@property (nonatomic, copy) NSString * deliveryPrice;
/** 配送名称 */
@property (nonatomic, copy) NSString * deliveryRuleName;
/**  */
//@property (nonatomic, copy) NSString * description;

/** 是否需要自提  1需要   0不需要 */
@property (nonatomic, copy) NSString * isDeliveryPoint;
/** 是否需要自提   */
@property (nonatomic, copy) NSString * isDeliveryPointName;


/** 商品 列表 */
@property (nonatomic, strong) NSMutableArray * items;

/** 支付 列表 */
@property (nonatomic, strong) NSMutableArray * payRecs;


/** 支付方式  */
@property (nonatomic, copy) NSString * paymentName;

/** 商家信息 */
@property (nonatomic, strong) XYOrderDetailSellerInfoModel * sellerInfo;

/** 订单状态 */
@property (nonatomic, strong) XYOrderDetailProcessStateInfoModel * processStateInfo;

/** 订单待支付总金额 */
//代付款为换需要支付
//代发货等为实付金额
@property (nonatomic, copy) NSString * totalOrderNeedPayPrice;

/** 订单商品总金额 */
@property (nonatomic, copy) NSString * totalProductPrice;

/** 订单总金额 (商品金额 + 运费 ) */
@property (nonatomic, copy) NSString * totalOrderPrice;

/** 订单 用券金额 */
@property (nonatomic, copy) NSString * totalUsedCardAmount;


//优惠券
@property (nonatomic, copy) NSString *totalCardPayPrice;
@property(nonatomic,strong)NSString *totalOrderDiscount;
//优惠积分
@property(nonatomic,strong)NSString *integralDiscount;
@end


/*******************************************************************************************************/
/** 购买用户信息 buyerInfo */
@interface XYOrderDetailBuyerInfoModel : NSObject

/** 地址 */
@property (nonatomic, copy) NSString * address;
/** 用户名 */
@property (nonatomic, copy) NSString * userName;
/** 电话 */
@property (nonatomic, copy) NSString * mobile;

@end

/*******************************************************************************************************/
/** 发票信息 invoiceInfo */
@interface XYOrderDetailInvoiceInfoModel : NSObject
//发票信息说明
@property(nonatomic,strong)NSString *invoiceDesc;

/**  */
@property (nonatomic, copy) NSString * invoiceContent;
/**  */
@property (nonatomic, copy) NSString * invoiceTitle;
/** 发票类型 */
@property (nonatomic, copy) NSString * invoiceTitleType;
/** 发票类型 名 */
@property (nonatomic, copy) NSString * invoiceTitleTypeName;
/** 是否有发票 */
@property (nonatomic, copy) NSString * needInvoiceKey;
/** 纳税人 识别号 */
@property (nonatomic, copy) NSString * invoiceCertificate;
/** 发票金额 */
@property (nonatomic, copy) NSString *invoicePrice;
/** 接受发票邮箱 */
@property (nonatomic, copy) NSString *invoiceMail;
/** 开票状态 0正在开票 1开票完成 */
@property (nonatomic, copy) NSString *invoiceStatus;
/** 电子发票地址 */
@property (nonatomic, copy) NSString *invoiceURL;
@end

/*********************************************************************************************************/

/** 发货信息 deliveryPointInfo */
@interface XYOrderDetailDeliveryPointInfoModel : NSObject


/** 地址 */
@property (nonatomic, copy) NSString * address;
/** 电话 */
@property (nonatomic, copy) NSString * mobile;
/**  */
@property (nonatomic, copy) NSString * name;
/** 地址id */
@property (nonatomic, copy) NSString * contact;

@end


/*********************************************************************************************************/

/** 商品信息 itemList */
@interface XYOrderDetailItemListModel : NSObject

/** 数量 */
@property (nonatomic, copy) NSString * amount;
/** 图片 */
@property (nonatomic, copy) NSString * logo;
/** 商品 名 */
@property (nonatomic, copy) NSString * name;
//商品id
@property (nonatomic, copy) NSString * commodityId;
/** 商品 总价 */
@property (nonatomic, copy) NSString * totalPrice;
/** 商品单价 */
@property (nonatomic, copy) NSString * unitPrice;
@property (nonatomic, copy) NSString * marketUnitPrice;
@property(nonatomic,strong)NSString *unitDiscountedPrice;
//@property(nonatomic,strong)NSString *originUnitPrice;

@end

/*********************************************************************************************************/

/**   PayRecs  */
@interface XYOrderDetailPayRecsModel : NSObject

/** id */
@property (nonatomic, copy) NSString * payRecs_id;
/** 名 */
@property (nonatomic, copy) NSString * name;
/** 价格 */
@property (nonatomic, copy) NSString * price;



@end


/*************************************************************************/
/** 商家信息 sellerInfo */
@interface XYOrderDetailSellerInfoModel : NSObject

/** 商家 id */
@property (nonatomic, copy) NSString * merchantId;
/** 商家名 */
@property (nonatomic, copy) NSString * merchantName;
/** 商家电话 */
@property (nonatomic, copy) NSString * mobile;

@end

/*************************************************************************/
/** 订单列表 订单状态 */
@interface XYOrderDetailProcessStateInfoModel : NSObject

/**  */
@property (nonatomic, copy) NSString * name;
/**  */
@property (nonatomic, copy) NSString * state;

@end




















