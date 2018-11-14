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
#import "NaviViewController.h"

@interface DYJXConversationTabBarController ()

@end

@implementation DYJXConversationTabBarController

- (instancetype)initWithIconUrl:(NSString*)iconUrl{
    if (self = [super init]) {
        self.iconUrl = iconUrl;
         [self initSubViews];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)initSubViews{
    [UINavigationBar appearance];
    
    [DYJXConversationTabBarController setTabBarItemsTitleColor];
    
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"15293B"]]];

    // 添加子控制器
    DYJXConversionPage *conversionPage = [[DYJXConversionPage alloc]init];
    conversionPage.iconUrl = self.iconUrl;
    [self setupChildVC:conversionPage title:@"最近会话" image:@"huihua" selectedImage:@"huihua-select"];
    
    DYJXContacterPage *contacterPage = [[DYJXContacterPage alloc] init];
    contacterPage.iconUrl = self.iconUrl;
    [self setupChildVC:contacterPage title:@"联系人" image:@"lianxiren" selectedImage:@"lianxiren-select"];

    DYJXGroupPage *groupPage = [[DYJXGroupPage alloc] init];
    groupPage.iconUrl = self.iconUrl;
    [self setupChildVC:groupPage title:@"群组" image:@"qunzu" selectedImage:@"qunzu-select"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItemsBadge:) name:XY_notification_ItemsBadge object:nil];
}

/** 设置首页UITabBarItem的文字属性 */
+ (void)setTabBarItemsTitleColor
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    
    // 未点击下的 文字颜色 大小
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]  = XYFont_10;
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    // 点击下的 文字颜色 大小
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#F2A73B"];
    
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
    NaviViewController *nav = [[NaviViewController alloc] initWithRootViewController:vc];
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
