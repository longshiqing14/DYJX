//
//  JXBroadbandAccountViewController.m
//  user
//  我的宽带账号列表
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyBroadbandAccountViewController.h"
#import "JXMyBroadbandAccountCell.h"
#import "JXMyBroadbandAccountFootView.h"
#import "JXMyBroadbandOrdersView.h"
#import "XYBindingBoardBandVC.h"
#import "XYPay.h"
#import "XYBaseModel.h"
#import "JXMyBroadbandAccountModel.h"
#import "JXMyOderDetailsViewController.h"

static NSString *cellID=@"cellID";
@interface JXMyBroadbandAccountViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myAccountTableView;
@property(nonatomic,strong)NSMutableArray<JXMyBroadbandAccountModel*> *listArray;
@property (nonatomic, strong) JXMyBroadbandAccountDetailsModel *broadbandAccountModel;
@end

@implementation JXMyBroadbandAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setBroadbandAUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getBroadbandAccount];

}

-(void)getBroadbandAccount{
    WeakSelf;
    [XYPay requestParameter:[NSDictionary new] relativePath:kJXAPI_user_CkServiceList success:^(id responseObject) {
        NSLog(@"responseObject%@",responseObject);
        XYBaseModel *baseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
        if([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]){
            weakSelf.broadbandAccountModel = [JXMyBroadbandAccountDetailsModel mj_objectWithKeyValues:baseModel.RETURN_DATA];
            weakSelf.listArray = [weakSelf.broadbandAccountModel.serviceNumList mutableCopy];
            [weakSelf nodataUI];
            [weakSelf.myAccountTableView reloadData];
        }else{
//            [weakSelf.listArray removeAllObjects];
            [weakSelf nodataUI];
//            [weakSelf.myAccountTableView reloadData];
        }
    } failure:^(NSError *error) {
         NSLog(@"error%@",error.userInfo);
    }];
}

-(void)nodataUI{
    __weak typeof(self)SelfWeek=self;
    if (self.listArray.count<=0) {
        JXMyBroadbandOrdersView *ordersView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandOrdersView" owner:self options:nil]lastObject];
        [ordersView oder_init:@"添加宽带账号"];
        ordersView.frame=self.view.frame;
        ordersView.Clock = ^{
            [SelfWeek pushController];
        };
        self.myAccountTableView.tableFooterView=ordersView;
    }else{
        JXMyBroadbandAccountFootView *footView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandAccountFootView" owner:self options:nil] lastObject];
        footView.frame=CGRectMake(0, 0, XYScreenW, XYScreenH);
        [footView foot_init:XYRGBAColor(236,59,44, 1) Title:@"添加宽带账号"];
        footView.BindAccount = ^{
            NSLog(@"绑定账号");
            
            [SelfWeek pushController];
        };
        self.myAccountTableView.tableFooterView=footView;
    }
    
}

-(void)pushController{
    XYBindingBoardBandVC *xyBindingBoardBandVC=[[XYBindingBoardBandVC alloc]init];
    [self.navigationController pushViewController:xyBindingBoardBandVC animated:YES];
}

-(void)setBroadbandAUI{
    self.title=@"宽带账号列表";
    [self.myAccountTableView registerNib:[UINib nibWithNibName:@"JXMyBroadbandAccountCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.myAccountTableView.tableFooterView=[[UIView alloc]init];
}

-(NSMutableArray<JXMyBroadbandAccountModel*> *)listArray{
    if (!_listArray) {
        _listArray=[[NSMutableArray alloc]init];
    }
    return _listArray;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.listArray count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return AutoSize(62);
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JXMyBroadbandAccountCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.cellAccountLable.text = self.listArray[indexPath.row].serviceNum;
    cell.cellTimeLable.text = self.listArray[indexPath.row].applyTime;
    cell.cellStateLable.text = self.listArray[indexPath.row].state;
    cell.cellAddressLable.text = self.listArray[indexPath.row].address;
    if ([self.listArray[indexPath.row].state isEqualToString:@"正常"]) {
        cell.cellStateLable.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }else{
        cell.cellStateLable.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
   [self performSegueWithIdentifier:@"JXMyOderDetails" sender:self.listArray[indexPath.row].serviceNum];
    
}

- (JXMyBroadbandAccountDetailsModel *)broadbandAccountModel{
    if(!_broadbandAccountModel){
        _broadbandAccountModel = [[JXMyBroadbandAccountDetailsModel alloc]init];
    }
    return _broadbandAccountModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString*)sender {
    if ([segue.identifier isEqualToString:@"JXMyOderDetails"]) {
        JXMyOderDetailsViewController *details=[segue destinationViewController];
        
        details.serviceNum = sender;
        
    }
}


@end
