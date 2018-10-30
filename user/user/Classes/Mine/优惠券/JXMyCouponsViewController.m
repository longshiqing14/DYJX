//
//  JXMyCouponsViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyCouponsViewController.h"
#import "JXAlreadyUsedViewController.h"
#import "JXExpiredViewController.h"
#import "JXNotUsedViewController.h"
#import "JXMyCouponsModel.h"
#import "JXGoodsDetailCouponViewController.h"

@interface JXMyCouponsViewController (){
    JXMyCouponsModel *couponsModel;
}

@property(nonatomic,strong)NSMutableArray *listArray;


@end

@implementation JXMyCouponsViewController

- (NSArray<NSString *> *)titles {
    return @[@"未使用", @"已过期", @"已使用"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.menuItemWidth = 60;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 15.0;
        [self couponController];
        self.automaticallyCalculatesItemWidths=YES;
        self.titleColorSelected=XYRGBAColor(236,59,44, 1);
        self.titleColorNormal=XYRGBAColor(51, 51, 51, 1);
       
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getkCouponNumber];
}

-(void)couponController{
   JXAlreadyUsedViewController *vc1= [[JXAlreadyUsedViewController alloc]initWithNibName:@"JXAlreadyUsedViewController" bundle:nil];
//    JXGoodsDetailCouponViewController *vc3 = [[JXGoodsDetailCouponViewController alloc]initWithNibName:@"JXGoodsDetailCouponViewController" bundle:nil];
    JXExpiredViewController *vc2=[[JXExpiredViewController alloc]initWithNibName:@"JXExpiredViewController" bundle:nil];
    JXNotUsedViewController *vc3=[[JXNotUsedViewController alloc]initWithNibName:@"JXNotUsedViewController" bundle:nil];
    _listArray=[[NSMutableArray alloc]initWithObjects:vc3,vc2,vc1, nil];
   
}

#pragma mark - WMPageController DataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (!couponsModel) {
        return self.titles[index];
    }
    if (index==0) {
        return [NSString stringWithFormat:@"%@(%@)",self.titles[index],couponsModel.unusedQuantity];
    }else if (index==1){
        return [NSString stringWithFormat:@"%@(%@)",self.titles[index],couponsModel.expiredNumber];
    }else{
        return [NSString stringWithFormat:@"%@(%@)",self.titles[index],couponsModel.alreadyUsedQuantity];
    }
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    NSLog(@"%@",_listArray[index]);
    return _listArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 0, self.view.frame.size.width, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY =  44;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

- (instancetype)init {
    return [self initWithNibName:@"JXAlreadyUsedViewController" bundle:nil];
}

-(void)getkCouponNumber{
    WeakSelf;
    [self network:[NSDictionary new] relativePath:kJXAPI_user_CouponNumber ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        couponsModel=[JXMyCouponsModel modelWithJSON:responseObject];
        [weakSelf reloadData];
    } failure:^{
        
    } UnusualFailure:^{
        
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
