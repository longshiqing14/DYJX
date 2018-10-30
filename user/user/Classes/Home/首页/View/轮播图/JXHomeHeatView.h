//
//  JXHomeHeatView.h
//  user
//  轮播图
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeHeatView : UICollectionReusableView
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,copy)void (^ CarouselClockIndex)(NSInteger index);
-(void)heat_init:(NSArray *)url CarouselTime:(NSString *)carouselTime;
@end
