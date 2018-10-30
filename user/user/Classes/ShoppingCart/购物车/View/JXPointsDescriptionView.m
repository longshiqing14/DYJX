//
//  JXPointsDescriptionView.m
//  user
//
//  Created by liu_yakai on 2018/1/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXPointsDescriptionView.h"
#import "JXPointsDescriptionHeatView.h"
#import "XYOrderFromDetailModel.h"

static NSString *cellID=@"cellID";

@implementation JXPointsDescriptionView

-(void)init_Points{
    
//    [self.pointsTableView registerNib:[UINib nibWithNibName:@"JXPointsDescriptionCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.pointsTableView.dataSource=self;
    self.pointsTableView.delegate=self;
    [self.pointsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    self.pointsTableView.tableFooterView=[[UIView alloc]init];
    self.pointsTableView.estimatedRowHeight = 100;
   self.pointsTableView.separatorStyle = UITableViewCellSeparatorStyleNone; self.pointsTableView.rowHeight=UITableViewAutomaticDimension;
//    self.pointsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self reat:5];
}

-(void)setPointsArray:(NSArray *)pointsArray{
    _pointsArray=pointsArray;
    

            [_pointsTableView reloadData];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 30;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    JXIntegralTitleModel *integralTitleModel=_pointsArray[section];
    
    return [integralTitleModel.desc count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _pointsArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    cell.textLabel.textColor=XYRGBAColor(102, 102, 102, 1);
    cell.textLabel.numberOfLines = 0; cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    JXIntegralTitleModel *integralTitleModel=_pointsArray[indexPath.section];
    cell.textLabel.text=integralTitleModel.desc[indexPath.row];
    return cell;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JXPointsDescriptionHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXPointsDescriptionHeatView" owner:self options:nil]lastObject];
    JXIntegralTitleModel *integralTitleModel=_pointsArray[section];
    [heatView heat_init:integralTitleModel.title];
    return heatView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (IBAction)dismissPOPClock:(id)sender {
    if(self.Clock){
        self.Clock();
    }
}

@end
