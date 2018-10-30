//
//  JXRenewViewController.m
//  user
//  宽带账号续费
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXRenewViewController.h"
#import "JXRenewInInPutCell.h"
#import "JXRenewInFootView.h"
#import "NetWorkTool.h"
#import "XYBaseModel.h"
#import "JXRenewModel.h"
#import "JXSuccessAccountViewController.h"
#import "XYLocalCheck.h"


static NSString *cellID=@"cellID";
@interface JXRenewViewController ()<UITextFieldDelegate>{
    int count;
    JXRenewModel *renewModel;
    UITextField *fistTextField;
}
@property(nonatomic,strong)NSTimer *time;
@property(nonatomic,strong)NSArray *renewArray;
@property (weak, nonatomic) IBOutlet UITableView *RenewTableView;

@end

@implementation JXRenewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    renewModel=[[JXRenewModel alloc]init];
    self.title=@"宽带账号续费";
    count=60;
    [self.RenewTableView registerNib:[UINib nibWithNibName:@"JXRenewInInPutCell" bundle:nil] forCellReuseIdentifier:cellID];
    JXRenewInFootView *footView=[[[NSBundle mainBundle]loadNibNamed:@"JXRenewInFootView" owner:self options:nil] lastObject];
    self.RenewTableView.tableFooterView=footView;
    __weak typeof(self)SelfWeek=self;
    footView.ClockSubmit = ^{
        [SelfWeek SubmitClock];
//        [SelfWeek performSegueWithIdentifier:@"JXSuccessAccount" sender:nil];
    };
}

-(NSArray *)renewArray{
    if (!_renewArray) {
        _renewArray=[[NSArray alloc]initWithObjects:@{@"宽带账号":@"请输入您的宽带账号"},@{@"手机号":@"请输入您的手机号码"},@{@"验证码":@"请输入短信验证码"},@{@"身份证号":@"请输入您的身份证号码"}, nil];
    }
    return _renewArray;
}

#pragma mark UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    fistTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==100) {
        renewModel.serviceNum=textField.text;
    }else if (textField.tag==101){
        renewModel.mobilePhone=textField.text;
    }else if (textField.tag==102){
        renewModel.mobileCode=textField.text;
    }else if (textField.tag==103){
        renewModel.idNum=textField.text;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.renewArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self)SelfWeek=self;
    JXRenewInInPutCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.preservesSuperviewLayoutMargins = NO;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    [cell cell_init:_renewArray[indexPath.row] CellButtonTag:indexPath.row];
    if (indexPath.row==2) {
        cell.buttonWidth.constant=86;
        
    }else{
        cell.buttonWidth.constant=0;
        cell.cellPosition.constant=0;
    }
    cell.ClockCode = ^{
        [SelfWeek getCode];
    };
    
    cell.cellTextField.delegate=self;
    return cell;
}

-(void)getCode{
    NSLog(@"获取验证码");
    [self.view endEditing:YES];
    if (renewModel.mobilePhone==nil||renewModel.mobilePhone.length==0) {
         [YDBAlertView showToast:@"请输入手机号" dismissDelay:1.0];
        return;
    }
//    else if (![XYLocalCheck ismobile:renewModel.mobilePhone]){
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"手机号不正确" dismissTimeInterval:1.0];
//        return;
//    }
    __weak typeof(self)SelfWeek=self;
    [NetWorkTool postRequest:@{@"phone":renewModel.mobilePhone,@"type":@"3"} relativePath:@"sms.vcode" ShowAndDismiss:YES  success:^(id responseObject)  {
        NSLog(@"%@",responseObject);
        
            [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"验证码发送成功" dismissTimeInterval:1.0];
            SelfWeek.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
        
    } failure:^() {
        NSLog(@"服务器异常");
    } UnusualFailure:^{
        NSLog(@"网络异常");
    }];
    
}


- (void)countdown
{
    
    count--;
    UIButton *codeButton=(UIButton *)[self.view viewWithTag:1002 ];
    if (count == 0) {
        [_time invalidate];
        _time = nil;
        
        [codeButton setTitle:@"获取验证码" forState:(UIControlStateNormal) ];
        count = 60;
        return;
    }
    [codeButton setTitle:[NSString stringWithFormat:@"%ld秒", (long)count] forState:UIControlStateNormal];
}

-(void)SubmitClock{
    [self.view endEditing:YES];
    if (renewModel.mobilePhone.length==0) {
        [YDBAlertView showToast:@"请输入手机号码" dismissDelay:1.0];
    }else if (renewModel.mobileCode.length==0){
        [YDBAlertView showToast:@"请输入验证码" dismissDelay:1.0];
    }else if (renewModel.idNum.length==0){
        [YDBAlertView showToast:@"请输入身份证号码" dismissDelay:1.0];

    }else{
        renewModel.orderId=self.oderID;
        renewModel.type=@"2";
        [self submitData];
    }
}


-(void)submitData{
    __weak typeof(self)SelfWeek=self;
    NSDictionary *dic=[renewModel mj_keyValues];
    NSLog(@"%@",dic);
    [NetWorkTool postRequest:dic relativePath:kJXAPI_user_userCkBook ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [SelfWeek performSegueWithIdentifier:@"JXSuccessAccount" sender:nil];
        
    } failure:^() {
        NSLog(@"服务器异常");
    } UnusualFailure:^{
        NSLog(@"网络异常");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"JXSuccessAccount"]) {
        JXSuccessAccountViewController *details=[segue destinationViewController];
//        details.oderID=self.oderID;
        details.isActivity=self.isActivity;
        
    }
}


@end
