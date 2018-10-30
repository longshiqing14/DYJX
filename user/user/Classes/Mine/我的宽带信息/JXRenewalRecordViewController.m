//
//  JXRenewalRecordViewController.m
//  user
//  续约记录
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXRenewalRecordViewController.h"
#import "XYPay.h"
#import "JXDetailsCell.h"

static NSString *cellID=@"cellID";
@interface JXRenewalRecordViewController ()
@property (weak, nonatomic) IBOutlet UITableView *renewalTableView;
@property(nonatomic,strong)NSMutableArray *listArray;
@end

@implementation JXRenewalRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.renewalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.renewalTableView registerNib:[UINib nibWithNibName:@"JXDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    _renewalTableView.tableFooterView=[[UIView alloc]init];
     [self getOrderDetails];
}

-(void)getOrderDetails{
    WeakSelf;
    NSMutableDictionary *requstDic = [NSMutableDictionary dictionary];
    [XYPay requestParameter:requstDic relativePath:kJXAPI_user_user_CkRenewlist success:^(id responseObject) {
        NSLog(@"responseObject%@",responseObject);
        XYBaseModel *baseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
        if([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]){
//            weakSelf.broadbandDetailsModel = [MyBroadbandDetailsModel mj_objectWithKeyValues:baseModel.RETURN_DATA];
            //            weakSelf.listArray = [weakSelf.broadbandDetailsModel mutableCopy];
//            weakSelf.contentArray = [weakSelf getContentArrayWithModel:weakSelf.broadbandDetailsModel];
//            [weakSelf.oderTableView reloadData];
        }else{
            
        }
    } failure:^(NSError *error) {
        NSLog(@"error%@",error.userInfo);
    }];
}

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray=[[NSMutableArray alloc]initWithObjects:@"宽带账号列表",@"我的宽带订单", nil];
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
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    
    
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    
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
