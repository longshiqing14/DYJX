//
//  JXShopUnavailableViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXShopUnavailableViewController.h"
#import "JXShopCouponHeatView.h"

static NSString *cellID=@"cellID";
static NSString *cellHeat=@"cellHeat";
@interface JXShopUnavailableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *unavailableTableView;
@property(nonatomic,strong)NSMutableArray *isArray;

@end

@implementation JXShopUnavailableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_unavailableTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [_unavailableTableView registerNib:[UINib nibWithNibName:@"JXCouponHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:cellHeat];
    _isArray=[[NSMutableArray alloc]init];
    for (int i=0; i<22; i++) {
        [_isArray addObject:[NSNumber numberWithBool:NO]];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;//[self.listArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 22;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    //    cell.textLabel.textColor=XYRGBAColor(32,32,32, 1); cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator; cell.textLabel.text=_listArray[indexPath.row] ;
    
    
    
    return cell;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __weak typeof(self)SelfWeek=self;
    JXCouponHeatView *heatView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeat];
    //    JXMyAleadyUsedHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyAleadyUsedHeatView" owner:self options:nil]lastObject];
    [heatView heat_init:section IsOpen:[_isArray[section]boolValue] ImageName:@"ic_used"];
    heatView.Clock = ^( BOOL isOpen) {
        NSLog(@"%@",isOpen?@"YES":@"NO");
        [_isArray replaceObjectAtIndex:section withObject:[NSNumber numberWithBool:isOpen]];
        NSLog(@"%lu",(unsigned long)_isArray.count);
        [SelfWeek Refresh:section];
    };
    return heatView;
}

-(void)Refresh:(NSInteger)refreshIndex{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:refreshIndex];
    [_unavailableTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic]; }

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 112;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    if (indexPath.row==0) {
    //        [self performSegueWithIdentifier:@"JXMyBroadbandAccount" sender:nil];
    //    }else
    //        [self performSegueWithIdentifier:@"JXMyBroadbandOrders" sender:nil];
    
}

-(void)getUserCardSelectList{
    [self network:@{@"cartId":self.cartId,@"listType":@"1"} relativePath:kJXAPI_user_CardSelectList ShowAndDismiss:YES  success:^(id responseObject) {
        
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
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
