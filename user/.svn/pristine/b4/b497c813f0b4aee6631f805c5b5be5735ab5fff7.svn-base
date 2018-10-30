//
//  JXMyBroadbandOrdersViewController.m
//  user
//  我的宽带订单
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyBroadbandOrdersViewController.h"
#import "JXMyBroadbandOrdersCell.h"
#import "XYPay.h"
#import "XYBaseModel.h"
#import "JXMyBroadbandOrdersModel.h"
#import "JXDetailsViewController.h"
#import "JXProcessingInformationViewController.h"
#import "JXMyBroadbandOrdersView.h"
#import "XYPreDepositVC.h"
#import "NetWorkTool.h"

static NSString *cellID=@"cellID";
@interface JXMyBroadbandOrdersViewController (){
    JXMyOrderListModel *orderListModel;
}
@property (weak, nonatomic) IBOutlet UITableView *myOdersTableView;
@property(nonatomic,strong)NSMutableArray *listArray;
@end

@implementation JXMyBroadbandOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setOrdersUI];
    [self getBroadbandOrders];
}

-(void)getBroadbandOrders{
    __weak typeof(self)SelfWeek=self;
    [NetWorkTool postRequest:[NSDictionary new] relativePath:@"ck.order.list" ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"responseObject%@",responseObject);
        
            JXMyDataOrdersModel *myDataOrdersModel=[JXMyDataOrdersModel mj_objectWithKeyValues:responseObject];
            [SelfWeek.listArray addObjectsFromArray:myDataOrdersModel.orderList];
            [SelfWeek BroadbandOrdersUI];
            [SelfWeek.myOdersTableView reloadData];
        
    } failure:^() {
        NSLog(@"服务器异常");
    } UnusualFailure:^{
        NSLog(@"网络异常");
    }];
}

-(void)BroadbandOrdersUI{
    if (self.listArray.count<=0) {
        JXMyBroadbandOrdersView *ordersView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandOrdersView" owner:self options:nil]lastObject];
        [ordersView oder_init:@"充值送宽带"];
        ordersView.frame=self.view.frame; self.myOdersTableView.tableFooterView=ordersView;
        ordersView.Clock = ^{
            XYPreDepositVC *detailVC = [[XYPreDepositVC alloc] init];
            detailVC.isProductList = @"Y";
            [self.navigationController pushViewController:detailVC animated:YES];
        };
    }else{
        self.myOdersTableView.tableFooterView=[[UIView alloc]init];
    }
}



-(void)setOrdersUI{
    self.title=@"我的宽带订单";
    [self.myOdersTableView registerNib:[UINib nibWithNibName:@"JXMyBroadbandOrdersCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.myOdersTableView.tableFooterView=[[UIView alloc]init];
}

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray=[[NSMutableArray alloc]init];
    }
    return _listArray;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.listArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return AutoSize(62);
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JXMyBroadbandOrdersCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    JXMyOrderListModel *Model=self.listArray[indexPath.row];
    [cell cell_init:Model];
    
    
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    orderListModel=self.listArray[indexPath.row];
    if ([orderListModel.isInstallInformationReady isEqualToString:@"0"]) {
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //这个字符串是你要跳转面板的名字
        JXProcessingInformationViewController *main =[board instantiateViewControllerWithIdentifier:@"JXProcessingInformationID"];
        main.oderID=orderListModel.aliasCode;
       
        [self.navigationController pushViewController:main animated:YES];
        
    }else{
        [self performSegueWithIdentifier:@"JXDetails" sender:nil];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"JXDetails"]) {
        JXDetailsViewController *details=[segue destinationViewController];
        
        details.oderID=orderListModel.aliasCode;
        
    }
}


@end
