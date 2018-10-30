//
//  XYShoppingCartBottomVC.h
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYShoppingCartTotalModel;


@protocol XYShoppingCartBottomDelegate <NSObject>

/** 全选   取消全选 */
- (void)cartBottomCheckAllwithCheck:(NSString*)check;

/** 删除 选择的商品  */
- (void)cartBottomRemove;

/** 跳转到 订单确认页 */
- (void)cartBottomPushOrderConfirmOrderVC;

@end


@interface XYShoppingCartBottomVC : UIViewController

/** view  高度 */
extern const  CGFloat ShoppingCart_Bottom_height;

/** Cart Bottom 是否是编辑状态 */
@property (nonatomic, assign) BOOL  isCartBottomEdit;

/** 选择按钮 */
@property (strong,nonatomic ) UIButton   * selectBT;

/** 结算 编辑 按钮 */
@property (strong,nonatomic ) UIButton   * settlementBT;


@property (nonatomic, weak) id<XYShoppingCartBottomDelegate> delegate;


@property (nonatomic, strong) XYShoppingCartTotalModel * totalModel;

@end
