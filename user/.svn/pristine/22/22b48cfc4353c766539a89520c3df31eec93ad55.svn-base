//
//  XYOrderConfirmPriceTVC.m
//  user
//
//  Created by xingyun on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmPriceTVC.h"

#import "XYOrderConfirmPriceTVCell.h"

#import "XYOrderFromDetailModel.h"

#import "XYOrderDetailTitleModel.h"

@interface XYOrderConfirmPriceTVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYOrderConfirmPriceTVC

const CGFloat orderConfirm_price_cell_height = 35.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = XYWhiteColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.scrollEnabled = NO;
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    
}

- (void)setOrderOcsModel:(XYOrderFromDetailocsModel *)orderOcsModel isHide:(NSString *)hide
{
    [self.dataSource removeAllObjects];
    _orderOcsModel = orderOcsModel;
    
    NSMutableArray * array = [NSMutableArray array];
    
    if (_orderOcsModel.totalOrderProductPrice != nil) {
        if ([_orderOcsModel.totalOrderProductPrice isEqualToString:@""]) {
            [array addObject:@{@"title":@"商品总额",@"sub":@"￥0.0"}];
        }else{
            NSString * string = [NSString stringWithFormat:@"￥%@",orderOcsModel.totalOrderProductPrice];
            [array addObject:@{@"title":@"商品总额",@"sub":string}];
        }
    }
    
    NSLog(@"%@",_orderOcsModel.totalOrderDiscount);
    if (_orderOcsModel.totalOrderDiscount!=nil) {
        if ([_orderOcsModel.totalOrderDiscount isEqualToString:@""]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0"]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"]) {
            //            [array addObject:@{@"title":@"优惠金额",@"sub":@"-￥0.0"}];
        }else{
            NSString * string = [NSString stringWithFormat:@"-￥%.2f",[orderOcsModel.totalOrderDiscount floatValue]];
            [array addObject:@{@"title":@"优惠金额",@"sub":string}];
        }
    }
    
    if (_orderOcsModel.totalUsedCardAmount != nil) {
        if ([_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||[_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"]) {
            //            [array addObject:@{@"title":@"优惠劵",@"sub":@"-￥0.0"}];
        }else{
            NSString * string = [NSString stringWithFormat:@"-￥%@",orderOcsModel.totalUsedCardAmount];
            [array addObject:@{@"title":@"优惠劵",@"sub":string}];
        }
    }
    if (![hide isEqualToString:@"0"]) {
        if (orderOcsModel.integral.integralPrice != nil && ![orderOcsModel.integral.integralPrice isEqualToString:@""]&&![orderOcsModel.integral.integralPrice isEqualToString:@"0.00"]) {
            NSString * string = [NSString stringWithFormat:@"-￥%@",orderOcsModel.integral.integralPrice];
            [array addObject:@{@"title":@"积分抵扣",@"sub":string}];
        }
    }
    
    NSLog(@"%@",_orderOcsModel.totalDeliveryFee);
    if (_orderOcsModel.totalDeliveryFee != nil) {
        if ([_orderOcsModel.totalDeliveryFee isEqualToString:@""]) {
            [array addObject:@{@"title":@"配送费",@"sub":@"+￥0.0"}];
        }else{
            
            NSString * string = [NSString stringWithFormat:@"+￥%@",orderOcsModel.totalDeliveryFee];
            [array addObject:@{@"title":@"配送费",@"sub":string}];
        }
    }
    
    
    //    [array addObject:@{@"title":@"满减返现",@"sub":@"-￥0"}];
        
    for (NSDictionary * dict in array) {
        XYOrderDetailTitleModel * model = [[XYOrderDetailTitleModel alloc]init];
        
        model.sub = dict[@"sub"];
        model.title = dict[@"title"];
        
        [self.dataSource addObject:model];
    }
    
    [self.tableView reloadData];
    
}



#pragma mark - 懒加载

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return orderConfirm_price_cell_height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    XYOrderConfirmPriceTVCell * cell = [XYOrderConfirmPriceTVCell cellWithTableView:tableView];

    XYOrderDetailTitleModel * model = self.dataSource[indexPath.row];
    cell.titleLB.text = model.title;
    cell.subLB.text = model.sub;
    
    return cell;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
