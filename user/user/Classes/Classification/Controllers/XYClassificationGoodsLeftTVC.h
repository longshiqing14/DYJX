//
//  XYClassificationGoodsLeftTVC.h
//  user
//
//  Created by xingyun on 2017/11/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYClassificationModel;

@protocol XYClassificationGoodsLeftDelegate <NSObject>

/** 点击 分类刷新数据 */
- (void)classificationGoodsLeftSelectdataList:(NSMutableArray*)rightList;

@end

@interface XYClassificationGoodsLeftTVC : UITableViewController

/** 代理 */
@property (nonatomic, weak) id<XYClassificationGoodsLeftDelegate> delegate;

/** 数据 */
@property (nonatomic, strong) NSMutableArray <XYClassificationModel*>* dataSource;

@end
