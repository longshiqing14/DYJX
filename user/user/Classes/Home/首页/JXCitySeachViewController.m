//
//  JXCitySeachViewController.m
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCitySeachViewController.h"

static NSString *cellID=@"cellID";
@interface JXCitySeachViewController (){
    JXSeachCityModel *seachCityModel;
}
@property (weak, nonatomic) IBOutlet BaseTableView *seachTableView;
@property (weak, nonatomic) IBOutlet UITextField *seach;

@end

@implementation JXCitySeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.seachTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    self.title=@"城市搜索";
    [self.seach reat:5];
    
}

-(void)seachCity{
    [self.view endEditing:YES];
    if (_seach.text.length==0) {
        [YDBAlertView showToast:@"请输入关键字" dismissDelay:1.0];
    }else{
        [self getSeach];
    }
    
}

-(void)getSeach{
    [self network:@{@"keyword":_seach.text} relativePath:kJXAPI_user_search ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        seachCityModel=[JXSeachCityModel modelWithJSON:responseObject];
        [_seachTableView reloadData];
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self seachCity];
    
    return YES;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return seachCityModel.communityList.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;//_cityListModel.alphaList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    JXListModel *model=seachCityModel.communityList[indexPath.row];
    cell.textLabel.text=model.cityName;
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JXListModel *model=seachCityModel.communityList[indexPath.row];
    if (self.SelectCity) {
        JXCommunityListModel *listModel=[[JXCommunityListModel alloc]init];
        listModel.cityId=model.cityId;
        listModel.cityName=model.cityName;
        listModel.theMerchantId=model.theMerchantId;
        self.SelectCity(listModel);
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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
