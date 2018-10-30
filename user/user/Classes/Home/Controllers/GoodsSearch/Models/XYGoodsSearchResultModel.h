//
//  XYGoodsSearchResultModel.h
//  user
//
//  Created by xingyun on 2017/10/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYGoodsSearchResultModel : NSObject

/** 商品 id */
@property (nonatomic, copy) NSString * productId;
/** 商品图 */
@property (nonatomic, copy) NSString * logo;

/** 商品价格 */
@property (nonatomic, copy) NSString * memberPrice;
/** 标题 */
@property (nonatomic, copy) NSString * title;


@end
