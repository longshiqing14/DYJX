//
//  XYMineOrderListVCViewController.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineOrderListVCViewController.h"

#import "XYMineOrderListVC.h"
#import "XYOrderCommentVC.h"
@interface XYMineOrderListVCViewController ()

@property (nonatomic, strong) NSArray * orderArray;

@end

@implementation XYMineOrderListVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的订单";
    self.view.backgroundColor = XYGlobalBg;

    self.isfullScreen = NO;
    
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        CGFloat contentX = 0;
        
        CGFloat contentY = 0;
        
        CGFloat contentH = XYScreenH - 64;
        
        contentView.frame = CGRectMake(contentX, contentY, XYScreenW, contentH);
        
    }];
    
    
    [self addOrderController];
    
    
    if (self.isPaySuccessPush) {
        //得到当前视图控制器中的所有控制器
        NSArray *array = [self.navigationController.viewControllers copy];
        NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:0];
        [arrayTemp addObject:array.firstObject];
        [arrayTemp addObject:array.lastObject];
        [self.navigationController setViewControllers:[arrayTemp copy] animated:YES];
    }
    
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
        
        *selColor = BALANCEColor;
        
        *norColor = NoBALANCEColor;
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
    return  @[@{@"title":@"全部",@"order_status":@""},
              @{@"title":@"待付款",@"order_status":@"p100"},
              @{@"title":@"待发货",@"order_status":@"p101"},
              @{@"title":@"待收货",@"order_status":@"p102"},
              @{@"title":@"评价",@"order_status":@""}
              ];
    //p100:待付款,p101:待发货,p102:待收货,p112:已完成,p111:已取消
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    for (NSDictionary * dict in self.orderArray) {
        
        if ([dict[@"title"] isEqualToString:@"评价"]) {
            
            XYOrderCommentVC *orderCommentVC = [[XYOrderCommentVC alloc] init];
            orderCommentVC.title = dict[@"title"];
            [self addChildViewController:orderCommentVC];
            
        }else{
            XYMineOrderListVC * orderListTVC = [[XYMineOrderListVC alloc] init];
            orderListTVC.title = dict[@"title"];
            orderListTVC.processState = dict[@"order_status"];
            
            [self addChildViewController:orderListTVC];
        }
    }
}

//    NSDictionary *dict = self.orderArray[0];
//    XYMineOrderListVC * orderListTVC0 = [[XYMineOrderListVC alloc] init];
//    orderListTVC0.title = dict[@"title"];
//    orderListTVC0.processState = dict[@"order_status"];
//    [self addChildViewController:orderListTVC0];
//    
//    
//    NSDictionary *dict1 = self.orderArray[1];
//    XYMineOrderListVC * orderListTVC1 = [[XYMineOrderListVC alloc] init];
//    orderListTVC1.title = dict1[@"title"];
//    orderListTVC1.processState = dict1[@"order_status"];
//    [self addChildViewController:orderListTVC1];
//    
//    NSDictionary *dict2 = self.orderArray[2];
//    XYMineOrderListVC * orderListTVC2 = [[XYMineOrderListVC alloc] init];
//    orderListTVC2.title = dict2[@"title"];
//    orderListTVC2.processState = dict2[@"order_status"];
//    [self addChildViewController:orderListTVC2];
//    
//    NSDictionary *dict3 = self.orderArray[4];
//    XYOrderCommentVC *orderCommentVC = [[XYOrderCommentVC alloc] init];
//    orderCommentVC.title = dict3[@"title"];
//    [self addChildViewController:orderCommentVC];
//}


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
