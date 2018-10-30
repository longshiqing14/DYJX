//
//  XYOrderDetailVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailVC.h"

//#import "XYOrderDetailSubClassOrderDetailVC.h"  //子类 订单详情
#import "JXMyOrderDetailsViewController.h"
#import "XYOrderDetailSubClassOrderStatusVC.h"  //子类 订单状态


@interface XYOrderDetailVC ()

@property (nonatomic, strong) NSArray * orderArray;

@end

@implementation XYOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = XYGlobalBg;
    
    self.isfullScreen = NO;
    
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        CGFloat contentX = 0;
        
        CGFloat contentY = 0;
        
        CGFloat contentH = XYScreenH - 64;
        
        contentView.frame = CGRectMake(contentX, contentY, XYScreenW, contentH);
        
    }];
    
    [self addOrderController];

}


- (void)addOrderController {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 移除之前所有子控制器
        [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
        
        // 把对应标题保存到控制器中，并且成为子控制器，才能刷新
        // 添加所有新的子控制器
        [self setUpAllViewController];
        
        // 注意：必须先确定子控制器
        [self refreshDisplay];
        
    });
    
    // 设置标题字体
    // 推荐方式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        
        *titleScrollViewColor = XYWhiteColor;
        
        *titleFont = XYFont_14;
        
        *selColor = XYMainColor;
        
        *norColor = XYBlackColor;
    }];
    
    
    
    
    // 推荐方式（设置下标）
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        // 标题填充模式
        *underLineColor = XYMainColor;
    }];
    //     [self refreshDisplay];
    //    self.isShowUnderLine = YES;
    
}


- (NSArray*)orderArray
{
    return  @[@{@"title":@"订单状态",@"order_status":@"1"},
              @{@"title":@"订单详情",@"order_status":@"2"},
              ];
    
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    for (NSDictionary * dict in self.orderArray) {
        
        if ([dict[@"order_status"] isEqualToString:@"1"] ) {
            
            XYOrderDetailSubClassOrderStatusVC * orderStatusVC = [[XYOrderDetailSubClassOrderStatusVC alloc] init];
            orderStatusVC.title = dict[@"title"];
            orderStatusVC.order_ID = self.order_ID;
            [self addChildViewController:orderStatusVC];
            
        }else if ([dict[@"order_status"] isEqualToString:@"2"]){
//            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc] init];
//            orderDetailVC.title = dict[@"title"];
//            orderDetailVC.order_ID = self.order_ID;
            JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.title = dict[@"title"];
            myOrderDetailsViewController.orderID = self.order_ID;
            [self addChildViewController:myOrderDetailsViewController];
        }
        

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
