//
//  ImageZoomView.m
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ImageZoomView.h"

static CGRect oldframe;
@interface ImageZoomView()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *holderView;
@property (nonatomic, strong)UIImageView *showImgView;
@property (nonatomic, assign)BOOL isFirst;

@end

@implementation ImageZoomView

- (instancetype)initWithFrame:(CGRect)frame andWithImage:(UIImageView *)imageview{
    if(self = [super initWithFrame:frame]){
        UIImage *image=imageview.image;
        _holderView = [[UIScrollView alloc]initWithFrame:frame];
        _holderView.backgroundColor=[UIColor blackColor];
        _holderView.showsHorizontalScrollIndicator = NO; //水平
        _holderView.showsVerticalScrollIndicator = NO; // 竖直
        _holderView.scrollEnabled=YES;
        _holderView.directionalLockEnabled = NO;
        _holderView.bounces=NO;
        _holderView.delegate=self;
        _holderView.autoresizesSubviews=YES;
        _holderView.maximumZoomScale=4;
        _holderView.minimumZoomScale=1;
        [_holderView setZoomScale:0.5 animated:NO];

        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        oldframe = [imageview convertRect:imageview.bounds toView:window];
        [_holderView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]];
        //此时视图不会显示
        [_holderView setAlpha:0];
        //将所展示的imageView重新绘制
        _showImgView = [[UIImageView alloc] initWithFrame:oldframe];
        [_showImgView setImage:imageview.image];
        [_showImgView setTag:0];
        [_holderView addSubview:_showImgView];
        [self addSubview:_holderView];

        //动画放大所展示的ImageView
        [UIView animateWithDuration:0.4 animations:^{
            CGFloat y,width,height;
            y = ([UIScreen mainScreen].bounds.size.height - image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width) * 0.5;
            //宽度为屏幕宽度
            width = [UIScreen mainScreen].bounds.size.width;
            //高度 根据图片宽高比设置
            height = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
            [_showImgView setFrame:CGRectMake(0, y, width, height)];
            //重要！ 将视图显示出来
            [_holderView setAlpha:1];
        } completion:^(BOOL finished) {

        }];


        UITapGestureRecognizer *doubleTapGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
        [_holderView addGestureRecognizer:doubleTapGesture];
        [self addSubview:_holderView];

        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
        [singleTapGestureRecognizer setNumberOfTapsRequired:1];
        [_holderView addGestureRecognizer:singleTapGestureRecognizer];
        [singleTapGestureRecognizer requireGestureRecognizerToFail:doubleTapGesture];

    }
    return self;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;

    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    _showImgView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                     scrollView.contentSize.height * 0.5 + offsetY);
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _showImgView;
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture{
    if(!_isFirst){
        _isFirst=YES;
        CGPoint pointInView = [gesture locationInView:_holderView];
        CGFloat newZoomScale = _holderView.zoomScale * 4.0f;
        newZoomScale = MIN(newZoomScale, _holderView.maximumZoomScale);
        CGSize scrollViewSize =_holderView.bounds.size;
        CGFloat w = scrollViewSize.width / newZoomScale;
        CGFloat h = scrollViewSize.height / newZoomScale;
        CGFloat x = pointInView.x - (w / 2.0f);
        CGFloat y = pointInView.y - (h / 2.0f);
        CGRect rectToZoomTo = CGRectMake(x, y, w, h);
        [_holderView zoomToRect:rectToZoomTo animated:YES];
    }else{
        _isFirst=NO;
        CGFloat newZoomScale = _holderView.zoomScale / 4.0f;
        newZoomScale = MAX(newZoomScale, _holderView.minimumZoomScale);
        [_holderView setZoomScale:newZoomScale animated:YES];
    }

}

- (void)singleTap:(UITapGestureRecognizer*)tap{

    [UIView animateWithDuration:0.4 animations:^{
        [_showImgView setFrame:oldframe];
        [_holderView setAlpha:0];
    } completion:^(BOOL finished) {
        //完成后操作->将背景视图删掉
        [_holderView removeFromSuperview];
        [self removeFromSuperview];
    }];

}

@end
