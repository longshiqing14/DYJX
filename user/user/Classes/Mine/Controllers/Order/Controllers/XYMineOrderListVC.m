//
//  XYMineOrderListVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineOrderListVC.h"

#import "XYMineOrderListTVCell.h"
#import "JXConfirmSuccessViewController.h"

//#import "XYOrderDetailVC.h"  // 订单详情
//#import "XYOrderDetailSubClassOrderDetailVC.h" //订单详情
#import "JXMyOrderDetailsViewController.h"

#import "XYOrderAllNet.h"  //订单 请求

#import "XYOrderListModel.h"  // 订单列表 model

@interface XYMineOrderListVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property(nonatomic,assign)int page;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property(nonatomic,strong)NSString *oderNumber;
@end

@implementation XYMineOrderListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];
    [self loadNewData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadNewData];
   
}

/** 添加 view */
- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0.5);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    

    
}


#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = header;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadupNewData)];
    
}

- (void)loadNewData
{
    self.page=1;
    [self netOrderListDataWithRefresh:YES];
}
- (void)loadupNewData
{
    self.page=self.page+1;
    [self netOrderListDataWithRefresh:NO];
}

- (void)endHeaderWithFootRefresh:(BOOL)refresh
{
    if (refresh) {
        [self.tableView.mj_header endRefreshing];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
}



#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(netOrderListData)];
        
        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)emptyAction:(UIButton*)sender
{
//    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableViewDisPlayType:XYTableViewEmptyType_no_order ifNecessaryForRowCount:self.dataSource.count target:self buttonAction:@selector(emptyAction:)];
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYOrderListModel *model=self.dataSource[indexPath.row];
    if ([model.processStateInfo.state isEqualToString:@"p102"]) {
        return 190 + 45;
    }
    return 190;
//    return 190 + 45;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYMineOrderListTVCell * cell = [XYMineOrderListTVCell cellWithTableView:tableView];
    WeakSelf;
    cell.listModel = self.dataSource[indexPath.row];
    cell.ClockConfirmationReceipt = ^{
        XYOrderListModel *model=self.dataSource[indexPath.row];
        _oderNumber=model.aliasCode;
        
        UIAlertController *aleter = [UIAlertController alertWithTitle:@"确认收货" text:@"是否已收到商品?" leftButtonTitle:@"取消" rightButtonTitle:@"确定" destructiveButtonIndex:1 handleBlock:^(NSUInteger buttonIndex) {
            if (buttonIndex == 0) {
                return ;
            }else{
               [self ConfirmationReceipt];
            }
            
        }];
        aleter.clickMaskToClose = YES;
        [aleter show];

    };
    return cell;
    
}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%d",buttonIndex);
//    if (buttonIndex==1) {
//        [self ConfirmationReceipt];
//    }
//}

#pragma mark - data
/** 获取 订单列表 */
- (void)ConfirmationReceipt
{
    NSLog(@"%@",_oderNumber);
    WeakSelf;
    [XYOrderAllNet ConfirmationReceiptOder:_oderNumber Block:^(NSDictionary *blockDictionary, NSError *error) {
        if (!error) {
            if ([[blockDictionary objectForKey:@"status"] isEqualToString:@"0"]) {
                JXConfirmSuccessViewController *confirmSuccessViewController=[[JXConfirmSuccessViewController alloc]init];
                [weakSelf.navigationController pushViewController:confirmSuccessViewController animated:YES];
            }
        }
    }];
        
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYOrderListModel * model = self.dataSource[indexPath.row];
//    XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//    orderDetailVC.order_ID = model.aliasCode;
//    [self.navigationController pushViewController:orderDetailVC animated:YES];
    JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
    myOrderDetailsViewController.orderID = model.aliasCode;
    [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
}



#pragma mark - data
/** 获取 订单列表 */
- (void)netOrderListDataWithRefresh:(BOOL)isRefresh
{
    NSLog(@"%d",self.page);
    WeakSelf;
    [XYOrderAllNet netOrderListWithProcessState:@{@"processState":self.processState,@"page":@(self.page),@"limit":@(10)} block:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf endHeaderWithFootRefresh:isRefresh];
        if (error == nil) {
            if (weakSelf.page==1) {
                [weakSelf.dataSource removeAllObjects];
            }
//            if (weakSelf.dataSource.count != 0) {
//                [weakSelf.dataSource removeAllObjects];
//            }
            
//            NSArray * dpFromResponse = [blockDictionary objectForKey:@"orderList"];
//            for (NSDictionary * attributes in dpFromResponse) {
//                NSDictionary * butesdict = [XYCommon removeNull:attributes];
//                XYOrderListModel * newModel = [XYOrderListModel mj_objectWithKeyValues:butesdict];
//
//                [weakSelf.dataSource addObject:newModel];
//            }
            XYOrderModel *orderModel=[XYOrderModel mj_objectWithKeyValues:blockDictionary];
            [weakSelf.dataSource addObjectsFromArray:orderModel.orderList];
            [weakSelf.tableView reloadData];
            
        }
        
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
