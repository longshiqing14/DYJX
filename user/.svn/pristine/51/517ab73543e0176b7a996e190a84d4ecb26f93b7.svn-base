//
//  BroadbandViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMyBroadbandViewController.h"
#import "JXMyBroadCell.h"

static NSString *cellID=@"cellID";
@interface JXMyBroadbandViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myBroadTableView;
@property(nonatomic,strong)NSMutableArray *listArray;
@end

@implementation JXMyBroadbandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBroadbandUI];
    
}

-(void)setBroadbandUI{
    self.title=@"我的宽带";
    [self.myBroadTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.myBroadTableView.tableFooterView=[[UIView alloc]init];
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
    
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textColor=XYRGBAColor(32,32,32, 1); cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator; cell.textLabel.text=_listArray[indexPath.row] ;
    
    
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    }else
        [self performSegueWithIdentifier:@"JXMyBroadbandOrders" sender:nil];
    
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
