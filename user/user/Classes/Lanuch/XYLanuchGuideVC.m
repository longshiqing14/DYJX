//
//  XYLanuchGuideVC.m
//  user
//
//  Created by xingyun on 2017/10/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYLanuchGuideVC.h"
#import "XYTabbarController.h"
#import "XYLoginVC.h"
@interface XYLanuchGuideVC ()<UIScrollViewDelegate>
/** 图片数组 */
@property(nonatomic,strong) NSMutableArray *dataArr;

/** 图片滑动视图 */
@property(strong,nonatomic) UIScrollView *imgScrollView ;
/** 下一页 */
@property(strong,nonatomic) UIButton *nextPageBtn ;

/** 当前页码 */
@property(assign,nonatomic) NSInteger currentPage ;
/** 底层图 */
@property(strong,nonatomic) UIView *bottomView ;


@end
static NSString *const FIRSTLANUCH = @"FIRSTLANUCH";
//static CGFloat const cornerRadius = 35/2.0;

static CGFloat const dotHeight = 8.0;
@implementation XYLanuchGuideVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    [ud setObject:version forKey:@"version"];
    [ud synchronize];
    
    self.imgScrollView.frame = [UIScreen mainScreen].bounds;
    for (NSInteger i=0; i<self.dataArr.count; i++) {
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        imgV.layer.masksToBounds = YES;
        imgV.tag = i;
        [imgV setImage:[UIImage imageWithContentsOfFile:self.dataArr[i]]];
        imgV.frame = CGRectMake(0+i*XYScreenW, 0, XYScreenW, XYScreenH);
        [self.imgScrollView addSubview:imgV];
        imgV.userInteractionEnabled = YES;
        if (i== self.dataArr.count - 1) {
            self.nextPageBtn.frame = CGRectMake(XYScreenW/2 - 70, XYScreenH - 60, 140, 35);
            [imgV addSubview:self.nextPageBtn];
           
        }
        
    }
    
    self.imgScrollView.contentSize = CGSizeMake(XYScreenW*self.dataArr.count, XYScreenH);
    
    
    [self.view addSubview:self.bottomView];
    self.bottomView.frame = CGRectMake(0, XYScreenH - 90- dotHeight, XYScreenW, 50+dotHeight);
    
    
    CGFloat animateWidth = dotHeight+5 +(self.dataArr.count-1)*18;
    
    CGFloat animatX = (XYScreenW- animateWidth)/2;
    for (NSInteger j=0; j<self.dataArr.count; j++) {
        if (j == 0) {
        
            UIView *gdView = [self goldView];
            gdView.frame = CGRectMake(animatX, 25, dotHeight, dotHeight);
            gdView.tag = j;
            [self.bottomView addSubview:gdView];
            
        }else if (j == self.dataArr.count-1){
            
            UIImageView * lastView = [self lastView];
            lastView.frame = CGRectMake(animatX+dotHeight+j*10+(j-1)*dotHeight, 25, dotHeight, dotHeight);
            lastView.tag = j;
            [self.bottomView addSubview:lastView];
        }else {
            
            UIView *dotView = [self dotView];
            dotView.tag = j;
            dotView.frame = CGRectMake(animatX+dotHeight+j*10+(j-1)*dotHeight, 25, dotHeight, dotHeight);
            [self.bottomView addSubview:dotView];
        
        }
    }
}


-(UIView *)goldView{

    UIView *goldView = [[UIView alloc] init];
//    goldView.backgroundColor = XYNavMainColor;
    goldView.layer.cornerRadius = dotHeight/2;
    goldView.layer.masksToBounds = YES;
    goldView.backgroundColor=XYRGBAColor(218, 180, 133, 1);
    return goldView;

}


-(UIView *)dotView{

    UIView *dotView = [[UIView alloc] init];
//    dotView.backgroundColor = XYGlobalBg;
    dotView.layer.cornerRadius = dotHeight/2;
    dotView.layer.masksToBounds = YES;
    dotView.backgroundColor = XYRGBAColor(231, 223, 207, 1);
    return dotView;
    
}

