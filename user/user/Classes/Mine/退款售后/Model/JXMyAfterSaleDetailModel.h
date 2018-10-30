//
//  JXMyAfterSaleDetailModel.h
//  user
//
//  Created by liu_yakai on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JXMyAfterSaleDetailPayRecsListModel : NSObject
//支付钱数
@property(nonatomic,strong)NSString *payMoney;
//支付类型
@property(nonatomic,strong)NSString *payWay;
@end

@interface JXMyAfterSaleDetailProcessFlowModel : NSObject
//订单当前进度
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *pvalue;
@property(nonatomic,strong)NSString *createTime;
@end

@interface JXMyAfterSaleDetailDutyModel : NSObject
//客户申请原因
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *value;
@property(nonatomic,strong)NSString *ID;
@end




@interface JXMyAfterSaleDetailModel : NSObject
//退货单编号
@property(nonatomic,strong)NSString *returnSingleNo;
//问题描述
@property(nonatomic,strong)NSString *problem;
//订单上所属用户ID
@property(nonatomic,strong)NSString *userId;
//支付方式和钱数
@property(nonatomic,strong)NSArray *payRecsList;
//商家名称
@property(nonatomic,strong)NSString *merchantName;
@property(nonatomic,strong)NSArray *processFlow;
//商家ID
@property(nonatomic,strong)NSString *mid;
//是否已退货
@property(nonatomic,strong)NSString *isReturnSingle;
//退款单id
@property(nonatomic,strong)NSString *returnPriceId;
//审批状态
@property(nonatomic,strong)NSString *applyStatus;
//联系人
@property(nonatomic,strong)NSString *contacts;
//客户申请原因
@property(nonatomic,strong)JXMyAfterSaleDetailDutyModel *duty;
//图片数组
@property(nonatomic,strong)NSArray *images;
//联系电话
@property(nonatomic,strong)NSString *mobilePhone;
//审核装填
@property(nonatomic,strong)NSString *applicationStatus;
//订单金额
@property(nonatomic,strong)NSString *totalOrderPayPrice;
//申请单ID
@property(nonatomic,strong)NSString *ID;
//退款单编号
@property(nonatomic,strong)NSString *returnPriceNo;
//地址
@property(nonatomic,strong)NSString *addressInfo;
//平台的id
@property(nonatomic,strong)NSString *merchantId;
//审批时间
@property(nonatomic,strong)NSString *applyTime;
//审核人
@property(nonatomic,strong)NSString *applyUser;
//实退金额
@property(nonatomic,strong)NSString *realAmount;
//申请原因
@property(nonatomic,strong)JXMyAfterSaleDetailDutyModel *reason;
//应退金额
@property(nonatomic,strong)NSString *returnAmount;
//外部订单号
@property(nonatomic,strong)NSString *orderAliasCode;
//申请时间
@property(nonatomic,strong)NSString *createTime;
//是否已退款
@property(nonatomic,strong)NSString *isReturnPrice;
//客服ID(客服创建的申请单)
@property(nonatomic,strong)NSString *createUserId;
//审核留言
@property(nonatomic,strong)NSString *applyMessage;
//售后单号
@property(nonatomic,strong)NSString *orderRefundNo;


@end
