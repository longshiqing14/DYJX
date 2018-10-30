//
//  JXHomeCommodityHeatView.m
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeCommodityHeatView.h"

@interface JXHomeCommodityHeatView ()<SDCycleScrollViewDelegate>
@end

@implementation JXHomeCommodityHeatView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
    //    //         --- 模拟加载延迟
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    ////        cycleScrollView.imageURLStringsGroup = urlArray;
    //    });
        [self addSubview:self.cycleScrollView];
    
}

-(SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, XYScreenW, self.frame.size.height-45) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        //    [_cycleScrollView reat:5];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        //    cycleScrollView2.titlesGroup = titles;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    }
    return _cycleScrollView;
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



-(void)heat_initTitle:(HomelCatNameModel *)model{
    self.heatTitle.text=model.content;
}

-(void)heat_init:(NSArray *)url CarouselTime:(NSString *)carouselTime{
    [self.make reat:2];
    NSMutableArray *urlArray=[[NSMutableArray alloc]init];
    for (HomelRotateaModel *model in url) {
        [urlArray addObject:model.imgUrl];
    }
    if (urlArray.count>0) {
        self.cycleScrollView.imageURLStringsGroup=urlArray;
    }
    if(carouselTime){
        self.cycleScrollView.autoScrollTimeInterval=[carouselTime floatValue];
    }else{
        self.cycleScrollView.autoScrollTimeInterval=4;
    }
    
}

- (IBAction)clockMore:(id)sender {
    if (self.MoreClock) {
        self.MoreClock();
    }
}

@end
