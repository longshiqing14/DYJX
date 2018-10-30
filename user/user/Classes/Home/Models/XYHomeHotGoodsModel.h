//
//  XYHomeHotGoodsModel.h
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYHomeHotGoodsModel : NSObject


/** 头像 */
@property (nonatomic, copy) NSString * url;
/** 分类 标题 */
@property (nonatomic, copy) NSString * catName;
/** 分类下商品 */
@property (nonatomic, strong) NSMutableArray * products;

@end
