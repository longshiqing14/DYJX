//
//  JXMyOrderDetailsModel.h
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

//订单状态
@interface JXMyProcessStateInfoModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *state;
@end

//发票信息
@interface JXMyInvoiceInfoModel : NSObject
//纳税人识别号
@property(nonatomic,strong)NSString *invoiceCertificate;
@property(nonatomic,strong)NSString *invoiceContent;
@property(nonatomic,strong)NSString *needInvoiceKey;
//1位单位
@property(nonatomic,strong)NSString *invoiceTitleType;
//个人 企业
@property(nonatomic,strong)NSString *invoiceTitleTypeName;
//发票url
@property(nonatomic,strong)NSString *invoiceURL;
//发票邮箱
@property(nonatomic,strong)NSString *invoiceMail;
//发票金额
@property(nonatomic,strong)NSString *invoicePrice;
//发票抬头
@property(nonatomic,strong)NSString *invoiceTitle;

@end

//地址信息 联系人 电话
@interface JXMyBuyerInfoModel : NSObject
//地址
@property(nonatomic,strong)NSString *address;
//电话
@property(nonatomic,strong)NSString *mobile;
//名字
@property(nonatomic,strong)NSString *userName;
@end

//商品
@interface JXMyItemsModel : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *marketUnitPrice;
@property(nonatomic,strong)NSString *unitPrice;
//商品id
@property(nonatomic,strong)NSString *goodsID;
@property(nonatomic,strong)NSString *originUnitPrice;
@property(nonatomic,strong)NSString *totalPrice;
@property(nonatomic,strong)NSString *unitDiscountedPrice;
@property(nonatomic,strong)NSString *itemDiscount;
//商品名字
@property(nonatomic,strong)NSString *name;
//商品图片
@property(nonatomic,strong)NSString *logo;
@end

//商家信息
@interface JXMySellerInfoModel : NSObject
@property(nonatomic,strong)NSString *merchantId;
//商家电话
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *merchantName;
@end

//自提地址  送货地址
@interface JXMyDeliveryPointInfoModel : NSObject
@property(nonatomic,strong)NSString *contact;
//自提点电话
@property(nonatomic,strong)NSString *mobile;
//自提点地址
@property(nonatomic,strong)NSString *address;
//自提点名字
@property(nonatomic,strong)NSString *name;
@end

@interface JXMyOrdersModel : NSObject
//是否为退货单
@property(nonatomic,strong)NSString *isOrderRefund;
//退货状态
@property(nonatomic,strong)NSString *applyStatus;
//订单备注
@property(nonatomic,strong)NSString *orderNotes;
//发票信息
@property(nonatomic,strong)JXMyInvoiceInfoModel *invoiceInfo;
@property(nonatomic,strong)NSString *deliveryPrice;
//订单状态
@property(nonatomic,strong)JXMyProcessStateInfoModel *processStateInfo;
//售后单号
@property(nonatomic,strong)NSString *renudId;
//剩余应付
@property(nonatomic,strong)NSString *totalOrderNeedPayPrice;
@property(nonatomic,strong)NSString *isDeliveryPointName;
//地址信息 联系人 电话
@property(nonatomic,strong)JXMyBuyerInfoModel *buyerInfo;
//商品数组
@property(nonatomic,strong)NSArray *items;
//
@property(nonatomic,strong)NSString *orderProductLevelDiscountAmount;
@property(nonatomic,strong)NSString *totalOrderDiscount;
//商家信息
@property(nonatomic,strong)JXMySellerInfoModel *sellerInfo;
//自提地址  送货地址
@property(nonatomic,strong)JXMyDeliveryPointInfoModel *deliveryPointInfo;
//优惠券 多少钱
@property(nonatomic,strong)NSString *totalCardPayPrice;
@property(nonatomic,strong)NSString *isDeliveryPoint;
//支付方式
@property(nonatomic,strong)NSArray *payRecs;
//订单号
@property(nonatomic,strong)NSString *aliasCode;
@property(nonatomic,strong)NSString *deliveryPreferPrice;
@property(nonatomic,strong)NSString *integralDiscount;
@property(nonatomic,strong)NSString *totalOrderPrice;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *totalProductPrice;
//下单时间
@property(nonatomic,strong)NSString *formatCreateTime;
//配送方式
@property(nonatomic,strong)NSString *deliveryRuleName;
//支付方式
@property(nonatomic,strong)NSString *paymentName;

@end

//支付方式
@interface JXMyPayRecsModel : NSObject
//支付方式价格
@property(nonatomic,strong)NSString *price;
//支付方式名字
@property(nonatomic,strong)NSString *name;
//支付方式类型
@property(nonatomic,strong)NSString *paymentTypeID;
@end


@interface JXMyOrderDetailsModel : NSObject
//支付类型数组
@property(nonatomic,strong)NSArray *paymentArr;
@property(nonatomic,strong)JXMyOrdersModel *order;
@end
