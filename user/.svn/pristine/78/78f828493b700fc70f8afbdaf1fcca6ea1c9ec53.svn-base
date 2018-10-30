//
//  XYOrderDetailSubClassOrderDetailPayVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailPayVC.h"

#import "XYOrderDetailSubClassOrderDetailPayTVCell.h"
#import "XYOrderDetailSubClassOrderDetailPayfooterView.h"

#import "XYOrderDetailTitleModel.h"

@interface XYOrderDetailSubClassOrderDetailPayVC ()


@property (nonatomic, strong) NSMutableArray * dataSource;
//当前的订单状态
@property(nonatomic,copy)NSString *currentOderState;
/** 脚 数据 */
@property (nonatomic, copy) NSString * footerString;

@end

@implementation XYOrderDetailSubClassOrderDetailPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;

    self.tableView.backgroundColor = XYWhiteColor;
    self.tableView.scrollEnabled = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.footerString = @"￥0.00";

}





- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

//优惠券
//配送费
//优惠金额
//积分
- (void)updataOrderPayViewDataTotalProductPrice:(NSString*)totalProductPrice
                                  deliveryPrice:(NSString*)deliveryPrice
                         totalOrderNeedPayPrice:(NSString*)totalOrderNeedPayPrice
                            totalUsedCardAmount:(NSString*)totalUsedCardAmount OderState:(NSString *)oderState
                             TotalOrderDiscount:(NSString *)totalOrderDiscount IntegralI:(NSString *)integralDiscount{
    
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString * payPrice  = [NSString stringWithFormat:@"￥%@",totalOrderNeedPayPrice];
    NSString * totalPrice  = [NSString stringWithFormat:@"￥%@",totalProductPrice];
    NSString * delPrice  = [NSString stringWithFormat:@"+￥%@",deliveryPrice];
//    NSString * cardPrice = [NSString stringWithFormat:@"%.2f",[totalPrice floatValue]];
    
    [array addObject:@{@"title":@"商品总额",@"sub":totalPrice}];

    if (totalOrderDiscount != nil && ![totalOrderDiscount isEqualToString:@""]&&![totalOrderDiscount isEqualToString:@"0.00"]) {
        NSString * string = [NSString stringWithFormat:@"-￥%.2f",[totalOrderDiscount floatValue]];
        [array addObject:@{@"title":@"优惠金额",@"sub":string}];
    }
    if (totalUsedCardAmount != nil && ![totalUsedCardAmount isEqualToString:@""]&&![totalUsedCardAmount isEqualToString:@"0.00"]) {
        NSString * string = [NSString stringWithFormat:@"-￥%@",totalUsedCardAmount];
        [array addObject:@{@"title":@"优惠劵",@"sub":string}];
    }
//    积分
    if (integralDiscount != nil && ![integralDiscount isEqualToString:@""]&&![integralDiscount isEqualToString:@"0.00"]&&![integralDiscount isEqualToString:@"0"]) {
        NSString * string = [NSString stringWithFormat:@"-￥%@",integralDiscount];
        [array addObject:@{@"title":@"积分抵扣",@"sub":string}];
    }
    
    
     [array addObject:@{@"title":@"配送费",@"sub":delPrice}];
//    [array addObject:@{@"title":@"满减返现",@"sub":@"-￥0"}];
    
    
    for (NSDictionary * dict in array) {
        XYOrderDetailTitleModel * model = [[XYOrderDetailTitleModel alloc]init];
        
        model.sub = dict[@"sub"];
        model.title = dict[@"title"];
        
        [self.dataSource addObject:model];
    }
    _currentOderState=oderState;
    self.footerString = payPrice;
    
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderDetailSubClassOrderDetailPayTVCell * cell = [XYOrderDetailSubClassOrderDetailPayTVCell cellWithTableView:tableView];
    
    XYOrderDetailTitleModel * model = self.dataSource[indexPath.row];
    
    cell.titleLB.text = model.title;
    cell.subLB.text = model.sub;
    
//    if (indexPath.row == 2 || indexPath.row == 3) {
//        cell.subLB.textColor = XYMainColor;
//    }else{
//        cell.subLB.textColor = XYBlackColor;
//    }
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    XYOrderDetailSubClassOrderDetailPayfooterView * footerView = [XYOrderDetailSubClassOrderDetailPayfooterView headerWithTableView:tableView];
    
    if ([_currentOderState isEqualToString:@"p100"]) {
        footerView.titleLB.text = @"需付：";
    }else{
        footerView.titleLB.text = @"实付：";
    }
    
    footerView.titleNumLB.text = self.footerString;

    return footerView;
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
