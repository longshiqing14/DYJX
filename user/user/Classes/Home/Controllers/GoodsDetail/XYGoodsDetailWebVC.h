//
//  XYGoodsDetailWebVC.h
//  user
//
//  Created by xingyun on 2017/9/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestWebVC.h"

@protocol XYGoodsDetailWebVCDelegate <NSObject>

/** 页面跳转 */
- (void)goodsDetailPushGoodsDetailParameterWeb;
/** 底部按钮 调整 */
- (void)goodsDetailBottomButton;

@end


@interface XYGoodsDetailWebVC : XYBestWebVC

extern NSString * const goods_detail_url; //详情 连接

@property (nonatomic, weak) id <XYGoodsDetailWebVCDelegate> goodsDetailDelegate;
//@property(nonatomic,copy)void (^ RollDown)();
@property (nonatomic, copy) NSString * productId;

@end
