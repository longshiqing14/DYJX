//
//  JXMyAfterSaleDetailViewController.m
//  user
//  退货/退款申请单
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailViewController.h"
#import "JXMyAfterSaleDetailCell.h"
#import "JXMyAfterSaleDetailModel.h"
#import "JXMyAfterSaleDetailsView.h"
#import "JXMyAfterSaleDetailDescribeCell.h"
#import "JXMyAfterSaleDetailImageControllerCell.h"
#import "JXMyAfterSaleDetailInformationCell.h"
#import "JXMyAfterSaleDetailFootView.h"
#import "JXRefundCashPage.h"
#import "NetWorkTool.h"
#import "JXMyOrderDetailsViewController.h"
#import "JXMyRefundAfterSaleViewController.h"
#import "JXMyAfterSaleDetailLineFootView.h"
#import "JXMyAfterSaleDetailsReasonsCell.h"

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellID2=@"cellID2";
static NSString *cellID3=@"cellID3";
static NSString *cellID4=@"cellID4";

@interface JXMyAfterSaleDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myAfterSaleDetailTableView;
@property(nonatomic,strong)NSMutableArray *myAfterSaleDetailArray;
@property(nonatomic,strong)JXMyAfterSaleDetailModel *myAfterSaleDetailModel;
@end

@implementation JXMyAfterSaleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"退货/退款申请单";
    [self myRefundAfterSaleUI];
    [self.myAfterSaleDetailTableView.mj_header beginRefreshing];
    if (!self.isRefundCashPage) {
        [self myAfterSaleDetailNavUI];
    }
    

}

-(void)black_controller{
    if (self.isRefundCashPage) {
        for (UIViewController *temp in self.navigationController.viewControllers) {
            if ([temp isKindOfClass:[JXMyOrderDetailsViewController class]]||[temp isKindOfClass:[JXMyRefundAfterSaleViewController class]]) {
                [self.navigationController popToViewController:temp animated:YES];
            }
        }
    }else{
        [super black_controller];
    }
}

-(void)myAfterSaleDetailNavUI{
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"查看订单" style:(UIBarButtonItemStylePlain) target:self action:@selector(orderetails)];
    [item setTintColor:XYRGBAColor(0, 0, 0, 1)];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];

    self.navigationItem.rightBarButtonItem=item;
}

