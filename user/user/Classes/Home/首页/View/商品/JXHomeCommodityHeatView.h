//
//  JXHomeCommodityHeatView.h
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeCommodityHeatView : UICollectionReusableView
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,copy)void (^ CarouselClockIndex)(NSInteger index);
@property (weak, nonatomic) IBOutlet UILabel *make;
@property(nonatomic,copy)void (^ MoreClock)();
@property (weak, nonatomic) IBOutlet UILabel *heatTitle;
-(void)heat_init:(NSArray *)url CarouselTime:(NSString *)carouselTime;
-(void)heat_initTitle:(HomelCatNameModel *)model;
@end
