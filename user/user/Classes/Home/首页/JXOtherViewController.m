//
//  JXOtherViewController.m
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXOtherViewController.h"
#import "JXFoodheaderViewModel.h"
#import "JXFoodCell.h"
#import "XYShoppingCartNet.h"
#import "JXFoodheaderView.h"
#import "XYGoodsDetailVC.h"
@interface JXOtherViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heatHome;
@property(nonatomic,strong)NSMutableArray *otherArray;
@property (nonatomic) JXFoodheaderViewModel *viewModel;

@end

static NSString *cellID=@"cellID";

@implementation JXOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.type);
    [self.view  addSubview:self.otherTableView];
    [self.otherTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
        
    }];
    
    [self.otherTableView registerClass:[JXFoodCell class] forCellReuseIdentifier:cellID];
    
    self.otherTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.viewModel.requestDic setObject:self.type forKey:@"kurl"];
    [self addFooterAndHeader];
    [self getHomelData];
//    NSString *version = [UIDevice currentDevice].systemVersion;
//    if([version rangeOfString:@"10"].location !=NSNotFound)//_roaldSearchText
//    {
//        _heatHome.constant=-50;
//    }
//    else
//    {
//        NSLog(@"no");
//    }
}

- (UITableView *)otherTableView{
    if (!_otherTableView) {
        _otherTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _otherTableView.delegate = self;
        _otherTableView.dataSource = self;
        _otherTableView.showsVerticalScrollIndicator = NO;


        [_otherTableView setTableFooterView:[UIView new]];
        [_otherTableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        [_otherTableView setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4"]];
    }
    return _otherTableView;
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
        [weakSelf.otherTableView.mj_header endRefreshing];
        [weakSelf.otherTableView reloadData];
    } failed:^(NSString *errorMsg) {
        [weakSelf.otherTableView.mj_header endRefreshing];
    }];
    
}

- (void)addFooterAndHeader{
    WeakSelf;
    
    
    _otherTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf.viewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
            
            if (doHaveData) {
                
            }else {
                
                [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
            }
            
            if (isLastPage) {
                [weakSelf.otherTableView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [weakSelf.otherTableView.mj_footer endRefreshing];
            }
            
            [weakSelf.otherTableView.mj_header endRefreshing];
            [weakSelf.otherTableView reloadData];
        } failed:^(NSString *errorMsg) {
            [weakSelf.otherTableView.mj_header endRefreshing];
        }];
    }];
    
    _otherTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.viewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
            
            if (doHaveData) {
                
            }else {
                
                [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
                [weakSelf.otherTableView.mj_footer endRefreshing];
            }
            
            if (isLastPage) {
                [weakSelf.otherTableView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [weakSelf.otherTableView.mj_footer endRefreshing];
            }
            [weakSelf.otherTableView reloadData];
        } failed:^(NSString *errorMsg) {
            [weakSelf.otherTableView.mj_footer endRefreshing];
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
    
    JXFoodCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    tableCell.goodsNameLabel.text = [self.viewModel goodsName:indexPath];
    tableCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.viewModel goodsPrice:indexPath]];
     tableCell.sellingPointLable.text = [self.viewModel sellingPointText:indexPath];
    [tableCell setDataArray:[NSMutableArray arrayWithArray:[self.viewModel goodsLable:indexPath]]];
    
    tableCell.ShopCartBtnClickBlock = ^(UIButton *btn) {
        __block NSError *Error = nil;
        [XYShoppingCartNet netCartAddWithProductId:[self.viewModel productID:indexPath] block:^(NSDictionary *blockDictionary, NSError *error) {
            Error = error;
        }];
        return Error;
    };

    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId = [self.viewModel productID:indexPath];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[JXFoodheaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 46.)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 46.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JXFoodheaderViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JXFoodheaderViewModel alloc] init];
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

- (void)viewDidDisappear:(BOOL)animated{
    [self.otherTableView.mj_header endRefreshing];
    [self.otherTableView.mj_footer endRefreshing];
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
