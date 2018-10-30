//
//  XYGoodsSearchResultNet.h
//  user
//
//  Created by xingyun on 2017/10/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestAllNet.h"

@interface XYGoodsSearchResultNet : XYBestAllNet


/**
 *  根据条形码搜索 商品
 *  barcode 条形码
 */
+ (void)netSelectCommuityWithBarcode:(NSString*)barcode
                               block:(infoBlockNet)block;


@end
