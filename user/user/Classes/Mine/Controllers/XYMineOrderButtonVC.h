//
//  XYMineOrderButtonVC.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYMineOrderButtonVCDelegate <NSObject>
@optional
-(void)needFatherVCRefreshData;

@end

@interface XYMineOrderButtonVC : UIViewController

extern const  CGFloat order_button_height;

@property(assign,nonatomic) id<XYMineOrderButtonVCDelegate> delegate ;

/** 刷新角标 */
- (void)netOrderCountData;

@end
