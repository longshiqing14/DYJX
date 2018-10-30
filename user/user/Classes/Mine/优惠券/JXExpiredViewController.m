//
//  JXExpiredViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXExpiredViewController.h"
#import "JXMyAleadyUsedHeatView.h"
#import "JXExpiredViewModel.h"
#import "JXShopCell.h"
#import "JXShopOpenCell.h"

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellHeat=@"cellHeat";
@interface JXExpiredViewController ()
@property (weak, nonatomic) IBOutlet UITableView *usedTableView;
@property(nonatomic,strong)NSMutableArray<JXCouponDetailModel*> *listArray;
@property(nonatomic,strong)NSMutableArray *isArray;
@property(nonatomic, strong)JXExpiredViewModel *ViewModel;
@property (nonatomic ,strong)NSMutableArray<NSNumber*> *recordClickedArray;
@end

@implementation JXExpiredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXShopCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXShopOpenCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXMyAleadyUsedHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:cellHeat];
    
    [self addHeaderFooter];
    self.usedTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.usedTableView setSeparatorColor:[UIColor clearColor]];
    [self.usedTableView.mj_header beginRefreshing];
}

- (void)addHeaderFooter{
    WeakSelf;
    self.usedTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ViewModel refreshDataSuccess:^(BOOL isLastPage, BOOL isHaveData) {
            if (isHaveData) {
                [weakSelf.usedTableView removeTipViewFromSelf];
            }else {
                [weakSelf.usedTableView showNoDataCustomTipViewWithText:@"您暂无相关优惠券哦～" imageString:@"no_search" WithInset:80.];
            }
            [weakSelf.usedTableView.mj_header endRefreshing];
            [weakSelf updateRecord:weakSelf.listArray];
            [weakSelf.usedTableView reloadData];
        } failed:^(NSString *errorMsg) {
            [weakSelf.usedTableView.mj_header endRefreshing];
        }];
    }];
    
//    self.usedTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf.ViewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
//            
//            if (doHaveData) {
//                
//            }else {
//                
//                [weakSelf.usedTableView showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
//                [weakSelf.usedTableView.mj_header endRefreshing];
//            }
//            [weakSelf updateRecord:weakSelf.listArray];
//            if (isLastPage) {
//                [weakSelf.usedTableView.mj_footer endRefreshingWithNoMoreData];
//            }else {
//                [weakSelf.usedTableView.mj_footer endRefreshing];
//            }
//            [weakSelf.usedTableView reloadData];
//        } failed:^(NSString *errorMsg) {
//            [weakSelf.usedTableView.mj_footer endRefreshing];
//        }];
//    }];
    
}

- (void)updateRecord:(NSMutableArray*)array{
    for (int i = 0; i < array.count; i ++) {
        [self.recordClickedArray addObject:[NSNumber numberWithBool:NO]];
    }
}

- (void)updateRecordArrayindex:(NSInteger)index{
    [self.recordClickedArray replaceObjectAtIndex:index withObject:[self.recordClickedArray[index] boolValue]? [NSNumber numberWithBool:NO] : [NSNumber numberWithBool:YES]];
}

- (NSMutableArray<NSNumber*> *)recordClickedArray{
    if (!_recordClickedArray) {
        _recordClickedArray = [NSMutableArray array];
    }
    return _recordClickedArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (![self.recordClickedArray[section] boolValue]) {
        if (self.listArray[section].explanationArr.count > 0) {
            return 1;
        }else{
            return 0;
        }
        
    }else{
        return self.listArray[section].explanationArr.count;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.ViewModel numberOfCell];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 26;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (![self.recordClickedArray[indexPath.section] boolValue]) {
        
        if (self.listArray[indexPath.section].explanationArr.count > 1) {
            JXShopCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
            cell.block = ^(UIButton * button) {
                [weakSelf updateRecordArrayindex:indexPath.section];
                [tableView reloadSection:indexPath.section withRowAnimation:NO];
            };
            cell.contentLable.text = self.listArray[indexPath.section].explanationArr[0];
            cell.content.text = self.listArray[indexPath.section].explanationArr[1];
            
            if (indexPath.row > 0) {
                cell.button.hidden = YES;
            }else{
                cell.button.hidden = NO;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.circular setBackgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
            [cell.circularLable setBackgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
            return cell;
        }else{
            JXShopOpenCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
            cell.block = ^(UIButton * button) {
                [weakSelf updateRecordArrayindex:indexPath.section];
                [tableView reloadSection:indexPath.section withRowAnimation:NO];
            };
            //            if (indexPath.row > 0) {
            cell.button.hidden = YES;
            //            }else{
            //                cell.button.hidden = NO;
            //            }
            cell.contentLable.text = self.listArray[indexPath.section].explanationArr[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.circularLable setBackgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
            return cell;
        }
        
        
        
    }else{
        JXShopOpenCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        cell.block = ^(UIButton * button) {
            [weakSelf updateRecordArrayindex:indexPath.section];
            [tableView reloadSection:indexPath.section withRowAnimation:NO];
        };
        if (indexPath.row > 0) {
            cell.button.hidden = YES;
        }else{
            cell.button.hidden = NO;
        }
        cell.contentLable.text = self.listArray[indexPath.section].explanationArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.circularLable setBackgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
        return cell;
    }
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __weak typeof(self)SelfWeek=self;
    JXMyAleadyUsedHeatView *heatView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeat];
    //    JXMyAleadyUsedHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAleadyUsedHeatView" owner:self options:nil]lastObject];
    [heatView heat_init:section ImageName:@"ic_overdue" couponModel:self.listArray[section]];
    heatView.Clock = ^(NSInteger index, BOOL isOpen) {
        NSLog(@"%@",isOpen?@"YES":@"NO");
        [_isArray replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:isOpen]];
        NSLog(@"%lu",(unsigned long)_isArray.count);
        [SelfWeek Refresh:index];
    };
    return heatView;
}

-(void)Refresh:(NSInteger)refreshIndex{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:refreshIndex];
    [_usedTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic]; }

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 88;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *footView = [[UITableViewHeaderFooterView alloc]init];
    footView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    if (indexPath.row==0) {
    //        [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    //    }else
    //        [self performSegueWithIdentifier:@"JXMyBroadbandOrders" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray<JXCouponDetailModel*> *)listArray{
    if (!_listArray) {
        _listArray = [self.ViewModel getJXCouponDataLiat];
    }
    return _listArray;
}

- (JXExpiredViewModel *)ViewModel{
    if (!_ViewModel) {
        _ViewModel = [[JXExpiredViewModel alloc]init];
    }
    return _ViewModel;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 88;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
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
