//
//  XYGoodsDetailBottomVC.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYGoodsDetailBottomVC : UIViewController

/** 商品 id */
@property (nonatomic, copy) NSString * productId;

extern const  CGFloat goodsDetail_buttom_height;

/** 显示 售罄 */
- (void)showSellOutLB;
@end
