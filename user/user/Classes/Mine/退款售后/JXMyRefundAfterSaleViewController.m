//
//  JXMyRefundAfterSaleViewController.m
//  user
//  我的售后
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyRefundAfterSaleViewController.h"
#import "JXMyRefundAfterSaleCell.h"
#import "JXMyAfterSaleDetailViewController.h"
#import "JXMyRefundAfterSaleModel.h"

static NSString *cellID=@"cellID";

@interface JXMyRefundAfterSaleViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger number;
}
@property(nonatomic,strong)UITableView *myRefundAfterSaleTableView;
@property(nonatomic,strong)NSMutableArray *myRefundAfterSaleArray;
@end

@implementation JXMyRefundAfterSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的售后";
    [self myRefundAfterSaleUI];
    [self.myRefundAfterSaleTableView.mj_header beginRefreshing];
}


//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
////    [self myRefundAfterSaleData];
//}

-(NSMutableArray *)myRefundAfterSaleArray{
    if (!_myRefundAfterSaleArray) {
        _myRefundAfterSaleArray=[[NSMutableArray alloc]init];
    }
    return _myRefundAfterSaleArray;
}

-(void)myRefundAfterSaleUI{
    [self.myRefundAfterSaleTableView registerNib:[UINib nibWithNibName:@"JXMyRefundAfterSaleCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.view addSubview:self.myRefundAfterSaleTableView];
    [self.myRefundAfterSaleTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    WeakSelf;

    // 下拉刷新
    self.myRefundAfterSaleTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        number=1;
        [weakSelf.myRefundAfterSaleArray removeAllObjects];
        [weakSelf myRefundAfterSaleData];
            // 结束刷新
//            [weakSelf.tableView.mj_header endRefreshing];
    }];
    // 上拉刷新
    self.myRefundAfterSaleTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        number=number+1;
        [weakSelf myRefundAfterSaleData];
            // 结束刷新
//            [ self.tableView.mj_footer endRefreshing];
    }];

}

-(void)afterSaleDetailNoDataView{
    if (self.myRefundAfterSaleArray.count>0) {
        self.myRefundAfterSaleTableView.tableFooterView=[UIView new];
    }else{
        self.myRefundAfterSaleTableView.tableFooterView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAfterSaleDetailNoDataView" owner:self options:nil]lastObject];;
    }
}

-(void)myRefundAfterSaleData{
    WeakSelf;
    [self network:@{@"page":@(number),@"page_size":@10} relativePath:kJXAPI_user_OrderRefundList ShowAndDismiss:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXMyRefundAfterSaleModel *myRefundAfterSaleModel=[JXMyRefundAfterSaleModel modelWithJSON:responseObject];
        [weakSelf.myRefundAfterSaleArray addObjectsFromArray:myRefundAfterSaleModel.orderRefundList];
        [weakSelf.myRefundAfterSaleTableView.mj_footer endRefreshing];
        [weakSelf.myRefundAfterSaleTableView.mj_header  endRefreshing];
        [weakSelf afterSaleDetailNoDataView];
        [weakSelf.myRefundAfterSaleTableView reloadData];
        NSLog(@"%@",myRefundAfterSaleModel);
    } failure:^{
        [weakSelf.myRefundAfterSaleTableView.mj_footer endRefreshing];
        [weakSelf.myRefundAfterSaleTableView.mj_header  endRefreshing];
        [weakSelf afterSaleDetailNoDataView];
    } UnusualFailure:^{
        [weakSelf.myRefundAfterSaleTableView.mj_footer endRefreshing];
        [weakSelf.myRefundAfterSaleTableView.mj_header  endRefreshing];
        [weakSelf afterSaleDetailNoDataView];
    }];
    
}

-(UITableView *)myRefundAfterSaleTableView{
    if (!_myRefundAfterSaleTableView) {
        _myRefundAfterSaleTableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
       _myRefundAfterSaleTableView.contentInset = UIEdgeInsetsMake(0, 0, -20, 0); _myRefundAfterSaleTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _myRefundAfterSaleTableView.backgroundColor=XYRGBAColor(244, 244, 244, 1);
       _myRefundAfterSaleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//       _myRefundAfterSaleTableView.tableFooterView=nil; _myRefundAfterSaleTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _myRefundAfterSaleTableView.delegate=self;
        _myRefundAfterSaleTableView.dataSource=self;
        
    }
    return _myRefundAfterSaleTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.myRefundAfterSaleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JXMyRefundAfterSaleCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    [cell cell_init:self.myRefundAfterSaleArray[indexPath.section]];
    return cell;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *heatView = [[UIView alloc]init];
    heatView.backgroundColor =XYRGBAColor(244, 244, 244, 1);
    return heatView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JXMyRefundAfterSaleOrderRefundListModel *model= self.myRefundAfterSaleArray[indexPath.section];
    JXMyAfterSaleDetailViewController *myAfterSaleDetailViewController=[[JXMyAfterSaleDetailViewController alloc]init];
    myAfterSaleDetailViewController.orderRefundID=model.ID;
    [self.navigationController pushViewController:myAfterSaleDetailViewController animated:YES];
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
