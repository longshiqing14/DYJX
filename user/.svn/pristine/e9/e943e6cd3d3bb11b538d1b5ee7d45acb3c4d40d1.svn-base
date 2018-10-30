//
//  UITableView+WLEmptyPlaceHolder.h
//  WLPlaceHolder
//
//  Created by 王林 on 16/5/11.
//  Copyright © 2016年 com.ptj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XYTableViewEmptyType) {
    
    XYTableViewEmptyType_no_cart = 1,                   // 购物车 没有商品
    XYTableViewEmptyType_no_net = 2,                    // 没有网络
    XYTableViewEmptyType_no_search = 3,                 // 没有搜索结果
    XYTableViewEmptyType_no_order = 4,                  // 没有订单
    XYTableViewEmptyType_no_boardband = 5              //没有续约记录
};


@interface UITableView (WLEmptyPlaceHolder)

//添加一个方法
- (void) tableViewDisplayMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void) tableViewWillDisplayNeccessaryView:(UIView *) view;



- (void)tableViewDisPlayType:(XYTableViewEmptyType)type ifNecessaryForRowCount:(NSUInteger)rowCount target:(id)target buttonAction:(SEL)buttonAction;



@end
