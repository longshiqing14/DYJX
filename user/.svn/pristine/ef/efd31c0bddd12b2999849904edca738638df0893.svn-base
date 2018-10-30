//
//  XYBestNavigationVC.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestNavigationVC.h"
#import "UIColor+Extension.h"

@interface XYBestNavigationVC () <UIGestureRecognizerDelegate>

@end

@implementation XYBestNavigationVC


+ (void)initialize
{
//    UINavigationBar * navBar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    
    //   设置导航栏背景图
//    [navBar setBackgroundImage:[XYWhiteColor imageWithColor] forBarMetrics:UIBarMetricsDefault];
////
//    // 设置 导航栏 字体大小  字体颜色
//    navBar.titleTextAttributes = @{NSFontAttributeName: XYFont_16,
//                                   NSForegroundColorAttributeName: XYBlackColor};
    
    //去掉导航下面的线
    
    [[UINavigationBar appearance] setBackgroundImage:[XYWhiteColor imageWithColor] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: XYFont_16,
                                                           NSForegroundColorAttributeName: XYBlackColor}];
    [[UINavigationBar appearance] setTintColor:XYBlackColor];
    [[UINavigationBar appearance] setBarTintColor:XYBlackColor];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
//      self.interactivePopGestureRecognizer.delegate = (id)self;
    //
//    id target = self.interactivePopGestureRecognizer.delegate;
//    //
//    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
//    //  获取添加系统边缘触发手势的View
//    UIView *targetView = self.interactivePopGestureRecognizer.view;
//    
//    //  创建pan手势 作用范围是全屏
//    UIPanGestureRecognizer * fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
//    fullScreenGes.delegate = self;
//    [targetView addGestureRecognizer:fullScreenGes];
//    
//    // 关闭边缘触发手势 防止和原有边缘手势冲突
//    [self.interactivePopGestureRecognizer setEnabled:NO];
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        //设置按钮图片
//        [button setImage:[UIImage imageNamed:@"nav_btn_goback"] forState:UIControlStateNormal];
//        button.frame = CGRectMake(0, 0, 16, 28);
//        // 让按钮的内容往左边偏移10
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
//        [button addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_btn_goback"]  style:(UIBarButtonItemStylePlain) target:self action:@selector(backView)]; viewController.navigationItem.leftBarButtonItem = item;
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)backView
{
 
    [self popViewControllerAnimated:YES];
}


#pragma mark - UIGestureRecognizerDelegate
//  防止导航控制器只有一个rootViewcontroller时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count == 1 ? NO : YES;
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
