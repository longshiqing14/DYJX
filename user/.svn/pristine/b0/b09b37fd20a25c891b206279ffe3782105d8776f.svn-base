//
//  JXShopCouponViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShopCouponViewController.h"
#import "JXHhopAvailableViewController.h"
#import "JXShopUnavailableViewController.h"

@interface JXShopCouponViewController (){
    JXHhopAvailableViewController *shopAvailableViewController;
    JXShopUnavailableViewController *hopUnavailableViewController;
}
@end

@implementation JXShopCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     shopAvailableViewController.cartId=self.cartId;
    hopUnavailableViewController.cartId=self.cartId;
    NSLog(@"%@",self.cartId);
}


- (NSArray<NSString *> *)titles {
    return @[@"可使用", @"不可用"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.menuItemWidth = 60;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 15.0;
        [self couponController];
        self.titleColorSelected=XYRGBAColor(236,59,44, 1);
        self.titleColorNormal=XYRGBAColor(51, 51, 51, 1);
        
    }
    return self;
}


-(void)couponController{
    shopAvailableViewController= [[JXHhopAvailableViewController alloc]initWithNibName:@"JXHhopAvailableViewController" bundle:nil];
   
    hopUnavailableViewController=[[JXShopUnavailableViewController alloc]initWithNibName:@"JXShopUnavailableViewController" bundle:nil];
    
    NSLog(@"%@",self.cartId);
}

#pragma mark - WMPageController DataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        return shopAvailableViewController;
    }
    return hopUnavailableViewController;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 0, self.view.frame.size.width, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY =  44;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
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
