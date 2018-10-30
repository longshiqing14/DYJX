//
//  XYTabbarController.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYTabbarController.h"

#import "XYBestNavigationVC.h"

#import "XYHomeVC.h"
#import "XYClassificationVC.h"
#import "XYFindVC.h"
#import "XYShoppingCartVC.h"
#import "XYMineVC.h"
#import "UITabBar+Badge.h"
#import "XYFindMainVC.h"
#import "JXActivityPage.h"
#import "HomeBaseViewController.h"
#import "JXClassificationByWebVC.h"
#import "JXClassificationFoldPage.h"








//购物车
#import "JXShoppingCartViewController.h"
@interface XYTabbarController ()

@end

@implementation XYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance];
    
    [XYTabbarController setTabBarItemsTitleColor];
    
//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, 49)];
//    backView.backgroundColor = XYNavMainColor;
//    [self.tabBar insertSubview:backView atIndex:0];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    //    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //这个字符串是你要跳转面板的名字
//    UIViewController *main =[board instantiateViewControllerWithIdentifier:@"JXHomeID"];
    // 添加子控制器
    [self setupChildVC:[[HomeBaseViewController alloc]init] title:@"首页" image:@"tabbar_home_n" selectedImage:@"tabbar_home_s"];
    
//    [self setupChildVC:[[XYClassificationVC alloc] init] title:@"分类" image:@"tabbar_cata_n" selectedImage:@"tabbar_cata_s"];
    
    //webview
//    [self setupChildVC:[[JXClassificationByWebVC alloc] init] title:@"分类" image:@"tabbar_cata_n" selectedImage:@"tabbar_cata_s"];
    //原生
    [self setupChildVC:[[JXClassificationFoldPage alloc] init] title:@"分类" image:@"tabbar_cata_n" selectedImage:@"tabbar_cata_s"];


    

//    [self setupChildVC:[[JXActivityPage alloc] init] title:@"活动" image:@"tabbar_activity_n" selectedImage:@"tabbar_activity_s"];
    
    [self setupChildVC:[[XYShoppingCartVC alloc] init] title:@"购物车" image:@"tabbar_buy_n" selectedImage:@"tabbar_buy_s"];
//    [self setupChildVC:[[JXShoppingCartViewController alloc] init] title:@"购物车" image:@"tabbar_buy_n" selectedImage:@"tabbar_buy_s"];
    
    [self setupChildVC:[[XYMineVC alloc] init] title:@"我的" image:@"tabbar_info_n" selectedImage:@"tabbar_info_s"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItemsBadge:) name:XY_notification_ItemsBadge object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XY_notification_ItemsBadge object:nil];
}


/**
 * 初始化子控制器
 */
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [self readingImage:image];
    vc.tabBarItem.selectedImage = [self readingImage:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    XYBestNavigationVC *nav = [[XYBestNavigationVC alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

/**
 *  始终绘制图片原始状态，不使用Tint Color
 */
- (UIImage *)readingImage:(NSString *)str
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", str]];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

/** 设置首页UITabBarItem的文字属性 */
+ (void)setTabBarItemsTitleColor
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    
    // 未点击下的 文字颜色 大小
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]  = XYFont_10;
    attrs[NSForegroundColorAttributeName] = XYSelectGlobalBg;
    
    // 点击下的 文字颜色 大小
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = XYNoSelectGlobalBg;
    
    // 修改 UITabBarItem 的文字
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    [item setTitlePositionAdjustment:UIOffsetMake(0, -3)]; // 文字上移
}


- (void)updateItemsBadge:(NSNotification*)noti
{
    int count = [[noti object] intValue];
    
    NSInteger index;
    if (self.tabBar.items.count == 5) {
        index = 3;
    }else{
        index = 2;
    }
    
    if (count == 0) {
        [self.tabBar.items objectAtIndex:index].badgeValue = nil;
        [self.tabBar updateBadge:nil bgColor:nil atIndex:index];
    }else{
        NSLog(@"%d",self.tabBar.items.count);
//        [self.tabBar.items objectAtIndex:index].badgeColor = XYRGBColor(153, 25, 15);
        [self.tabBar updateBadge:[NSString stringWithFormat:@"%d",count] bgColor:BALANCEColor atIndex:index];
//        UITabBarItem *item=[self.tabBar.items objectAtIndex:index];
//        item
//        [self.tabBar.items objectAtIndex:index]
//        [self.tabBar.items objectAtIndex:index].badgeValue = [NSString stringWithFormat:@"%d",count];
    }

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
