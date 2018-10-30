//
//  XYPreDepositSelectCVC.h
//  user
//
//  Created by xingyun on 2017/9/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYPreDepositSelectCVCDelegate <NSObject>

/** 获取 数据后 更新 界面  */
- (void)updateTableViewReloadData;

@end


@interface XYPreDepositSelectCVC : UICollectionViewController

/** cell 高度 */
extern const  CGFloat preDeposit_CVCell_height;


@property (nonatomic, weak) id<XYPreDepositSelectCVCDelegate> delegate;

/** 选择的 商品 套餐id */
@property (nonatomic, copy) NSString * productId;


//   Y:套餐商品列表,N:预存款充值列表
@property (nonatomic, copy) NSString * isProductList;

//
@property(nonatomic,copy)void (^ GetDataSource)(NSArray *playDataSource);


/**  高度  */
- (CGFloat)updateDepositSelectCVCHeight;


@end
