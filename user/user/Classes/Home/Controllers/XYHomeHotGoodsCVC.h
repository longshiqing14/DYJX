//
//  XYHomeHotGoodsCVC.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYHomeHotGoodsCVCDelegate <NSObject>

@optional
/** 点击的商品 id */
- (void)homeHotGoodsSelectProductId:(NSString*)productId;

@end

@interface XYHomeHotGoodsCVC : UICollectionViewController

/** 代理 */
@property (nonatomic, strong) id <XYHomeHotGoodsCVCDelegate> delegate;

/** 数据  */
@property (nonatomic, strong) NSMutableArray * dataSource;

@end
