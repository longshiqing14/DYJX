//
//  JXNotUsedViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXNotUsedViewController.h"
#import "JXNotUsedHeatView.h"
#import "JXFullReduceGoodsPage.h"
#import "JXNotUsedViewModel.h"
#import "JXCouponActivityWebPage.h"
#import "JXShopCell.h"
#import "JXShopOpenCell.h"

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellHeat=@"cellHeat";
@interface JXNotUsedViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *usedTableView;
@property(nonatomic,strong)NSMutableArray<JXCouponDetailModel*> *listArray;
@property(nonatomic, strong)JXNotUsedViewModel *ViewModel;
//兑换码
@property (weak, nonatomic) IBOutlet UITextField *redeemCodeTextField;
//兑换按钮
@property (weak, nonatomic) IBOutlet UIButton *exchangeButton;
@property (nonatomic ,strong)NSMutableArray<NSNumber*> *recordClickedArray;

@end

@implementation JXNotUsedViewController
//兑换
- (IBAction)exchangeClock:(id)sender {
    if ([YWDTools isNil:self.redeemCodeTextField.text]) {
        [YDBAlertView showToast:@"请输入优惠券兑换码！"];
    }else{
        [self.ViewModel exchangeCouponWithCode:self.redeemCodeTextField.text Success:^(BOOL isLastPage, NSString* desc) {
            [YDBAlertView showToast:desc dismissDelay:1.0];
        } failed:^(NSString *errorMsg) {
            
        }];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXShopCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXShopOpenCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [_usedTableView registerNib:[UINib nibWithNibName:@"JXNotUsedHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:cellHeat];
    _usedTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _usedTableView.tableFooterView = [UIView new];
   
    [self.exchangeButton reat:5]; [self.redeemCodeTextField reat:5];
    [self.redeemCodeTextField sideLine:1 SideLineColor:XYRGBAColor(228,228,228, 1)];
    self.redeemCodeTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
    self.redeemCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    [self addHeaderFooter];
    self.usedTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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
//            [weakSelf.usedTableView showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
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
    if (self.recordClickedArray.count<=0) {
        return 0;
    }
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
        return cell;
    }
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __weak typeof(self)SelfWeek=self;
    JXNotUsedHeatView *heatView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeat];
    //    JXMyAleadyUsedHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAleadyUsedHeatView" owner:self options:nil]lastObject];
    [heatView heat_init:section ImageName:@"ic_used" couponModel:self.listArray[section]];
    heatView.Clock = ^(NSInteger index, BOOL isOpen) {
        NSLog(@"%@",isOpen?@"YES":@"NO");
       
        [SelfWeek Refresh:index];
    };
    
    heatView.UseClock = ^(){
        if ([self.listArray[section].isEnableType isEqualToString:@"0"]) {
            JXCouponActivityWebPage *couponActivityWebPage = [[JXCouponActivityWebPage alloc]init];
            couponActivityWebPage.webURLstr = [self.listArray[section].activityUrl stringByAppendingString:[NSString stringWithFormat:@"?activeId=%@",self.listArray[section].activeId]];
            [SelfWeek.navigationController pushViewController:couponActivityWebPage animated:NO];
        }else if ([self.listArray[section].isEnableType isEqualToString:@"1"]){
            
            JXFullReduceGoodsPage *fullReduceGoodsPage = [[JXFullReduceGoodsPage alloc]init];
            fullReduceGoodsPage.activeId = self.listArray[section].activeId;
            [SelfWeek.navigationController pushViewController:fullReduceGoodsPage animated:NO];
        }else if ([self.listArray[section].isEnableType isEqualToString:@"2"]){
            [SelfWeek.navigationController.tabBarController setSelectedIndex:0];
            [SelfWeek.navigationController popToRootViewControllerAnimated:YES];
        }
        
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
    footView.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
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

#pragma lazy
- (NSMutableArray<JXCouponDetailModel*> *)listArray{
    if (!_listArray) {
        _listArray = [self.ViewModel getJXCouponDataLiat];
    }
    return _listArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JXNotUsedViewModel *)ViewModel{
    if (!_ViewModel) {
        _ViewModel = [[JXNotUsedViewModel alloc]init];
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
