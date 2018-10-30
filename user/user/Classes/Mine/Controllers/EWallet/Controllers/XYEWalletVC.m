//
//  XYEWalletVC.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletVC.h"

#import "XYEWalletHeaderVC.h"

#import "XYEWalletDetailTVCell.h"
#import "XYEWalletDetailModel.h"


#import "XYEWalletBalanceRecordVC.h"  //余额记录列表
#import "XYEWalletPreDepositReturnListVC.h" //预存款返还

@interface XYEWalletVC () <UITableViewDelegate,UITableViewDataSource>

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * headerView;

@property (nonatomic, strong) XYEWalletHeaderVC * headerVC;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * dataSource;


@end

@implementation XYEWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"账户余额";
    self.view.backgroundColor = XYBlackColor;


    [self addViewAndLayout];
}

/** 添加 view */
- (void)addViewAndLayout
{
    [self updateDataSource];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
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
        

        
//        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, ewallet_header_height)];
        
        [_headerView addSubview:self.headerVC.view];
        
        [self.headerVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.bottom.mas_equalTo(0);
        }];
    }
    return _headerView;
}

- (XYEWalletHeaderVC*)headerVC
{
    if (_headerVC == nil) {
        _headerVC = [[XYEWalletHeaderVC alloc]init];
        _headerVC.view.frame = CGRectZero;
        [self addChildViewController:_headerVC];
        
    }
    return _headerVC;
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
    
    [array addObject:@{@"image":@"ewallet_icon_moneylist",@"title":@"余额变动记录",@"content":@""}];
    [array addObject:@{@"image":@"ewallet_icon_list_record",@"title":@"活动预存返还",@"content":@""}];

    
    for (NSDictionary * dict in array) {
        XYEWalletDetailModel * model = [[XYEWalletDetailModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.content = dict[@"content"];
        
        [self.dataSource addObject:model];
    }
}


#pragma mark - tableview


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    XYEWalletDetailTVCell * cell = [XYEWalletDetailTVCell cellWithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.textLabel.textColor = XYBlackColor;
    cell.textLabel.font = XYFont_14;
    
    XYEWalletDetailModel * model = self.dataSource[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    cell.imageView.image = [UIImage imageNamed:model.image];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        XYEWalletBalanceRecordVC * balanceRecordVC = [[XYEWalletBalanceRecordVC alloc]init];
        [self.navigationController pushViewController:balanceRecordVC animated:YES];
    }else
    {
        XYEWalletPreDepositReturnListVC * returnListVC = [[XYEWalletPreDepositReturnListVC alloc]init];
        [self.navigationController pushViewController:returnListVC animated:YES];
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