-(void)orderetails
{
    JXMyOrderDetailsViewController *myOrderDetailsViewController=[[JXMyOrderDetailsViewController alloc]init];
    myOrderDetailsViewController.orderID=_myAfterSaleDetailModel.orderAliasCode;
    [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
}

-(void)myAfterSaleDetailData{
    WeakSelf;
//    2018041815393037097
    [self network:@{@"orderRefundID":self.orderRefundID} relativePath:kJXAPI_user_OrderRefundDetail ShowAndDismiss:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _myAfterSaleDetailModel=[JXMyAfterSaleDetailModel modelWithJSON:responseObject];
        [weakSelf myAfterSaleDetailUpdate];
        [weakSelf.myAfterSaleDetailTableView.mj_header  endRefreshing];
        [weakSelf.myAfterSaleDetailTableView reloadData];
        NSLog(@"%@",_myAfterSaleDetailModel);
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
    
}

-(void)myAfterSaleDetailUpdate{
    [self.myAfterSaleDetailArray removeAllObjects];
//    订单状态进度
    [self.myAfterSaleDetailArray addObject:_myAfterSaleDetailModel.processFlow];
//    申请原因
    [self.myAfterSaleDetailArray addObject:@[@{@"title":@"申请原因：",@"value":[NetWorkTool stringfilter: _myAfterSaleDetailModel.reason.name]}]];
//    问题描述
    [self.myAfterSaleDetailArray addObject:@[@{@"title":@"",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.problem]}]];
//    图片
    [self.myAfterSaleDetailArray addObject:@[_myAfterSaleDetailModel.images]];
//    售后单号 申请时间 订单号
    NSMutableArray *afterSaleOrderInformationArray=[[NSMutableArray alloc]init];
    
    [afterSaleOrderInformationArray addObject:@{@"title":@"售后单号：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.orderRefundNo]}];
    [afterSaleOrderInformationArray addObject:@{@"title":@"申请时间：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.createTime]}];
    [afterSaleOrderInformationArray addObject:@{@"title":@"订单编号：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.orderAliasCode]}];
    [self.myAfterSaleDetailArray addObject:afterSaleOrderInformationArray];
//    订单金额
    
    [self.myAfterSaleDetailArray addObject:@[@{@"title":@"订单金额：",@"value":[NSString stringWithFormat:@"¥%@",[NetWorkTool stringManipulation:_myAfterSaleDetailModel.totalOrderPayPrice]]}]];
    NSMutableArray *contactInformationArray=[[NSMutableArray alloc]init];
    [contactInformationArray addObject:@{@"title":@"联系人：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.contacts]}];
    [contactInformationArray addObject:@{@"title":@"联系电话：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.mobilePhone]}];
    [contactInformationArray addObject:@{@"title":@"取货地址：",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.addressInfo]}];
    [self.myAfterSaleDetailArray addObject:contactInformationArray];
//   是否显示审核留言
    if (![_myAfterSaleDetailModel.applyStatus isEqualToString:@"0"]) {
        [self.myAfterSaleDetailArray addObject:@[@{@"title":@"",@"value":[NetWorkTool stringfilter:_myAfterSaleDetailModel.applyMessage]}]];
    }else{
        [self.myAfterSaleDetailArray addObject:@[@{@"title":@"",@"value":@""}]];
    }
    
}


-(NSMutableArray *)myAfterSaleDetailArray{
    if (!_myAfterSaleDetailArray) {
        _myAfterSaleDetailArray=[[NSMutableArray alloc]init];
    }
    return _myAfterSaleDetailArray;
}

-(void)myRefundAfterSaleUI{
    WeakSelf;
    [self.myAfterSaleDetailTableView registerNib:[UINib nibWithNibName:@"JXMyAfterSaleDetailCell" bundle:nil] forCellReuseIdentifier:cellID];
     [self.myAfterSaleDetailTableView registerNib:[UINib nibWithNibName:@"JXMyAfterSaleDetailDescribeCell" bundle:nil] forCellReuseIdentifier:cellID1];
     [self.myAfterSaleDetailTableView registerNib:[UINib nibWithNibName:@"JXMyAfterSaleDetailInformationCell" bundle:nil] forCellReuseIdentifier:cellID2];
    [self.myAfterSaleDetailTableView registerNib:[UINib nibWithNibName:@"JXMyAfterSaleDetailImageControllerCell" bundle:nil] forCellReuseIdentifier:cellID3];
    [self.myAfterSaleDetailTableView registerNib:[UINib nibWithNibName:@"JXMyAfterSaleDetailsReasonsCell" bundle:nil] forCellReuseIdentifier:cellID4];
    self.myAfterSaleDetailTableView.estimatedRowHeight = 1000;

    [self.view addSubview:self.myAfterSaleDetailTableView];
    [self.myAfterSaleDetailTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    // 下拉刷新
    self.myAfterSaleDetailTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf myAfterSaleDetailData];
        // 结束刷新
        //            [weakSelf.tableView.mj_header endRefreshing];
    }];
//    // 上拉刷新
//    self.myAfterSaleDetailTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//
//        // 结束刷新
//        //            [ self.tableView.mj_footer endRefreshing];
//    }];
}

-(UITableView *)myAfterSaleDetailTableView{
    if (!_myAfterSaleDetailTableView) {
        _myAfterSaleDetailTableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _myAfterSaleDetailTableView.backgroundColor = XYRGBAColor(244, 244, 244, 1);

        _myAfterSaleDetailTableView.contentInset = UIEdgeInsetsMake(0, 0, -20, 0); _myAfterSaleDetailTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _myAfterSaleDetailTableView.backgroundColor=XYRGBAColor(244, 244, 244, 1);
        _myAfterSaleDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _myAfterSaleDetailTableView.tableFooterView=nil; _myAfterSaleDetailTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _myAfterSaleDetailTableView.delegate=self;
        _myAfterSaleDetailTableView.dataSource=self;
        
    }
    return _myAfterSaleDetailTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myAfterSaleDetailArray[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.myAfterSaleDetailArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
//        订单申请进度 申请原因
        return 55;
    }else if (indexPath.section==1||indexPath.section==5){
        return UITableViewAutomaticDimension;

    }else if (indexPath.section==2||indexPath.section==7){
        NSDictionary *dic=self.myAfterSaleDetailArray[indexPath.section][indexPath.row];
            //        问题描述 审核留言
            if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
                return 0;
            }
            return UITableViewAutomaticDimension;

    }else if (indexPath.section==3){
        NSArray *images=self.myAfterSaleDetailArray[indexPath.section][indexPath.row];
        if (images.count>4) {
            return (XYScreenW-55)/4*2+60;
        }else if (images.count<=4&&images.count>0){
           return (XYScreenW-55)/4+60;
        }
        return 0;
    }else if (indexPath.section==4||indexPath.section==6){
        return 29.5;
    }
    return 0;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        JXMyAfterSaleDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        NSArray *SpeedProgress=self.myAfterSaleDetailArray[indexPath.section];
        [cell cell_init:SpeedProgress[indexPath.row]];
       
        if (indexPath.row==0) {
            if (SpeedProgress.count==1) {
                cell.topLine.hidden=YES;
                cell.downLine.hidden=YES;
                cell.cellSpeedProgressLable.textColor=XYRGBAColor(236, 59, 44, 1); cell.roundDot.backgroundColor=XYRGBAColor(236, 59, 44, 1);
            }else{
                cell.topLine.hidden=YES; cell.roundDot.backgroundColor=XYRGBAColor(236, 59, 44, 1);
                cell.cellSpeedProgressLable.textColor=XYRGBAColor(236, 59, 44, 1);
                cell.downLine.hidden=NO;
            }
            
        }else{
            cell.topLine.hidden=NO;             cell.roundDot.backgroundColor=XYRGBAColor(153, 153, 153, 1);
            cell.cellSpeedProgressLable.textColor=XYRGBAColor(51, 51, 51, 1);
            cell.downLine.hidden=NO;
            if (indexPath.row==SpeedProgress.count-1) {
                cell.downLine.hidden=YES;
            }else{
                
            }
        }
        return cell;
    }else if (indexPath.section==1){
        JXMyAfterSaleDetailsReasonsCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID4 forIndexPath:indexPath];
        NSDictionary *dic=self.myAfterSaleDetailArray[indexPath.section][indexPath.row];
        [cell cell_init:dic];
        return cell;
    } else if (indexPath.section==2||indexPath.section==7){
//        问题描述 审核留言
        JXMyAfterSaleDetailDescribeCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        NSDictionary *dic=self.myAfterSaleDetailArray[indexPath.section][indexPath.row];
        [cell cell_init:dic Index:indexPath.section];
        return cell;
    }else if (indexPath.section==3){
//        图片
        JXMyAfterSaleDetailImageControllerCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID3 forIndexPath:indexPath];
        [cell cell_init:self.myAfterSaleDetailArray[indexPath.section][indexPath.row] ImageMaxArray:self.myAfterSaleDetailArray[indexPath.section][indexPath.row]];
        return cell;
    }else{
        JXMyAfterSaleDetailInformationCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID2 forIndexPath:indexPath];
         NSDictionary *dic=self.myAfterSaleDetailArray[indexPath.section][indexPath.row];
        [cell cell_init:dic IndexPath:indexPath];
        return cell;
    }
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
//        退货单状态
        JXMyAfterSaleDetailsView *myAfterSaleDetailsView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAfterSaleDetailsView" owner:self options:nil]lastObject];
        [myAfterSaleDetailsView myAfterSaleDetails:_myAfterSaleDetailModel.applicationStatus];
        return myAfterSaleDetailsView;
    }
    
    return [UIView new];;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 22.5;
    }else if (section==4||section==5||section==6) {
        
        return 25;
    }else if(section==7){
        NSLog(@"%@",_myAfterSaleDetailModel.applyStatus);
        if ([_myAfterSaleDetailModel.applyStatus isEqualToString:@"2"]) {
            return 90;
        }
    }
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0||section==4||section==5||section==6) {
            return self.lineFootView;
    }else if(section==7){
        if ([_myAfterSaleDetailModel.applyStatus isEqualToString:@"2"]) {
            JXMyAfterSaleDetailFootView *myAfterSaleDetailFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAfterSaleDetailFootView" owner:self options:nil]lastObject];
            WeakSelf;
            myAfterSaleDetailFootView.Clock = ^{
                [weakSelf refund];
            };
            return myAfterSaleDetailFootView;
        }
    }
    return [UIView new];
}

-(JXMyAfterSaleDetailLineFootView *)lineFootView{
    JXMyAfterSaleDetailLineFootView *myAfterSaleDetailLineFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAfterSaleDetailLineFootView" owner:self options:nil]lastObject];
    return myAfterSaleDetailLineFootView;
}

-(UIView *)footViewUI{
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor =XYRGBAColor(244, 244, 244, 1);
    return footView;
}

-(UIView *)headViewUI{
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor =XYRGBAColor(255, 255, 255, 1);
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 59;
    }
    return CGFLOAT_MIN;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

-(void)refund{
    JXRefundCashPage *refundCashPage=[[JXRefundCashPage alloc]init];
    refundCashPage.orderId = _myAfterSaleDetailModel.ID;
    refundCashPage.refundModel=_myAfterSaleDetailModel;
    [self.navigationController pushViewController:refundCashPage animated:YES];
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
