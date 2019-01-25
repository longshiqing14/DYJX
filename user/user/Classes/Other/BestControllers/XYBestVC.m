//
//  XYBestVC.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"

#import "UIColor+Extension.h"

@interface XYBestVC ()

@end

@implementation XYBestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

    if (@available(iOS 11.0, *)) {
        [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    NSLog(@"%@",self.navigationController.topViewController);
    
 
    
    
}

-(void)viewWillAppear:(BOOL)animated{
//    NSLog(@"%@",self.navigationController.topViewController);
//    if (![self.navigationController.topViewController isKindOfClass:[XYHomeVC class]]) {
//        
//        //        [[UINavigationBar appearance] setBackgroundImage:[XYRGBAColor(228,228,228, 1) imageWithColor] forBarMetrics:UIBarMetricsDefault];
//        [[UINavigationBar appearance] setShadowImage:[XYRGBAColor(228,228,228, 1) imageWithColor]];
//    }else
//    {
//        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
//    }
}


/**
 *  添加导航栏右边图片按钮
 */
-(void)setRightImageButtonWith:(NSString *)imageString target:(id)target action:(SEL)select
{
    UIButton* rightBT= [UIButton buttonWithType:UIButtonTypeCustom];
    rightBT.frame = CGRectMake(0, 0, 44, 44);
    rightBT.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);

    [rightBT setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    [rightBT addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = 10;
    self.navigationItem.rightBarButtonItem = rightBar;
    
}

/**
 *  添加导航栏右边文字按钮
 */
-(void)setRightTitleButtonWith:(NSString *)title selectedTitle:(NSString*)selectedTitle target:(id)target action:(SEL)select
{
    UIButton* rightBT= [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGSize size = [XYStringHandle sizeWithString:title font:XYFont_16 viewWidth:1000];
    rightBT.frame = CGRectMake(0, 0, size.width+3, 20);
    
    rightBT.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);

    [rightBT setTitle:title forState:UIControlStateNormal];
    [rightBT setTitleColor:XYBlackColor forState:UIControlStateNormal];
    if (selectedTitle != nil) {
        [rightBT setTitle:selectedTitle forState:UIControlStateSelected];
        [rightBT setTitleColor:XYBlackColor forState:UIControlStateSelected];
    }
    rightBT.titleLabel.font = XYFont_16;
    [rightBT addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = 10;
    self.navigationItem.rightBarButtonItem = rightBar;
}

/**
 *  添加导航栏右边按钮
 */
-(void)setRightNavightionButton:(UIButton*)sender
{
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:sender];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItem = rightBar;
}

/**
 *  添加导航栏左边图片按钮
 */
-(void)setLeftImageButtonWith:(NSString *)imageString target:(id)target action:(SEL)select
{
//    UIButton* leftBT= [UIButton buttonWithType:UIButtonTypeCustom];
//    leftBT.frame = CGRectMake(0, 0, 16, 28);
//    leftBT.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
//    [leftBT setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
//    [leftBT addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageString] style:(UIBarButtonItemStylePlain) target:self action:select];
//    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:item];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItem = item;
}

/**
 *  添加导航栏左边文字按钮
 */
-(void)setLeftTitleButtonWith:(NSString *)title target:(id)target action:(SEL)select
{
    UIButton* leftBT= [UIButton buttonWithType:UIButtonTypeCustom];
    CGSize size = [XYStringHandle sizeWithString:title font:XYFont_16 viewWidth:1000];
    leftBT.frame = CGRectMake(0, 0, size.width+3, 20);
    
    leftBT.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);

    [leftBT setTitle:title forState:UIControlStateNormal];
    [leftBT setTitleColor:XYBlackColor forState:UIControlStateNormal];
    leftBT.titleLabel.font = XYFont_16;
    [leftBT addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItem = leftBar;
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
