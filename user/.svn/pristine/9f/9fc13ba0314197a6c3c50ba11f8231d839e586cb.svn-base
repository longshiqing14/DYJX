//
//  XYOrderDetailSubClassOrderDetailAddressVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailAddressVC.h"

#import "XYOrderDetailSubClassOrderDetailAddressTVCell.h"
#import "XYOrderDetailSubClassOrderDetailAddressFooterView.h"
#import "XYOrderDetailTitleModel.h"

#import "XYOrderDetailModel.h"

@interface XYOrderDetailSubClassOrderDetailAddressVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;


/** 头 数据 收件人 */
@property (nonatomic, copy) NSString * headerNameString;
/** 头 数据 电话 */
@property (nonatomic, copy) NSString * headerPhoneString;
/** 头 数据 地址 */
@property (nonatomic, copy) NSString * headerAddressString;

@property(nonatomic,strong)NSString *oderTYPE;

@end

@implementation XYOrderDetailSubClassOrderDetailAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = XYWhiteColor;
    self.tableView.scrollEnabled = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}


- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

//- (void)updataOrderAddressViewDataBuyerInfoModel:(XYOrderDetailBuyerInfoModel*)buyerInfoModel
//                                createTimeFormat:(NSString*)createTimeFormat
//                                  orderAliasCode:(NSString*)orderAliasCode
//                                deliveryRuleName:(NSString*)deliveryRuleName
//                                     paymentName:(NSString*)paymentName
- (void)setDetailModel:(XYOrderDetailModel *)detailModel OderType:(NSString *)oderType
{
    _detailModel = detailModel;
    _oderTYPE=oderType;
    self.headerNameString = _detailModel.buyerInfo.userName;
    self.headerPhoneString = _detailModel.buyerInfo.mobile;
    self.headerAddressString = _detailModel.buyerInfo.address;
    
    
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    [array addObject:@{@"title":@"下单时间：",@"sub":_detailModel.formatCreateTime == nil ? @"" : _detailModel.formatCreateTime}];
    [array addObject:@{@"title":@"订单编号：",@"sub":_detailModel.aliasCode == nil ? @"" : _detailModel.aliasCode}];
    [array addObject:@{@"title":@"配送方式：",@"sub":_detailModel.deliveryRuleName == nil ? @"" : _detailModel.deliveryRuleName}];
    NSLog(@"%@",_detailModel.paymentName);
    if (![oderType isEqualToString:@"p100"]) {
        [array addObject:@{@"title":@"支付方式：",@"sub":_detailModel.paymentName == nil ? @"" : _detailModel.paymentName}];
    }
    NSLog(@"%@",_detailModel.descriptionCount);
    [array addObject:@{@"title":@"订单备注：",@"sub":_detailModel.descriptionCount == nil ? @"" : _detailModel.descriptionCount}];
    
    for (NSDictionary * dict in array) {
        XYOrderDetailTitleModel * model = [[XYOrderDetailTitleModel alloc]init];
        
        model.sub = dict[@"sub"];
        model.title = dict[@"title"];
        
        [self.dataSource addObject:model];
    }
    
    
    [self.tableView reloadData];
}





#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYOrderDetailTitleModel * model =self.dataSource[indexPath.row];
    NSLog(@"%@",_oderTYPE);
    if ([_oderTYPE isEqualToString:@"p112"]) {
        if ([model.title isEqualToString:@"订单备注："]) {
            return 30;
        }
    } else {
        if ([model.title isEqualToString:@"订单备注："]) {
            return 60;
        } else {
            return 30;
        }
    }
    
    return 30;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_detailModel == nil) {
        return 61;
    }else{
        if ([_detailModel.isDeliveryPoint isEqualToString:@"0"]) {
            return 61;
        }else{
            return 121;
        }
    }
    return 61;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderDetailSubClassOrderDetailAddressTVCell * cell = [XYOrderDetailSubClassOrderDetailAddressTVCell cellWithTableView:tableView];
    
    XYOrderDetailTitleModel * model = self.dataSource[indexPath.row];
    
    cell.titleLB.text = model.title;
    cell.subLB.text = model.sub;
    
    return cell;
}



- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XYOrderDetailSubClassOrderDetailAddressFooterView * headerView = [XYOrderDetailSubClassOrderDetailAddressFooterView headerWithTableView:tableView];
    
    
    if (_detailModel != nil  &&  [_detailModel.isDeliveryPoint isEqualToString:@"1"]) {
     
        headerView.deliveryAddressTitleLB.text = @"自提地址：";
        headerView.deliveryAddressLB.text = _detailModel.deliveryPointInfo.address;
        headerView.deliveryPhoneTitleLB.text = @"自提电话：";
        headerView.deliveryPhoneLB.text = _detailModel.deliveryPointInfo.mobile;
    }
    
    
    if (self.headerNameString != nil) {
        headerView.titleLB.text = @"收件人：";
    }
    headerView.titleNameLB.text = self.headerNameString;
    headerView.phoneLB.text = self.headerPhoneString;
    headerView.addressLB.text = self.headerAddressString;
    
    return headerView;
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
