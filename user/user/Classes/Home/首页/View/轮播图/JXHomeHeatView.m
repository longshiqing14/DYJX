//
//  JXHomeHeatView.m
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeHeatView.h"

@interface JXHomeHeatView ()<SDCycleScrollViewDelegate>

@end

@implementation JXHomeHeatView

- (void)awakeFromNib {
    [super awakeFromNib];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"default_ad_Image"]];
    
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //    cycleScrollView2.titlesGroup = titles;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    
    
    //    //         --- 模拟加载延迟
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    ////        cycleScrollView.imageURLStringsGroup = urlArray;
    //    });
    [self addSubview:_cycleScrollView];
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - SDCycleScrollViewDelegate
//点击滚动图触发的的代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    if (self.CarouselClockIndex) {
        self.CarouselClockIndex(index);
    }
    
}

-(void)heat_init:(NSArray *)url CarouselTime:(NSString *)carouselTime{
    if (url.count>0) {
        self.cycleScrollView.imageURLStringsGroup=url;
    }
    NSLog(@"%@",carouselTime);
    if(carouselTime){
        self.cycleScrollView.autoScrollTimeInterval=[carouselTime floatValue];
    }else{
        self.cycleScrollView.autoScrollTimeInterval=4;
    }
}

@end
