//
//  XYCommentListModel.h
//  user
//
//  Created by xingyun on 2017/9/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCommentListModel : NSObject
/** 可评价商品数量 */
@property(copy,nonatomic) NSNumber *canAppraiseAmount ;

/** 不可评价商品数量*/
@property(copy,nonatomic) NSNumber *canNotAppraiseAmount ;
/** 商品列表*/
@property(strong,nonatomic) NSArray *productList ;

@end



@interface XYCommentProductListModel : NSObject

/**图片 */
@property(copy,nonatomic) NSString *logo ;
/** 名称 */
@property(copy,nonatomic) NSString *name ;
/** 订单号*/
@property(copy,nonatomic) NSString *orderAliasCode ;
/**订单内部Id，后续增加评论的时候需要传入此参数*/
@property(copy,nonatomic) NSString *orderId ;
/**产品ID*/
@property(copy,nonatomic) NSString *productId ;
/** skuId, 非多规格商品可以不传*/
@property(copy,nonatomic) NSString *skuId ;
/**0：不能评价，1：能评价*/
@property(copy,nonatomic) NSNumber *isCanComment ;
/** 0：不能追加评价，1：能追加评价 */
@property(copy,nonatomic) NSNumber *isCanCommentTo ;
/** 原评价id */
@property(copy,nonatomic) NSString *apprId ;
/** 评价状态 1是正常  */
@property(copy,nonatomic) NSNumber *certifyState ;

@end

@interface JXProductIdModel : NSObject
@property(nonatomic,strong)NSString * productId;
@property(nonatomic,strong)NSString * partnerId;
@property(nonatomic,strong)NSString * cityId;
@property(nonatomic,strong)NSString * cityName;
@property(nonatomic,strong)NSString * merchantId;

@end

