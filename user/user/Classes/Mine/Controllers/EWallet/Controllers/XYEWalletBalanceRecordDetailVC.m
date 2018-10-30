//
//  XYEWalletBalanceRecordDetailVC.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletBalanceRecordDetailVC.h"

#import "XYEWalletDetailTVCell.h"

#import "XYEWalletDetailModel.h"
#import "XYEWalletBalanceRecordDetailModel.h"

#import "XYEWalletCommon.h"

#import "XYEWalletAllNet.h"

@interface XYEWalletBalanceRecordDetailVC () <UITableViewDelegate,UITableViewDataSource>

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, strong) XYEWalletBalanceRecordDetailModel * detailModel;

@end

@implementation XYEWalletBalanceRecordDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
    
    [self netdepositDetailData];
    
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

//#pragma mark - Refresh
///** 添加列表刷新 */
//- (void)addTableViewRefresh
//{
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_header = header;
//    
//}
//
//- (void)loadNewData
//{
//}
//- (void)endHeaderWithFootRefresh:(BOOL)refresh
//{
//    if (refresh) {
//        [self.tableView.mj_header endRefreshing];
//    }else{
//        [self.tableView.mj_footer endRefreshing];
//    }
//}



#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
//        [self addTableViewRefresh];
        
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


- (void)updateDataSource
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [NSMutableArray array];
    
//    if ([_listModel.type isEqualToString:transationType_recharg]) {
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_chong"];
//    }else if ([_listModel.type isEqualToString:transationType_order]){
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_mai"];
//    }else if ([_listModel.type isEqualToString:transationType_order_rollpay]){
//        self.iconImageView.image = [UIImage imageNamed:@"ewallet_list_tui"];
//    }
    
    NSString * typeLabel = self.detailModel.transactionType.typeLabel;
    NSString * transactionAmount = self.detailModel.transactionAmount;
    NSString * transactionTime = self.detailModel.transactionTime;
    NSString * paymentType = self.detailModel.paymentType;
    NSString * transactionNo = self.detailModel.transactionNo;
    NSString * afterAmount = self.detailModel.afterAmount;

    
    
    
    if ([self.detailModel.transactionType.type isEqualToString:transationType_recharge]) {
        
        [array addObject:@{@"image":@"",@"title":@"类型",@"content":typeLabel}];
        [array addObject:@{@"image":@"",@"title":@"收入",@"content":transactionAmount}];
        [array addObject:@{@"image":@"",@"title":@"充值时间",@"content":transactionTime}];
        [array addObject:@{@"image":@"",@"title":@"充值方式",@"content":paymentType}];
        [array addObject:@{@"image":@"",@"title":@"交易流水号",@"content":transactionNo}];
        [array addObject:@{@"image":@"",@"title":@"账户编号",@"content":@""}];
        [array addObject:@{@"image":@"",@"title":@"余额",@"content":afterAmount}];

    }else if ([self.detailModel.transactionType.type isEqualToString:transationType_cashback]){

        [array addObject:@{@"image":@"",@"title":@"类型",@"content":typeLabel}];
        [array addObject:@{@"image":@"",@"title":@"收入",@"content":transactionAmount}];
        [array addObject:@{@"image":@"",@"title":@"交易时间",@"content":transactionTime}];
        [array addObject:@{@"image":@"",@"title":@"单据单号",@"content":transactionNo}];
        [array addObject:@{@"image":@"",@"title":@"余额",@"content":afterAmount}];
        
        
    }else if ([self.detailModel.transactionType.type isEqualToString:transationType_order]){
        
        [array addObject:@{@"image":@"",@"title":@"类型",@"content":typeLabel}];
        [array addObject:@{@"image":@"",@"title":@"支出",@"content":transactionAmount}];
        [array addObject:@{@"image":@"",@"title":@"交易时间",@"content":transactionTime}];
        [array addObject:@{@"image":@"",@"title":@"单据编号",@"content":transactionNo}];
        [array addObject:@{@"image":@"",@"title":@"余额",@"content":afterAmount}];
        
    }else if ([self.detailModel.transactionType.type isEqualToString:transationType_order_rollpay] ){

        [array addObject:@{@"image":@"",@"title":@"类型",@"content":typeLabel}];
        [array addObject:@{@"image":@"",@"title":@"收入",@"content":transactionAmount}];
        [array addObject:@{@"image":@"",@"title":@"退款时间",@"content":transactionTime}];
        [array addObject:@{@"image":@"",@"title":@"退款单号",@"content":transactionNo}];
        [array addObject:@{@"image":@"",@"title":@"账户编号",@"content":@""}];
        [array addObject:@{@"image":@"",@"title":@"余额",@"content":afterAmount}];
        
    }
    
    
    for (NSDictionary * dict in array) {
        XYEWalletDetailModel * model = [[XYEWalletDetailModel alloc]init];
        
        model.title = dict[@"title"];
        model.content = dict[@"content"];
        
        [self.dataSource addObject:model];
    }
    
    [self.tableView reloadData];
}




#pragma mark - tableview


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XYEWalletDetailTVCell * cell = [XYEWalletDetailTVCell cellWithTableView:tableView];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.textColor = XYFontTitleColor;
    cell.textLabel.font = XYFont_14;
    
    cell.detailTextLabel.textColor = XYFontTitleColor;
    cell.detailTextLabel.font = XYFont_14;
    
    XYEWalletDetailModel * model = self.dataSource[indexPath.row];
    
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.content;
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }
    
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

/** 余额 详情 */
- (void)netdepositDetailData
{
    
    
    WeakSelf;
    [XYEWalletAllNet netdepositDetailWithid:self.balance_id block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
   
            NSDictionary * logsDict = [blockDictionary objectForKey:@"accountLog"];
            NSDictionary * noNullDict = [XYCommon removeNull:logsDict];
            weakSelf.detailModel = [XYEWalletBalanceRecordDetailModel mj_objectWithKeyValues:noNullDict];

            [weakSelf updateDataSource];
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
