//
//  XYOrderDetailGoodsListTVC.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//


typedef NS_ENUM(NSInteger, XYOrderDetailListType) {
    
    XYOrderDetailListType_confirm = 1,              // 提交订单 列表
    XYOrderDetailListType_detail = 2,               // 订单 详情
};


#import <UIKit/UIKit.h>

@protocol XYOrderDetailGoodsListTVCDelegate <NSObject>

@optional

/** 点击商品列表底部 */
- (void)orderConfirmGoodsListSelectFooter;


@end


@interface XYOrderDetailGoodsListTVC : UITableViewController

extern const  CGFloat goodList_cell_height;

@property (nonatomic,weak) id<XYOrderDetailGoodsListTVCDelegate> delegate;

/**  数据类型  */
@property (nonatomic) XYOrderDetailListType type;

/**  是否是展开的 列表  */
@property (nonatomic, assign) BOOL isOpenList;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end
