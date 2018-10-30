//
//  JXPointsRecordVC.m
//  user
//
//  Created by 岩  熊 on 2017/12/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXPointsRecordVC.h"
#import "JXPointsRecordVCSiftVC.h"
#import "JXPointsRecordCell.h"
#import "XYEWalletBalanceRecordModel.h"

#import "XYEWalletAllNet.h"
#import "XYBestPageModel.h"

#import "JXPiontsRecordListVC.h"
@interface JXPointsRecordVC()<UITableViewDelegate,UITableViewDataSource,JXPointsRecordVCSiftVCDelegate>
/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray <XYEWalletBalanceRecordModel*>* dataSource;

@property (nonatomic, strong) XYBestPageModel * pageModel;

@property(strong,nonatomic) JXPointsRecordVCSiftVC *recordSiftVC ;

@property(assign,nonatomic) BOOL rightBtnClicked ;


@property(copy,nonatomic) NSString *startTimeStr ;

@property(copy,nonatomic) NSString *endTimeStr ;
/**@mock=transationType_order:购物消费 | transationType_recharge:余额充值 | transationType_order_rollpay:订单退款*/
@property(copy,nonatomic) NSString *type ;
@end

@implementation JXPointsRecordVC

- (void)viewDidLoad {
[super viewDidLoad];

self.navigationItem.title = @"积分变动记录";
self.view.backgroundColor = XYGlobalBg;


[self addViewAndLayout];

[self loadNewData];

//[self setRightImageButtonWith:@"ewallet_list_nav" target:self action:@selector(rightNavButtonClick:)];

[self.view addSubview:self.recordSiftVC.view];
self.recordSiftVC.view.frame = CGRectMake(XYScreenW, 0, XYScreenW, XYScreenH);


}


/** 添加 view */
- (void)addViewAndLayout
{
[self.view addSubview:self.tableView];
[self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(15);
    make.bottom.left.right.mas_equalTo(0);
}];

}

#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
self.tableView.mj_header = header;

MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
[footer setTitle:@" " forState:MJRefreshStateIdle];
// 隐藏刷新状态的文字
//    footer.refreshingTitleHidden = YES;
self.tableView.mj_footer = footer;

}

- (void)loadNewData
{
[self netPredepositListDataRefresh:YES];
}

- (void)loadMoreData
{
[self netPredepositListDataRefresh:NO];

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

if (self.rightBtnClicked) {
    self.rightBtnClicked = NO;
    WeakSelf;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.recordSiftVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}else
{
    self.rightBtnClicked = YES;
    WeakSelf;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.recordSiftVC.view.transform = CGAffineTransformMakeTranslation(-XYScreenW, 0);
    } completion:^(BOOL finished) {
        
    }];
    
}


}


#pragma mark - 懒加载

- (UITableView*)tableView
{
if (_tableView == nil) {
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.backgroundColor = XYGlobalBg;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableFooterView = [UIView new];
    
    [self addTableViewRefresh];
    
}
return _tableView;
}

-(JXPointsRecordVCSiftVC *)recordSiftVC
{
if (!_recordSiftVC) {
    _recordSiftVC = [[JXPointsRecordVCSiftVC alloc] init];
    [self addChildViewController:_recordSiftVC];
    _recordSiftVC.delegate = self;
}
return _recordSiftVC;
}


- (NSMutableArray<XYEWalletBalanceRecordModel*>*)dataSource
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
return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
JXPointsRecordCell * cell = [JXPointsRecordCell cellWithTableView:tableView];

cell.listModel = self.dataSource[indexPath.row];
    cell.titleLB.text = self.dataSource[indexPath.row].transactionReason;
    
    cell.timeLB.text = self.dataSource[indexPath.row].transactionTime;
    
    cell.moneyLB.text = self.dataSource[indexPath.row].realTransactionAmt;
    
    if ([self.dataSource[indexPath.row].direction isEqualToString:@"+"]) {
        cell.moneyLB.textColor = XYMainColor;
    }else{
        cell.moneyLB.textColor = XYBlackColor;
    }
return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//XYEWalletBalanceRecordModel * newModel = self.dataSource[indexPath.row];
//
//JXPiontsRecordListVC * detailVC = [[JXPiontsRecordListVC alloc]init];
//detailVC.navigationItem.title = [NSString stringWithFormat:@"%@详情",newModel.typeLabel];
//detailVC.balance_id = newModel.balance_id;
//[self.navigationController pushViewController:detailVC animated:YES];

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


-(void)backStartTime:(NSString *)startTimeStr endTimeStr:(NSString *)endTimeStr Type:(NSInteger)type
{
self.rightBtnClicked = NO;
WeakSelf;
[UIView animateWithDuration:0.1 animations:^{
    weakSelf.recordSiftVC.view.transform = CGAffineTransformIdentity;
} completion:^(BOOL finished) {
    
}];

self.startTimeStr = startTimeStr;
self.endTimeStr = endTimeStr;

if (type== 0) {
    self.type = @"transationType_cashback";
}else if (type == 1)
{
    self.type = @"transationType_order";
}else if (type == 2)
{
    self.type = @"transationType_order_rollpay";
    
}else if(type == 3)
{
    self.type = @"transationType_recharge";
}else if(type == 4)
{
    self.type = @"transationType_cashback";
}
[self netPredepositListDataRefresh:YES];



}
#pragma mark - data net

/** 余额记录 */
- (void)netPredepositListDataRefresh:(BOOL)isRefresh
{

NSString * start = @"";

if (isRefresh) {
    start = @"1";
}else{
    if (self.pageModel == nil) {
        start = @"1";
    }else{
        
        if ([self.pageModel.page intValue] == [self.pageModel.pageCount intValue]) {
            [self endHeaderWithFootRefresh:isRefresh];
            return;
        }else{
            start = [NSString stringWithFormat:@"%d",[self.pageModel.page intValue]+1];
        }
        
    }
}


    WeakSelf;
    [XYEWalletAllNet netPredepositListLimit:@"10"
                                    logType:self.type
                                  startTime:self.startTimeStr
                                    endTime:self.endTimeStr
                                      start:start AfterAmount:self.accountType
                                      block:^(NSDictionary *blockDictionary, NSError *error) {
                                          [weakSelf endHeaderWithFootRefresh:isRefresh];
                                          if (error == nil) {
                                              
                                              if (isRefresh) {
                                                  if (weakSelf.dataSource.count != 0) {
                                                      [weakSelf.dataSource removeAllObjects];
                                                  }
                                              }
                                              
                                              NSDictionary * logsDict = [blockDictionary objectForKey:@"logs"];
                                              
                                              NSDictionary * noNullDict = [XYCommon removeNull:logsDict];
                                              
                                              weakSelf.pageModel = [XYBestPageModel mj_objectWithKeyValues:noNullDict];
                                              
                                              NSArray * dpFromResponse = [noNullDict objectForKey:@"list"];
                                              for (NSDictionary * attributes in dpFromResponse) {
                                                  NSDictionary * butesdict = [XYCommon removeNull:attributes];
                                                  XYEWalletBalanceRecordModel * newModel = [XYEWalletBalanceRecordModel mj_objectWithKeyValues:butesdict];
                                                  
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
