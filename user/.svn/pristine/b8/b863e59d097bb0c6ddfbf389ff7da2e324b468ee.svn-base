//
//  JXGoodsDetailCouponViewController.m
//  user
//
//  Created by 岩  熊 on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXGoodsDetailCouponViewController.h"
#import "JXFullReduceGoodsPage.h"
#import "JXNotUsedViewModel.h"
#import "JXCouponActivityWebPage.h"
#import "JXShopCell.h"
#import "JXShopOpenCell.h"
#import "JXGoodsDetailCouponViewModel.h"
#import "JXCouponDetailHeaderView.h"

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellHeat=@"cellHeat";
@interface JXGoodsDetailCouponViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray<JXCouponDetailModel*> *listArray;
@property(nonatomic, strong)JXGoodsDetailCouponViewModel *ViewModel;

@property (nonatomic ,strong)NSMutableArray<NSNumber*> *recordClickedArray;

@end

@implementation JXGoodsDetailCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f]];
    
    [_tableView registerNib:[UINib nibWithNibName:@"JXShopCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_tableView registerNib:[UINib nibWithNibName:@"JXShopOpenCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [_tableView registerNib:[UINib nibWithNibName:@"JXCouponDetailHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:cellHeat];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [UIView new];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kScreenHeight - 164 - 46 - 10 - 10);
    }];
    
    [self addHeaderFooter];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)addHeaderFooter{
    WeakSelf;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ViewModel.requestDic setValue:self.activityIds forKey:@"activityIds"];
        [self.ViewModel refreshDataSuccess:^(BOOL isLastPage, BOOL isHaveData) {
            if (isHaveData) {

            }else {
                [weakSelf.tableView showNoDataCustomTipViewWithText:@"您暂无相关优惠券哦～" imageString:@"no_search" WithInset:80.];
            }
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf updateRecord:weakSelf.listArray];
            [weakSelf.tableView reloadData];

        } failed:^(NSString *errorMsg) {
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    }];
    
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf.ViewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
//            
//            if (doHaveData) {
//                
//            }else {
//                
//                [weakSelf.tableView showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
//                [weakSelf.tableView.mj_header endRefreshing];
//            }
//            [weakSelf updateRecord:weakSelf.listArray];
//            if (isLastPage) {
//                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
//            }else {
//                [weakSelf.tableView.mj_footer endRefreshing];
//            }
//            [weakSelf.tableView reloadData];
//        } failed:^(NSString *errorMsg) {
//            [weakSelf.tableView.mj_footer endRefreshing];
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
    JXCouponDetailHeaderView *heatView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeat];
    //    JXMyAleadyUsedHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAleadyUsedHeatView" owner:self options:nil]lastObject];
    heatView.alpha = 0;
    [heatView heat_init:section ImageName:@"ic_used" couponModel:self.listArray[section]];


    heatView.UseClock = ^(){
        if ([SelfWeek.listArray[section].statu isEqualToString:@"0"]) {
            //立即领取
            if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
            [YWDPopupControl hide];
            [XYCommon setPresentViewControllerWithLoginView];
            return;
            }else{
                [SelfWeek.ViewModel receiveCouponWithActiveId:SelfWeek.listArray[section].activeId Success:^(BOOL isLastPage, NSString *desc) {
                    [YDBAlertView showToast:desc];
                    SelfWeek.listArray[section].statu = @"1";
                    [tableView reloadSection:section withRowAnimation:(UITableViewRowAnimationNone)];
                } failed:^(NSString *errorMsg) {
                    [YDBAlertView showToast:errorMsg];
                }];
            }
            
        }else if ([SelfWeek.listArray[section].statu isEqualToString:@"1"]){
          //立即使用
            if ([SelfWeek.listArray[section].isEnableType isEqualToString:@"0"]) {

                [YWDPopupControl hide];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"activityCouponViewClick" object:[SelfWeek.listArray[section].activityUrl stringByAppendingString:[NSString stringWithFormat:@"?activeId=%@",SelfWeek.listArray[section].activeId]]];
                
            }else if ([SelfWeek.listArray[section].isEnableType isEqualToString:@"1"]){
                [YWDPopupControl hide];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"fullReduceCouponViewClick" object:SelfWeek.listArray[section].activeId];

            }else if ([SelfWeek.listArray[section].isEnableType isEqualToString:@"2"]){
                [YWDPopupControl hide];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"fullReduceCouponViewClick" object:nil];

            }
            
        }else if ([SelfWeek.listArray[section].statu isEqualToString:@"2"]){
           //已使用
        }
        
    };
    return heatView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *footView = [[UITableViewHeaderFooterView alloc]init];
     footView.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
    return footView;
}

-(void)Refresh:(NSInteger)refreshIndex{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:refreshIndex];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic]; }

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 88;
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

- (JXGoodsDetailCouponViewModel *)ViewModel{
    if (!_ViewModel) {
        _ViewModel = [[JXGoodsDetailCouponViewModel alloc]init];
    }
    return _ViewModel;
}

- (IBAction)DisMissPopView:(UIButton *)sender {
//    [YWDPopupControl hide];
//    [self dismissViewControllerAnimated:YES completion:^{
//
//    }];
    [self disMiss];
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

-(void)disMiss{
    if (self.dissViewController) {
        self.dissViewController(self);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self disMiss];
}
@end
