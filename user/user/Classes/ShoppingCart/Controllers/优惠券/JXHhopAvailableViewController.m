//
//  JXHhopAvailableViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHhopAvailableViewController.h"
#import "JXShopCouponHeatView.h"
#import "JXHhopAvailableModel.h"
#import "JXShopCell.h"
#import "JXShopOpenCell.h"


static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellHeat=@"cellHeat";
@interface JXHhopAvailableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *availableTableView;
@property(nonatomic,strong)NSMutableArray<JXHhopAvailableBatchesModel*> *shopAvailableArray;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (nonatomic ,strong)NSMutableArray<NSNumber*> *recordClickedArray;
@end

@implementation JXHhopAvailableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"优惠券";
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    
    [user setObject:@"0" forKey:@"Available"];
    [_availableTableView registerNib:[UINib nibWithNibName:@"JXShopCell" bundle:nil] forCellReuseIdentifier:cellID];
    [_availableTableView registerNib:[UINib nibWithNibName:@"JXShopOpenCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [_availableTableView registerNib:[UINib nibWithNibName:@"JXShopCouponHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:cellHeat];
    _availableTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _shopAvailableArray=[[NSMutableArray alloc]init];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getUserCardSelectList];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (![self.recordClickedArray[section] boolValue]) {
        if (self.shopAvailableArray[section].explanationArr.count > 0) {
            return 1;
        }else{
            return 0;
        }
        
    }else{
        return self.shopAvailableArray[section].explanationArr.count;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.shopAvailableArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 26;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (![self.recordClickedArray[indexPath.section] boolValue]) {
        
        if (self.shopAvailableArray[indexPath.section].explanationArr.count > 1) {
            JXShopCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
            cell.block = ^(UIButton * button) {
                [weakSelf updateRecordArrayindex:indexPath.section];
                [tableView reloadSection:indexPath.section withRowAnimation:NO];
            };
            cell.contentLable.text = self.shopAvailableArray[indexPath.section].explanationArr[0];
            cell.content.text = self.shopAvailableArray[indexPath.section].explanationArr[1];
            
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
            cell.contentLable.text = self.shopAvailableArray[indexPath.section].explanationArr[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
        

    }else{
        JXShopOpenCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        cell.block = ^(UIButton * button) {
            [weakSelf updateRecordArrayindex:indexPath.row];
            [tableView reloadSection:indexPath.section withRowAnimation:NO];
        };
        if (indexPath.row > 0) {
            cell.button.hidden = YES;
        }else{
            cell.button.hidden = NO;
        }
        cell.contentLable.text = self.shopAvailableArray[indexPath.section].explanationArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
//    cell.textLabel.font=[UIFont systemFontOfSize:14];
    //    cell.textLabel.textColor=XYRGBAColor(32,32,32, 1); cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator; cell.textLabel.text=_listArray[indexPath.row] ;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __weak typeof(self)SelfWeek=self;
    JXShopCouponHeatView *heatView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeat];
    if (_shopAvailableArray.count>0) {
        [heatView heat_init:section ImageName:@"ic_used" shopModel:_shopAvailableArray[section]];
    }
    
    heatView.Clock = ^( BOOL isOpen) {
        NSLog(@"%@",isOpen?@"YES":@"NO");
        
        
    };
    
//    选择数量大于优惠券数量
    heatView.SelectClock = ^(BOOL isOpen, NSString *number) {
        if (_shopAvailableArray.count>0) {
            if (!isOpen) {
                number=@"0";
            }else{
                JXHhopAvailableBatchesModel *model=_shopAvailableArray[section];
                number=model.maxUseCount;
            }
            [SelfWeek setSelectedCard:_shopAvailableArray[section] SelectNumberVoucher:number Index:section];
            [_shopAvailableArray removeAllObjects];
        }
        
        
    };
    heatView.ClockPlus = ^(NSString *number) {
        
        if (_shopAvailableArray.count>0) {
            [SelfWeek setSelectedCard:_shopAvailableArray[section] SelectNumberVoucher:number Index:section];
             [_shopAvailableArray removeAllObjects];
        }
       
    };
//    最小
    heatView.ClockSmall = ^{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"调小了" dismissTimeInterval:1.0];
    };
//    加号
    return heatView;
}

-(void)Refresh:(NSInteger)refreshIndex{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:refreshIndex];
    [_availableTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 88;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    if (indexPath.row==0) {
    //        [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    //    }else
    //        [self performSegueWithIdentifier:@"JXMyBroadbandOrders" sender:nil];
    
}

-(void)setSelectedCard:(JXHhopAvailableBatchesModel *)model SelectNumberVoucher:(NSString *)selectNumberVoucher Index:(NSInteger) index{
    WeakSelf;
    NSLog(@"%@",selectNumberVoucher);
    NSLog(@"%@",self.cartId);
    NSLog(@"%@",model.oderID);
    [self network:@{@"cartId":self.cartId,@"selectedCardBatchAmounts":@[@{@"cardBatchId":model.oderID,@"selectedNumber":selectNumberVoucher}]} relativePath:kJXAPI_user_SelectedCard ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [weakSelf getUserCardSelectList];
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}


-(void)getUserCardSelectList{
    WeakSelf;
    NSLog(@"%@",self.cartId);
    [self network:@{@"cartId":self.cartId,@"listType":@"0"} relativePath:kJXAPI_user_CardSelectList ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXHhopAvailableModel *model=[JXHhopAvailableModel modelWithJSON:responseObject];
        NSLog(@"%@",model.availableCardBatches);
        [weakSelf.shopAvailableArray addObjectsFromArray:model.availableCardBatches];
        [weakSelf updateRecord:weakSelf.shopAvailableArray];
        
        [_availableTableView reloadData];
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 88;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray<JXHhopAvailableBatchesModel *> *)shopAvailableArray{
    if (!_shopAvailableArray) {
        _shopAvailableArray = [NSMutableArray array];
    }
    return _shopAvailableArray;
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
