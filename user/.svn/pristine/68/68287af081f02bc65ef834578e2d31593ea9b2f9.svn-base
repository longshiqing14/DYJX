//
//  JXOderDetailsViewController.m
//  user
//  宽带账号详情
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDetailsViewController.h"
#import "JXMyOderDetailsCell.h"
#import "XYPay.h"
#import "MyBroadbandDetailsModel.h"
#import "NSString+Tool.h"
#import "JXRenewalRecordViewController.h"
#import "XYMyBoardBandRenewalListVC.h"
#import "JXRenewalRecordCell.h"
#import "XYPreDepositVC.h"
#import "JXMyBroadbandAccountFootView.h"

#import "JXMyAccountManagementViewController.h"

static NSString *cellID=@"cellID";
static NSString *JXRenewalRecordCellID=@"JXRenewalRecordCellID";

@interface JXMyOderDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *oderTableView;
@property(nonatomic,strong)NSArray<NSArray*> *listArray;
@property(nonatomic,strong)NSMutableArray<NSArray<NSString*>*> *contentArray;
@property (nonatomic, strong)MyBroadbandDetailsModel *broadbandDetailsModel;
@property (nonatomic, strong)JXMyBroadbandAccountFootView *footerView;
@end

@implementation JXMyOderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"宽带账号详情";
    self.oderTableView.tableFooterView = [UIView new];
    [self.oderTableView registerNib:[UINib nibWithNibName:@"JXMyOderDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.oderTableView registerNib:[UINib nibWithNibName:@"JXRenewalRecordCell" bundle:nil] forCellReuseIdentifier:JXRenewalRecordCellID];
    
    self.oderTableView.tableFooterView = self.footerView;
    __weak typeof(self)SelfWeek=self;
    [self.footerView setBindAccount:^{
        NSLog(@"续约");
        /** 正确的*/
        XYPreDepositVC *deopsit = [[XYPreDepositVC alloc] init];
        deopsit.isProductList = @"Y";
        [SelfWeek.navigationController pushViewController:deopsit animated:YES];
    }];
    
    [self naviUI];
    [self getOrderDetails];
}

-(void)black_controller{
    
    [self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES];}

-(void)naviUI{
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_broadband_set_Image"] style:(UIBarButtonItemStylePlain) target:self action:@selector(accountManagement)];
    self.navigationItem.rightBarButtonItem=item;
}

-(void)getOrderDetails{
    WeakSelf;
    NSMutableDictionary *requstDic = [NSMutableDictionary dictionary];
    [requstDic setObject:self.serviceNum forKey:@"serviceNumber"];
    [XYPay requestParameter:requstDic relativePath:kJXAPI_user_ckServiceDetail success:^(id responseObject) {
        NSLog(@"responseObject%@",responseObject);
        XYBaseModel *baseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
        if([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]){
            weakSelf.broadbandDetailsModel = [MyBroadbandDetailsModel mj_objectWithKeyValues:baseModel.RETURN_DATA];
//            weakSelf.listArray = [weakSelf.broadbandDetailsModel mutableCopy];
            weakSelf.contentArray = [weakSelf getContentArrayWithModel:weakSelf.broadbandDetailsModel];
            [weakSelf.oderTableView reloadData];
            if ([weakSelf.broadbandDetailsModel.residueTime intValue] <= 30) {
                weakSelf.footerView.BtnHeight.constant = 40;
               
            }else{
                weakSelf.footerView.BtnHeight.constant = 0;
            }
            
        }else{
            
        }
    } failure:^(NSError *error) {
        NSLog(@"error%@",error.userInfo);
    }];
}

- (NSMutableArray<NSArray<NSString*>*>*)getContentArrayWithModel:(MyBroadbandDetailsModel*)model{

    NSArray *sectionOneArr = @[[self notNullString: model.name],[self notNullString:model.mobile],[self notNullString:model.address]];
    NSArray *sectionTowArr = @[[self notNullString:model.productName],[self notNullString:model.createTime],[self notNullString:model.transactionTime],[self notNullString:model.endTime],[self notNullString:model.residueTime],[self notNullString:model.state]];
    NSMutableArray *contentArr = [NSMutableArray arrayWithObjects:sectionOneArr,sectionTowArr, nil];
    return contentArr;
    
}

- (NSString *)notNullString:(NSString*)title{
    if ([YWDTools isNil:title]) {
        return @" ";
    }else{
        return title;
    }
}
-(void)accountManagement{
    [self performSegueWithIdentifier:@"JXMyAccountManagement" sender:nil];
}

-(NSArray<NSArray*> *)listArray{
    if (!_listArray) {
        _listArray=  @[@[@"开户人",@"联系手机",@"开通地址"],@[@"套餐名称",@"办理时间",@"生效时间",@"到期时间",@"剩余时间",@"宽带状态"],@[@"续约记录"]] ;
    }
    return _listArray;
}

- (MyBroadbandDetailsModel *)broadbandDetailsModel{
    if (!_broadbandDetailsModel) {
        _broadbandDetailsModel = [[MyBroadbandDetailsModel alloc]init];
    }
    return _broadbandDetailsModel;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArray[section].count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.listArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section != 2) {
        JXMyOderDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.cellTitle.text = self.listArray[indexPath.section][indexPath.row];
        cell.cellContent.text = self.contentArray[indexPath.section][indexPath.row];
        
          if ([self.contentArray[indexPath.section][indexPath.row] isEqualToString:@"正常"]) {
             cell.cellContent.textColor = [UIColor colorWithHexString:@"#DAB485"];
           }else if([self.contentArray[indexPath.section][indexPath.row] isEqualToString:@"已过期"]){
             cell.cellContent.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
           }else{
              cell.cellContent.textColor = [UIColor colorWithHexString:@"#202020"];
           }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
         return cell;
    }else{
        
        JXRenewalRecordCell *cell=[tableView dequeueReusableCellWithIdentifier:JXRenewalRecordCellID forIndexPath:indexPath];
       cell.cellContent.text = self.listArray[indexPath.section][indexPath.row];
        
        
        return cell;
    }

 
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section != 2) {
        return 13;
    }else{
        return 0;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
//        [self performSegueWithIdentifier:@"JXRenewalRecord" sender:nil];
        XYMyBoardBandRenewalListVC *renewalListVC = [[XYMyBoardBandRenewalListVC alloc]init];
        [self.navigationController pushViewController:renewalListVC animated:NO];

    }

}

- (JXMyBroadbandAccountFootView *)footerView{
    if (!_footerView) {
        _footerView = [[NSBundle mainBundle]loadNibNamed:@"JXMyBroadbandAccountFootView" owner:self options:nil].lastObject;
        _footerView.frame=CGRectMake(0, 0, XYScreenW, 150);
        _footerView.BtnHeight.constant = 0;
        [_footerView foot_init:XYRGBAColor(236,59,44, 1) Title:@"续约"];
    }
    return _footerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString*)sender {
    if ([segue.identifier isEqualToString:@"JXMyAccountManagement"]) {
        JXMyAccountManagementViewController *details=[segue destinationViewController];
        details.broadbandDetailsModel=self.broadbandDetailsModel;
                
    }
}

@end
