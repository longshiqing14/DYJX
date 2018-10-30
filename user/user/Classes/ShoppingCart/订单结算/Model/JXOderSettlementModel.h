//
//  JXOderSettlementModel.h
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

//发票信息
@interface JXOderInvoiceInfoModel : NSObject
@property(nonatomic,strong)NSString *needInvoiceKey;
@property(nonatomic,strong)NSString *taxCode;
@property(nonatomic,strong)NSString *displayInvoiceKey;
//纳税人识别号
@property(nonatomic,strong)NSString *invoiceCertificate;

@property(nonatomic,strong)NSString *invoiceInfoID;
//发票抬头
@property(nonatomic,strong)NSString *invoiceTitle;
//企业类型  vat为企业
@property(nonatomic,strong)NSString *invoiceTypeKey;
//发票弹窗提示
@property(nonatomic,strong)NSString *invoiceDesc;
@property(nonatomic,strong)NSString *invoiceUserName;
//明细
@property(nonatomic,strong)NSString *invoiceContent;
//企业、个人
@property(nonatomic,strong)NSString *invoiceTitleType;
@end

//地址信息
@interface JXOderDeliveryAddressModel : NSObject
//收货人姓名
@property(nonatomic,strong)NSString *userName;

@property(nonatomic,strong)NSString *addressID;
@property(nonatomic,strong)NSString *regionName;
//收货人手机号
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *isDefault;
//收货人详细地址
@property(nonatomic,strong)NSString *address;

@end
//没有用到该对象
@interface JXOderAllCardRulesModel : NSObject

@end

//到店自提、送货上门
@interface JXOderAvailableDeliveryRuleResults : NSObject
@property(nonatomic,strong)NSString *supportDP;
@property(nonatomic,strong)NSString *remark;
@property(nonatomic,strong)NSString *deliveryID;
//到店自提、送货上门
@property(nonatomic,strong)NSString *name;
//提示
@property(nonatomic,strong)NSString *descriptionDoc;
//价格
@property(nonatomic,strong)NSString *totalPrice;
@end

//积分弹窗内容
@interface JXOderIntegralDescModel : NSObject
//积分说明标题
@property(nonatomic,strong)NSString *title;
//积分说明内容
@property(nonatomic,strong)NSArray *desc;
@end



//积分
@interface JXOderIntegralModel : NSObject
//抵扣多少积分
@property(nonatomic,strong)NSString *integralBalance;
//弹窗提示
@property(nonatomic,strong)NSArray *integralDesc;
@property(nonatomic,strong)NSString *columnName;
@property(nonatomic,strong)NSString *useSatio;
@property(nonatomic,strong)NSString *integralMoneyRatio;
//空间是否展示
@property(nonatomic,strong)NSString *integralDisplay;
//开关是否打开
@property(nonatomic,strong)NSString *integralShow;
@property(nonatomic,strong)NSString *giveIntegralayInterfaceId;
@property(nonatomic,strong)NSString *integralNum;
@property(nonatomic,strong)NSString *integralPrice;
@property(nonatomic,strong)NSString *rate;
@property(nonatomic,strong)NSString *productColumnId;
@property(nonatomic,strong)NSString *maxPrice;

@end

//自提点信息
@interface JXOderDeliveryPointInfoModel : NSObject
//自提点ID
@property(nonatomic,strong)NSString *sinceID;
//自提点电话
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *name;
//自提点地址
@property(nonatomic,strong)NSString *address;
@end

@interface JXOderOcsModel : NSObject
//没有用到字段
@property(nonatomic,strong)NSArray *allCardRules;
@property(nonatomic,strong)NSArray *availableDeliveryRuleResults;
//积分
@property(nonatomic,strong)JXOderIntegralModel *integral;
//运营中心名字
@property(nonatomic,strong)NSString *merchantName;
//顶部提示信息
@property(nonatomic,strong)NSString *deliveryRuleTips;
//购物车ID
@property(nonatomic,strong)NSString *cartId;
//优惠券抵扣钱数
@property(nonatomic,strong)NSString *totalUsedCardAmount;
@property(nonatomic,strong)NSString *showDeliveryRuleTips;
//当前是到店自提、送货上门
@property(nonatomic,strong)NSString *selectedDeliveryRuleName;
//总金额立减钱数
@property(nonatomic,strong)NSString *totalOrderDiscount;
//配送方式id
@property(nonatomic,strong)NSString *selectedDeliveryRuleId;
//自提点信息
@property(nonatomic,strong)JXOderDeliveryPointInfoModel *deliveryPointInfo;
//提交订单的付款金额
@property(nonatomic,strong)NSString *totalPayPrice;
//总金额立减
@property(nonatomic,strong)NSString *totalOrderProductPrice;
//优惠券张数
@property(nonatomic,strong)NSString *totalUsedCardSize;
//优惠券是否显示 0不显示
@property(nonatomic,strong)NSString *totalCanUseCardSize;
//没有字段
@property(nonatomic,strong)NSArray *paymentList;
//配送费
@property(nonatomic,strong)NSString *totalDeliveryFee;
//商品数组
@property(nonatomic,strong)NSArray *buyItems;

@property(nonatomic,strong)NSString *descriptionDoc;
@end


@interface JXOderBuyItemsModel : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *unitDealPrice;
//原价
@property(nonatomic,strong)NSString *marketUnitPrice;
@property(nonatomic,strong)NSString *unitPrice;
//商品id
@property(nonatomic,strong)NSString *productId;
//商品名称
@property(nonatomic,strong)NSString *productName;
//优惠价格
@property(nonatomic,strong)NSString *unitDiscountedPrice;
@property(nonatomic,strong)NSString *skuId;
@property(nonatomic,strong)NSString *totalDealPrice;
//图片url
@property(nonatomic,strong)NSString *icon;
@end

//无效 没有使用的对象
@interface JXOderPaymentListModel : NSObject
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *payID;
@property(nonatomic,strong)NSString *isCod;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *payInterfaceId;
@property(nonatomic,strong)NSString *isOnline;

@end

@interface JXOderSettlementModel : NSObject
@property(nonatomic,strong)NSString *saveCertificate;
@property(nonatomic,strong)NSString *buyerMobile;
//发票信息 和发票弹框
@property(nonatomic,strong)JXOderInvoiceInfoModel *invoiceInfo;
@property(nonatomic,strong)NSArray *ocs;
@property(nonatomic,strong)NSString *depositBalance;
@property(nonatomic,strong)JXOderDeliveryAddressModel *deliveryAddress;
@end
