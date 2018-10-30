//
//  XYCycleScrollView.h
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XYCycleScrollViewDelegate <NSObject>

/** 点击的 轮播图 */
- (void)XYCycleScrollViewSelectAtIndex:(NSInteger)index;


@end



@interface XYCycleScrollView : UIViewController

@property (nonatomic, weak) id<XYCycleScrollViewDelegate> delegate;

/** 轮播图片 数组 */
@property (nonatomic, strong) NSMutableArray * imageArray;



@end
