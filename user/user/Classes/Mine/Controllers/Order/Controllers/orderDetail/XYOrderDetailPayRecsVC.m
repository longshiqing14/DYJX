//
//  XYOrderDetailPayRecsVC.m
//  user
//
//  Created by xingyun on 2017/10/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailPayRecsVC.h"

#import "XYOrderDetailModel.h"

#import "XYOrderDetailSubClassOrderDetailPayTVCell.h"

@interface XYOrderDetailPayRecsVC ()

@end

@implementation XYOrderDetailPayRecsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.backgroundColor = XYWhiteColor;
    self.tableView.scrollEnabled = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}


- (void)setPayRecs:(NSMutableArray<XYOrderDetailPayRecsModel *> *)payRecs
{
    _payRecs = payRecs;
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _payRecs.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderDetailSubClassOrderDetailPayTVCell * cell = [XYOrderDetailSubClassOrderDetailPayTVCell cellWithTableView:tableView];
    
    XYOrderDetailPayRecsModel * model = _payRecs[indexPath.row];
    
    cell.titleLB.text = model.name;
    cell.subLB.text = [NSString stringWithFormat:@"￥%@",model.price];
    
//    if (indexPath.row == 2 || indexPath.row == 3) {
//        cell.subLB.textColor = XYMainColor;
//    }else{
//        cell.subLB.textColor = XYBlackColor;
//    }
    
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
