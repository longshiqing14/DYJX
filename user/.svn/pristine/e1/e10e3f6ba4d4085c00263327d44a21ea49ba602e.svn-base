//
//  XYShoppingCartNet.h
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYBestAllNet.h"

@interface XYShoppingCartNet : XYBestAllNet

/**
 *  获取 购物车列表
 */
+ (void)netShoppingCartListblock:(infoBlockNet)block;

/**
 *  添加 购物车
 *  productId  商品 id
 */
+ (void)netCartAddWithProductId:(NSString*)productId
                          block:(infoBlockNet)block;


/**
 *  购物车  删除
 *  items  "items": [{"itemId": "cartItem_50017","cartId": "m_50000_common"}
 */
+ (void)netCartRemoveItemWithitems:(NSArray*)items
                             block:(infoBlockNet)block;

/**
 *  购物车  修改
 *    		"cartId": "m_50000_common",
 *          "itemId":"cartItem_50017",
 *          "toNumber": "33"
 */
+ (void)netCartChangeAmountWithCartId:(NSString*)cartId
                               itemId:(NSString*)itemId
                             toNumber:(NSString*)toNumber
                                block:(infoBlockNet)block;

/**
 *  购物车  数量
 *
 *  "cartType": "common",     购物车 类型
 *  "theMerchantId":"m_50000",   商家ID
 */
+ (void)netCartCountWithCartType:(NSString*)cartType
                   theMerchantId:(NSString*)theMerchantId;

/**
 *  购物车商品  选中 取消
 *  cartId 购物车id
 *  checked 选中t  取消n
 *  itemId
 */
+ (void)netCartCheckItemWithCartId:(NSString*)cartId
                           checked:(NSString*)checked
                            itemId:(NSString*)itemId
                             block:(infoBlockNet)block;

/**
 *  购物车  全选  全部取消
 *  cartType 购物车类型
 *  checked 选中t  取消n
 */
+ (void)netCartCheckAllWithCartType:(NSString*)cartType
                            checked:(NSString*)checked
                              block:(infoBlockNet)block;



/** 切换提货方式 */
+(void)netCartChangeDeliveryWayWithDic:(NSMutableDictionary *)param block:(infoBlockNet)block;


/**
 *  获取 发票 信息
 */
+ (void)netOrderInvoiceListWithBlock:(infoBlockNet)block;


/**
 *  保存 发票 信息
 *  invoiceId       发票 id
 *  needInvoiceKey  是否需要发票  是否需要发票[yes:需要，no:不需要]
 *  invoiceTypeKey  发票类型  [com:普通发票，vat:增值税发票]
 *  invoiceTitleType发票抬头类型 [个人:个人，单位:企业]
 *  invoiceUserName 发票抬头    个人
 *  invoiceTitle    发票抬头    单位
 *  invoiceCertificate  纳税人识别码
 */
+ (void)netOrderUpdateInvoiceWithInvoiceId:(NSString*)invoiceId
                            needInvoiceKey:(NSString*)needInvoiceKey
                            invoiceTypeKey:(NSString*)invoiceTypeKey
                           invoiceUserName:(NSString*)invoiceUserName
                              invoiceTitle:(NSString*)invoiceTitle
                        invoiceCertificate:(NSString*)invoiceCertificate
                               invoiceMail:(NSString*)invoiceMail
                                     block:(infoBlockNet)block;

@end
