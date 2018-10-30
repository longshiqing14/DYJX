//
//  DYJXIdentitySwitchingPage.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingPage.h"
#import "DYJXIdentitySwitchingViewModel.h"
#import "DYJXIdentitySwitchingCell.h"
#import "NaviViewController.h"
#import "DYJXLoginPage.h"

@interface DYJXIdentitySwitchingPage ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)DYJXIdentitySwitchingViewModel *viewModel;
@end

static NSString *cellID=@"cellID";
@implementation DYJXIdentitySwitchingPage


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self.tableView registerClass:[DYJXIdentitySwitchingCell class] forCellReuseIdentifier:cellID];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4"]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addFooterAndHeader];
//    [self getHomelData];

}

- (void)initNavigation{
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(IdentitySwitchingCommit) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    [self.otherTableView.mj_header beginRefreshing];
}

- (void)getHomelData{
    WeakSelf;
    [self.viewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
        
        if (doHaveData) {
            
        }else {
            
            [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
        }
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];
    } failed:^(NSString *errorMsg) {
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
}

- (void)addFooterAndHeader{
    WeakSelf;
    
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf.viewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
            
            if (doHaveData) {
                
            }else {
                
                [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
            }
            
            if (isLastPage) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [weakSelf.tableView.mj_footer endRefreshing];
            }
            
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
        } failed:^(NSString *errorMsg) {
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    }];
    
    _tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.viewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
            
            if (doHaveData) {
                
            }else {
                
                [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
                [weakSelf.tableView.mj_footer endRefreshing];
            }
            
            if (isLastPage) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [weakSelf.tableView.mj_footer endRefreshing];
            }
            [weakSelf.tableView reloadData];
        } failed:^(NSString *errorMsg) {
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel numberOfCell];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXIdentitySwitchingCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    tableCell.goodsNameLabel.text = [self.viewModel goodsName:indexPath];
    tableCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.viewModel goodsPrice:indexPath]];
    tableCell.sellingPointLable.text = [self.viewModel sellingPointText:indexPath];
    [tableCell setDataArray:[NSMutableArray arrayWithArray:[self.viewModel goodsLable:indexPath]]];
    
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYJXIdentitySwitchingViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXIdentitySwitchingViewModel alloc] init];
    }
    return _viewModel;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //headerView
    //去掉UItableview的section的headerview黏性
    CGFloat sectionHeaderHeight = 46;
    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (IBAction)logoutBTN:(UIButton *)sender {
    [self.viewModel logoutSuccess:^{
        [YDBAlertView showToast:@"退出登录成功！"];
        [XYUserDefaults deleteUserDefaultsLoginedInfoModel];
        XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil]];
    } failed:^(NSString *errorMsg) {
        
    }];
}


- (void)viewDidDisappear:(BOOL)animated{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
