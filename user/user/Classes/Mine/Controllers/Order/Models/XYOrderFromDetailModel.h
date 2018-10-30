//
//  XYOrderFromDetailModel.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "XYCartDeliveryWayModel.h"

@class XYAddressListModel;
@class XYOrderFromDetailInvoiceInfoModel;




@interface XYOrderFromDetailModel : NSObject


/** 发票信息 */
@property (nonatomic, strong) XYOrderFromDetailInvoiceInfoModel * invoiceInfo;

/** 地址  */
@property (nonatomic, strong) XYAddressListModel * deliveryAddress;

/** 余额  */
@property (nonatomic, copy) NSString * depositBalance;

/** 购买者电话  */
@property (nonatomic, copy) NSString * buyerMobile;

/**   */
//@property (nonatomic, strong) NSArray * ocs;

/**   */
@property (nonatomic, copy) NSString * saveCertificate;



@end


/** 发票信息 */
@interface XYOrderFromDetailInvoiceInfoModel : NSObject


/**   */
@property (nonatomic, copy) NSString * invoiceContent;
/** 发票抬头[当invoiceTitleType值为个人时候的发票抬头] */
@property (nonatomic, copy) NSString * invoiceUserName;
/** com:普通发票，vat:增值税发票 */
@property (nonatomic, copy) NSString * invoiceTypeKey;
/** 发票抬头类型[个人:个人，单位:企业]  */
@property (nonatomic, copy) NSString * invoiceTitleType;
/** 发票ID(当id不为空则表示修改发票信息，否则就新增发票信息) */
@property (nonatomic, copy) NSString * invoice_id;
//发票信息 id  原字段为 id

//是否开发票点击
@property (nonatomic, copy) NSString * displayInvoiceKey;

/**  */
@property (nonatomic, copy) NSString * taxCode;
/** 发票抬头[当invoiceTitleType值为单位时候的单位名称] */
@property (nonatomic, copy) NSString * invoiceTitle;
/** 纳税人识别号[当invoiceTitleType值为单位的时候有用] */
@property (nonatomic, copy) NSString * invoiceCertificate;
/** 是否需要发票[yes:需要，no:不需要] */
@property (nonatomic, copy) NSString * needInvoiceKey;
/** 接受发票的邮箱 */
@property (nonatomic, copy) NSString * invoiceMail;

//发票提示
@property(nonatomic,strong)NSString *invoiceDesc;

//"invoiceContent": "null",
//"invoiceUserName": "null",
//"invoiceTypeKey": "com",
//"invoiceTitleType": "单位",
//"id": "invoice_80001",
//"taxCode": "undefined",
//"invoiceTitle": "IE2",
//"invoiceCertificate": "7272627"


@end

//积分
@interface JXIntegralTitleModel : NSObject
//是标题
@property(nonatomic,strong)NSString *title;
//积分规则
@property(nonatomic,strong)NSArray *desc;

@end



//积分
@interface JXIntegralModel : NSObject
//是否开关
@property(nonatomic,strong)NSString *integralShow;
//积分数
@property(nonatomic,strong)NSString *integralBalance;

@property(nonatomic,strong)NSString *totalPayPrice;
//是否显示
@property(nonatomic,strong)NSString *integralDisplay;
//积分抵扣多少钱
@property(nonatomic,strong)NSString *integralPrice;
//积分说明
@property(nonatomic,strong)NSArray *integralDesc;
@end


/***************************************************/


@class XYOrderFromDetailDeliveryPointInfoModel;

/** ocs  */
@interface XYOrderFromDetailocsModel : NSObject
//订单结算页提示字段
@property(nonatomic,strong)NSString *deliveryRuleTips;

@property(nonatomic,strong)NSString *totalCanUseCardSize;
@property(nonatomic,strong)JXIntegralModel *integral;

//是否打开积分使用
@property(nonatomic,strong)NSString *isAvailableIntegral;
/** 邮费  */
@property (nonatomic, copy) NSString * totalDeliveryFee;
/** 购物车 id */
@property (nonatomic, copy) NSString * cartId;
/**  */
//@property (nonatomic, copy) NSString * description;
/** 选的收货方式id */
@property (nonatomic, copy) NSString * selectedDeliveryRuleId;
/** 选择的配送方式 */
@property(copy,nonatomic) NSString *selectedDeliveryRuleName ;
/** 订单 产品 总价 */
@property (nonatomic, copy) NSString * totalOrderProductPrice;
/** 商户 名 */
@property (nonatomic, copy) NSString * merchantName;
/** 支付 总价 */
@property (nonatomic, copy) NSString * totalPayPrice;
//优惠总金额  内购优惠金额
@property(nonatomic,strong)NSString *totalOrderDiscount;

/** 订单 用券金额 */
@property (nonatomic, copy) NSString * totalUsedCardAmount;
/** 订单 用券张数 */
@property (nonatomic, copy) NSString * totalUsedCardSize;


/** 商品 列表 */
@property (nonatomic, strong) NSMutableArray * buyItems;
/** 收货方式数组 */
@property (nonatomic, strong) NSMutableArray * availableDeliveryRuleResults;
/** 支付方式 数组 */
@property (nonatomic, strong) NSMutableArray * paymentList;
/** 交货点 信息 */
@property (nonatomic, strong) XYOrderFromDetailDeliveryPointInfoModel * deliveryPointInfo;


//"availableDeliveryRuleResults": [],
//"totalDeliveryFee": 0,
//"cartId": "m_50000_common",
//"description": "",
//"selectedDeliveryRuleId": "",
//"buyItems": [],
//"totalOrderProductPrice": "138.00",
//"deliveryPointInfo": {},
//"merchantName": "东莞运营中心",
//"paymentList": [],
//"totalPayPrice": "138.00"

@end

/** 收货方式数组 */
@interface XYOrderFromDetailAvailableDeliveryRuleResultsModel : NSObject

@property(copy,nonatomic) NSString *name ;
/**  */
@property(copy,nonatomic) NSNumber *supportDP;

//@property(strong,nonatomic) NSString *DEScription;
/**  */
@property(copy,nonatomic) NSNumber *remark;
/**  */
@property(copy,nonatomic) NSNumber *totalPrice;
/** id */
@property(copy,nonatomic) NSString * deliveryRule_id;

@end


/** 支付方式 数组 */
@interface XYOrderFromDetailPaymentListModel : NSObject


/**  */
@property (nonatomic, assign) BOOL isCod;
/**  */
@property (nonatomic, copy) NSString * name;
/** 是否是在线 */
@property (nonatomic, assign) BOOL isOnline;
/**  */
@property (nonatomic, copy) NSString * pay_id;   //支付信息   原字段为 id
/**  */
@property (nonatomic, copy) NSString * desc;

//"isCod": false,
//"name": "在线支付",
//"isOnline": true,
//"id": "mpay_50003",
//"desc": "即时到帐，支持绝大数银行借记卡及部分银行信用卡"

@end

/** 交货点 信息 */
@interface XYOrderFromDetailDeliveryPointInfoModel : NSObject

/**  */
@property (nonatomic, copy) NSString * address;
/**  */
@property (nonatomic, copy) NSString * name;
/**  */
@property (nonatomic, copy) NSString * mobile;
/**  */
@property (nonatomic, copy) NSString * delivery_id;   //送货点  原字段为 id

//"address": "",
//"name": "",
//"mobile": "",
//"id": ""

@end