-(UIImageView *)lastView{
    
    UIImageView *dotView = [[UIImageView alloc] init];
    dotView.image = [UIImage imageNamed:@"feature_page_right"];
    dotView.contentMode = UIViewContentModeCenter;
    
    return dotView;
    
}



-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        NSString *file1 = [[NSBundle mainBundle] pathForResource:@"new_feature_1" ofType:@"png"];
        NSString *file2 = [[NSBundle mainBundle] pathForResource:@"new_feature_2" ofType:@"png"];
        NSString *file3 = [[NSBundle mainBundle] pathForResource:@"new_feature_3" ofType:@"png"];
        [_dataArr addObject:file1];
        [_dataArr addObject:file2];
        [_dataArr addObject:file3];
    }

    return _dataArr;
}

-(UIScrollView *)imgScrollView
{
    if (!_imgScrollView) {
        _imgScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_imgScrollView];
        _imgScrollView.delegate = self;
        _imgScrollView.showsVerticalScrollIndicator = NO;
        _imgScrollView.showsHorizontalScrollIndicator = NO;
        _imgScrollView.pagingEnabled = YES;
        
    }
    return _imgScrollView;

}


-(UIButton *)nextPageBtn
{
    if (!_nextPageBtn) {
        _nextPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
//        _nextPageBtn.layer.cornerRadius = cornerRadius;
//        _nextPageBtn.layer.borderColor = XYMainColor.CGColor;
//        _nextPageBtn.layer.borderWidth = 0.5;
//        _nextPageBtn.layer.masksToBounds = YES;
        
//        _nextPageBtn.titleLabel.font = XYFont_15;
        _nextPageBtn.enabled = YES;
        [_nextPageBtn addTarget:self action:@selector(clickNextPageBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [_nextPageBtn setTitle:@"立即体验" forState:UIControlStateNormal];
//        [_nextPageBtn setTitleColor:XYMainColor forState:UIControlStateNormal];
        
        [_nextPageBtn setImage:[UIImage imageNamed:@"feature_button"] forState:UIControlStateNormal];
        
    }
    return _nextPageBtn;

}


-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor clearColor];
    }
    return _bottomView;
}

//点击进入主页面
-(void)clickNextPageBtn:(UIButton *)sender{

    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if ([XYUserDefaults readUserDefaultsRegistered].count != 0) {
//        window.rootViewController = [[XYTabbarController alloc] init];
//    }else{
//        window.rootViewController = [[XYLoginVC alloc]init];
//    }
    
    XYKeyWindow.rootViewController = [[XYTabbarController alloc] init];
    

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    self.currentPage = scrollView.contentOffset.x/XYScreenW;

    [self animationWithPage:self.currentPage];
}

-(void)animationWithPage:(NSInteger)page{


    
    if (page == self.dataArr.count -1) {
        
        self.bottomView.hidden = YES;
        return;
    }else
    {
        self.bottomView.hidden = NO;
    }
    
    for (UIView *dotView in self.bottomView.subviews) {
        
        if (page == 0) {
            
            [UIView animateWithDuration:0.3 animations:^{
                dotView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
            
        }else
        {
//             dotView.transform = CGAffineTransformIdentity;
            [UIView animateWithDuration:0.3 animations:^{
                if (dotView.tag == 0) {
                    
                    dotView.transform = CGAffineTransformMakeTranslation(page *18, 0);
                    
                }else
                {
                    
                    
                    if (dotView.tag <= page) {
                        dotView.transform = CGAffineTransformMakeTranslation(-18, 0);
                        
                    }else
                    {
                        dotView.transform = CGAffineTransformMakeTranslation(0, 0);
                    }
                    
                }
                
                
            } completion:^(BOOL finished) {
                
            }];
           
        }
        
       
        
    }

    
    
}



@end
