//
//  XYMyBoardBandRenewalListVC.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandRenewalListVC.h"
#import "XYBoardBandRenewalCell.h"
#import "XYBoardBandNet.h"

#import "XYBoardBandListModel.h"
#import "XYBoardBandRenewalDetailVC.h"
@interface XYMyBoardBandRenewalListVC ()<UITableViewDelegate,UITableViewDataSource>

/** 续约列表 */
@property(nonatomic,strong) UITableView * renewalListTable;
/** 数据 */
@property(strong,nonatomic) NSMutableArray *dataArr ;

@end

static NSString *const XYBoardBandRenewalCellID = @"XYBoardBandRenewalCell";

@implementation XYMyBoardBandRenewalListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"续约记录";
    self.view.backgroundColor = XYGlobalBg;
    
    [self dataFromNet];
    [self.renewalListTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
}
-(void)dataFromNet{

    
    WeakSelf;
    [self.dataArr removeAllObjects];
    [XYBoardBandNet netBoardBandRenewalWithParam:[NSMutableDictionary dictionary] block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            NSArray *arr = [blockDictionary objectForKey:@"renewalList"];
            
            for (NSDictionary *dic in arr) {
                XYBoardBandListModel *model = [XYBoardBandListModel mj_objectWithKeyValues:dic];
                [weakSelf.dataArr addObject:model];
            }
            

        }
        
        [weakSelf.renewalListTable reloadData];
    }];

}

-(UITableView *)renewalListTable
{
    if (!_renewalListTable) {
        _renewalListTable = [[UITableView alloc] init];
        
        [self.view addSubview:_renewalListTable];
        _renewalListTable.backgroundColor = XYGlobalBg;
        _renewalListTable.delegate = self;
        _renewalListTable.dataSource = self;
        _renewalListTable.showsVerticalScrollIndicator = NO;
        _renewalListTable.showsHorizontalScrollIndicator = NO;
        _renewalListTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _renewalListTable.tableFooterView = [UIView new];
        [_renewalListTable registerClass:[XYBoardBandRenewalCell class] forCellReuseIdentifier:XYBoardBandRenewalCellID];
    }
    
    return _renewalListTable;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    [tableView tableViewDisPlayType:XYTableViewEmptyType_no_boardband ifNecessaryForRowCount:self.dataArr.count target:self buttonAction:nil];
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYBoardBandRenewalCell *cell = [tableView dequeueReusableCellWithIdentifier:XYBoardBandRenewalCellID forIndexPath:indexPath];
    
    XYBoardBandListModel *model = self.dataArr[indexPath.row];
    cell.titleLab.text = model.productName;
    cell.timeLab.text = model.createTime;
    cell.statusLab.text = model.state;
    
    if ([model.state isEqualToString:@"已失效"]) {
        cell.statusLab.textColor = XYGrayColor;
    }else
    {
        cell.statusLab.textColor = XYMainColor;
    }
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYBoardBandListModel *model = self.dataArr[indexPath.row];
    XYBoardBandRenewalDetailVC *detailVC = [XYBoardBandRenewalDetailVC new];
    detailVC.renewalId = model.renewalId;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}


@end
