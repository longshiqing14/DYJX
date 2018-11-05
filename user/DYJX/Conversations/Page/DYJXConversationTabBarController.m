//
//  DYJXConversationTabBarController.m
//  user
//
//  Created by 岩  熊 on 2018/11/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXConversationTabBarController.h"
#import "DYJXConversionPage.h"
#import "DYJXContacterPage.h"
#import "DYJXGroupPage.h"
#import "XYBestNavigationVC.h"

@interface DYJXConversationTabBarController ()

@end

@implementation DYJXConversationTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

- (void)initSubViews{
    [UINavigationBar appearance];
    
    [DYJXConversationTabBarController setTabBarItemsTitleColor];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];

    // 添加子控制器
    [self setupChildVC:[[DYJXConversionPage alloc]init] title:@"最近会话" image:@"tabbar_home_n" selectedImage:@"tabbar_home_s"];
    //原生
    [self setupChildVC:[[DYJXContacterPage alloc] init] title:@"联系人" image:@"tabbar_cata_n" selectedImage:@"tabbar_cata_s"];
    
    
    
    
    //    [self setupChildVC:[[JXActivityPage alloc] init] title:@"活动" image:@"tabbar_activity_n" selectedImage:@"tabbar_activity_s"];
    
    [self setupChildVC:[[DYJXGroupPage alloc] init] title:@"群组" image:@"tabbar_buy_n" selectedImage:@"tabbar_buy_s"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItemsBadge:) name:XY_notification_ItemsBadge object:nil];
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
