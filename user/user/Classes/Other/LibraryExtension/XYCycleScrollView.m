//
//  XYCycleScrollView.m
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYCycleScrollView.h"

#import "SDCycleScrollView.h"

#import "XYCycleScrollViewNet.h"

@interface XYCycleScrollView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView * cycleScrollView;

@end

@implementation XYCycleScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYWhiteColor;
    
    [self addViewAndLayout];
    
    [self netHomeBannerList];
    
}

- (void)addViewAndLayout
{
    
//    NSArray * imageNames = @[@"",@"",@""];
//    
//    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, XYScreenW, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
//    _cycleScrollView.delegate = self;
//    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//    [self.view addSubview:_cycleScrollView];
//    _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, XYScreenW, 130) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.currentPageDotColor = XYWhiteColor; // 自定义分页控件小圆标颜色
    [self.view addSubview:_cycleScrollView];
    
    
    [_cycleScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
    }];
    
}

- (void)setImageArray:(NSMutableArray *)imageArray
{
    
//    _cycleScrollView.titlesGroup = titles;
//    _cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
    
    
    
}

#pragma mark - data

/** 获取 首页 banners */
- (void)netHomeBannerList
{
    WeakSelf;
    [XYCycleScrollViewNet netHomeBannerListblock:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            XYLog(@" banners  %@",blockDictionary);
            if (![blockDictionary isKindOfClass:[NSDictionary class]]) {
                return ;
            }
            
            if ([blockDictionary objectForKey:@"banners"] == nil) {
                return;
            }
            
            if ([[blockDictionary objectForKey:@"banners"] isKindOfClass:[NSArray class]]) {
                
                [weakSelf.imageArray addObjectsFromArray:[blockDictionary objectForKey:@"banners"]];
                weakSelf.cycleScrollView.imageURLStringsGroup = [weakSelf.imageArray copy];
            }
            
        }
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
