//
//  JXMyAccountViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyAccountManagementViewController.h"
#import "XYPay.h"
#import "JXMyAccountManagementCell.h"
#import "XYBaseModel.h"

static NSString *cellID=@"cellID";
@interface JXMyAccountManagementViewController ()
@property (weak, nonatomic) IBOutlet UITableView *managemTableView;
@property(nonatomic,strong)NSMutableArray *listArray;
@end

@implementation JXMyAccountManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"管理";
    self.managemTableView.tableFooterView=[[UIView alloc]init];
    [self.managemTableView registerNib:[UINib nibWithNibName:@"JXMyAccountManagementCell" bundle:nil] forCellReuseIdentifier:cellID];
}

-(void)delect{
    __weak typeof(self)SelfWeek=self;
    NSLog(@"%@",self.broadbandDetailsModel.serviceNum);
    [XYPay requestParameter:@{@"serviceNum":self.broadbandDetailsModel.serviceNum} relativePath:kJXAPI_user_unbind success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYBaseModel *baseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:baseModel.RETURN_DESC dismissTimeInterval:1.0];
            UIViewController *viewCtl = self.navigationController.viewControllers[2];
            
            [SelfWeek.navigationController popToViewController:viewCtl animated:YES];
        }else{
            [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
            
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray=[[NSMutableArray alloc]initWithObjects:@"", nil];
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
    __weak typeof(self)SelfWeek=self;
    JXMyAccountManagementCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell cell_init:self.broadbandDetailsModel];
    cell.Clock = ^{
        [SelfWeek delect];
    };
    
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    
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
