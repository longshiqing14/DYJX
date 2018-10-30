//
//  XYGoodsSearchResultVC.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsSearchResultVC.h"

#import "XYGoodsSearchResultTVCell.h"
#import "XYGoodsSearchResultModel.h"


#import "XYGoodsSearchResultNet.h"  // 搜索 请求

#import "XYGoodsDetailVC.h"  //商品详情

@interface XYGoodsSearchResultVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * headerView;

@property (nonatomic, strong) NSMutableArray <XYGoodsSearchResultModel*> * dataSource;

@end

@implementation XYGoodsSearchResultVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"搜索结果";
    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
    
    [self netSearchData];

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
//    [self netShoppingCartListData];
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


#pragma mark - tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView tableViewDisPlayType:XYTableViewEmptyType_no_search ifNecessaryForRowCount:self.dataSource.count target:self buttonAction:nil];
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYGoodsSearchResultTVCell *cell  = [XYGoodsSearchResultTVCell cellWithTableView:tableView];
 
    cell.searchResultModel = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XYGoodsSearchResultModel * model = self.dataSource[indexPath.row];
    [self pushToGoodsDetailWithModel:model];
}

#pragma mark - push

- (void)pushToGoodsDetailWithModel:(XYGoodsSearchResultModel*)model
{
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId = model.productId;
    [self.navigationController pushViewController:detailVC animated:YES];
}


#pragma mark - data  net

/** 搜索 */
- (void)netSearchData
{
    WeakSelf;
    [XYGoodsSearchResultNet netSelectCommuityWithBarcode:self.barcode block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            if (weakSelf.dataSource.count != 0) {
                [weakSelf.dataSource removeAllObjects];
            }
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"products"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYGoodsSearchResultModel * newModel = [XYGoodsSearchResultModel mj_objectWithKeyValues:butesdict];
                
                [weakSelf.dataSource addObject:newModel];
            }
            
            if (weakSelf.dataSource.count == 1) {
                [weakSelf pushToGoodsDetailWithModel:weakSelf.dataSource.firstObject];
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
