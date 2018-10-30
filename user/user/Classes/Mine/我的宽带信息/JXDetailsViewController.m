//
//  JXDetailsViewController.m
//  user
//  宽带订单详情
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXDetailsViewController.h"
#import "XYPay.h"
#import "JXDetailsModel.h"
#import "JXDetailsCell.h"
#import "JXMyBroadbandAccountFootView.h"
#import "JXMyBroadbandAccountHeatView.h"

static NSString *cellID=@"cellID";
@interface JXDetailsViewController (){
    JXDetailsModel *detailsModel;
}
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;
@property(nonatomic,strong)NSMutableArray *listArray;
@end

@implementation JXDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"宽带订单详情";
    [self.detailsTableView registerNib:[UINib nibWithNibName:@"JXDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    JXMyBroadbandAccountFootView *footView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandAccountFootView" owner:self options:nil]lastObject];
    footView.frame=CGRectMake(0, 0, XYScreenW, 150);
    [footView foot_init:XYRGBAColor(236,59,44, 1) Title:@"查看宽带"];  self.detailsTableView.tableFooterView=footView;
    __weak typeof(self)SelfWeek=self;
    footView.BindAccount = ^{
        NSLog(@"查看宽带");
        [SelfWeek pushController];
    };
    [self getDetails];
}

-(void)pushController{
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //这个字符串是你要跳转面板的名字
    UIViewController *main =[board instantiateViewControllerWithIdentifier:@"JXMyBroadbandAccountID"];
    
    [self.navigationController pushViewController:main animated:YES];
}

-(void)getDetails{
    NSLog(@"%@",self.oderID);
    __weak typeof(self)SelfWeek=self;
    [XYPay requestParameter:@{@"orderId":self.oderID} relativePath:@"ck.order.detail" success:^(id responseObject) {
        NSLog(@"responseObject%@",responseObject);
        XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
        if ([xyBaseModel.RETURN_CODE isEqualToString: @"S0A00000"]) {
            detailsModel=[JXDetailsModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
            
            [SelfWeek.detailsTableView reloadData];
//            JXMyDataOrdersModel *myDataOrdersModel=[JXMyDataOrdersModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
//            [SelfWeek.listArray addObjectsFromArray:myDataOrdersModel.orderList];
//            [SelfWeek.myOdersTableView reloadData];
        }else{
            [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
        }
    } failure:^(NSError *error) {
        NSLog(@"error%@",error.userInfo);
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray=[[NSMutableArray alloc]initWithObjects:@[@"订单商品",@"交易时间",@"订单状态",@"报装状态"],@[@"姓名",@"性别",@"宽带账号",@"身份证号码",@"手机号码",@"所在城市",@"详细地址"], nil];
    }
    return _listArray;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JXMyBroadbandAccountHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandAccountHeatView" owner:self options:nil]lastObject];
    if (section==0) {
        heatView.heatLable.text=@"订单信息";
    }else{
        heatView.heatLable.text=@"报装资料";
    }
    return heatView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.listArray[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 60;
        }
    }else{
//        老用户
        if ([detailsModel.broadband.type isEqualToString:@"2"]) {
            if (indexPath.row==0||indexPath.row==1||indexPath.row==5||indexPath.row==6) {
                return 0;
            }
            return 44;
        }else{
            if (indexPath.row==2) {
                return 0;
            }else if (indexPath.row==6) {
                return 60;
            }
        }
        
    }
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JXDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    NSArray *array=[_listArray objectAtIndex:indexPath.section];
    NSString *string=[array objectAtIndex:indexPath.row];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            [cell cell_init:string Subtitle:detailsModel.order.productName];
        }else if (indexPath.row==1){
            [cell cell_init:string Subtitle:detailsModel.order.createTimeFormat];
        }else if (indexPath.row==2){
            [cell cell_init:string Subtitle:detailsModel.order.orderState];
        }else if (indexPath.row==3){
            [cell cell_init:string Subtitle:detailsModel.order.infoState];
        }
    }else{
        if ([detailsModel.broadband.type isEqualToString:@"2"]) {
            if (indexPath.row==0||indexPath.row==1||indexPath.row==5||indexPath.row==6) {
                 cell.cellTitle.hidden=YES;
                cell.cellSubtitle.hidden=YES;
                
            }else{
                cell.cellTitle.hidden=NO;
                cell.cellSubtitle.hidden=NO;
            }
           
        }else{
            if (indexPath.row==2){
                cell.cellTitle.hidden=YES;
                cell.cellSubtitle.hidden=YES;
            }else{
                cell.cellTitle.hidden=NO;
                cell.cellSubtitle.hidden=NO;
            }
        }
        if (indexPath.row==0) {
            [cell cell_init:string Subtitle:detailsModel.broadband.name];
        }else if (indexPath.row==1){
            [cell cell_init:string Subtitle:detailsModel.broadband.sexName];
        }else if (indexPath.row==2){
            [cell cell_init:string Subtitle:detailsModel.broadband.serviceNum];
        }else if (indexPath.row==3){
            [cell cell_init:string Subtitle:detailsModel.broadband.idNum];
        }else if (indexPath.row==4){
            
            [cell cell_init:string Subtitle:detailsModel.broadband.mobilePhone];
        }else if (indexPath.row==5){
            [cell cell_init:string Subtitle:detailsModel.broadband.allAddress];
        }else if (indexPath.row==6){
            [cell cell_init:string Subtitle:detailsModel.broadband.address];
        }
    }
    
    
    
    return cell;
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
