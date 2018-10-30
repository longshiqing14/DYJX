//
//  XYEWalletPreDepositReturnListVC.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositReturnListVC.h"

#import "XYEWalletPreDepositReturnListTVCell.h"
#import "XYEWalletPreDepositReturnListModel.h"

#import "XYEWalletAllNet.h"

#import "XYEWalletPreDepositReturnVC.h" //返现详情

@interface XYEWalletPreDepositReturnListVC () <UITableViewDelegate,UITableViewDataSource>

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * headerView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYEWalletPreDepositReturnListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预存款返还情况";
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];

    [self loadNewData];

}

/** 添加 view */
- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
}

#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = header;
    
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    [footer setTitle:@" " forState:MJRefreshStateIdle];
//    // 隐藏刷新状态的文字
//    self.tableView.mj_footer = footer;
    
}

- (void)loadNewData
{
    [self netPredepositReturnListDataRefresh:YES];
}

- (void)loadMoreData
{
//    [self netPredepositListDataRefresh:NO];
    
}



- (void)endHeaderWithFootRefresh:(BOOL)refresh
{
    if (refresh) {
        [self.tableView.mj_header endRefreshing];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
}


#pragma mark - button click

- (void)rightNavButtonClick:(UIButton*)sender
{
    
    
    
    
}


#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        
        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 15)];
        _headerView.backgroundColor = XYGlobalBg;
    }
    return _headerView;
}

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}




#pragma mark - tableview


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYEWalletPreDepositReturnListTVCell * cell = [XYEWalletPreDepositReturnListTVCell cellWithTableView:tableView];
    
    cell.listModel = self.dataSource[indexPath.row];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYEWalletPreDepositReturnListModel * newModel = self.dataSource[indexPath.row];
    
    XYEWalletPreDepositReturnVC * detailVC = [[XYEWalletPreDepositReturnVC alloc]init];
    detailVC.cashbackId = newModel.cashbackId;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - data net

- (void)netPredepositReturnListDataRefresh:(BOOL)refresh
{
    WeakSelf;
    [XYEWalletAllNet netPredepositbackListWithBlock:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf endHeaderWithFootRefresh:refresh];
    
        if (error == nil) {

            if (weakSelf.dataSource.count != 0) {
                [weakSelf.dataSource removeAllObjects];
            }
            
            NSDictionary * noNullDict = [XYCommon removeNull:blockDictionary];
            
            NSArray * dpFromResponse = [noNullDict objectForKey:@"userCashbackList"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYEWalletPreDepositReturnListModel * newModel = [XYEWalletPreDepositReturnListModel mj_objectWithKeyValues:butesdict];
                
                [weakSelf.dataSource addObject:newModel];
            }
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
