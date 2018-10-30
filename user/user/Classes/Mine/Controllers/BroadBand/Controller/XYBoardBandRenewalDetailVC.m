//
//  XYBoardBandRenewalDetailVC.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBoardBandRenewalDetailVC.h"
#import "XYMyBoardBandFirstCell.h"

#import "XYBoardBandNet.h"
#import "XYBoardBandListModel.h"
#import "XYCaculateTool.h"

@interface XYBoardBandRenewalDetailVC ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong) UITableView *detailTable;

/** 左侧类型数组 */
@property(strong,nonatomic) NSMutableArray *leftArr ;

@property(strong,nonatomic) XYBoardBandListModel *dataModel ;

@end

static NSString *const XYMyBoardBandFirstCellID = @"XYMyBoardBandFirstCell";
@implementation XYBoardBandRenewalDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"续约详情";
    
    self.view.backgroundColor = XYGlobalBg;
 
    
    [self dataFromeSever];
}

-(void)dataFromeSever{

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"renewalId"] = self.renewalId;
    WeakSelf;
    [XYBoardBandNet netBoardBandRenewalDetailWithParam:param block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            weakSelf.dataModel = [XYBoardBandListModel mj_objectWithKeyValues:[blockDictionary objectForKey:@"renewal"]];
            [weakSelf.detailTable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.bottom.mas_offset(0);
            }];
        }
        
    }];
}


#pragma mark - lazy
-(UITableView *)detailTable
{
    if (!_detailTable) {
        _detailTable = [[UITableView alloc] init];
        _detailTable.showsVerticalScrollIndicator = NO;
        _detailTable.showsHorizontalScrollIndicator = NO;
        _detailTable.delegate = self;
        _detailTable.dataSource = self;
        _detailTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _detailTable.backgroundColor = XYGlobalBg;
        _detailTable.tableFooterView = [UIView new];
        [_detailTable registerClass:[XYMyBoardBandFirstCell class] forCellReuseIdentifier:XYMyBoardBandFirstCellID];
  
        [self.view addSubview:_detailTable];
    }
    return _detailTable;
    
}

-(NSMutableArray *)leftArr
{
    if (!_leftArr) {
        _leftArr = [NSMutableArray array];
        [_leftArr addObject:@"套餐名称"];
        [_leftArr addObject:@"带宽大小"];
        [_leftArr addObject:@"办理时间"];
        [_leftArr addObject:@"生效时间"];
        [_leftArr addObject:@"到期时间"];
        [_leftArr addObject:@"剩余时间"];
        [_leftArr addObject:@"状态"];
    }
    return _leftArr;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.leftArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYMyBoardBandFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYMyBoardBandFirstCellID forIndexPath:indexPath];
    
    cell.leftLab.text = self.leftArr[indexPath.row];
    
    if (indexPath.row == 0) {
        cell.rightLab.text = self.dataModel.productName;
        
    }else if (indexPath.row == 1)
    {
        cell.rightLab.text = self.dataModel.broadbandSize;
    }else if (indexPath.row == 2)
    {
        cell.rightLab.text = self.dataModel.residueTime;
    }else if (indexPath.row == 3)
    {
        cell.rightLab.text = self.dataModel.createTime;
    }else if (indexPath.row == 4)
    {
        cell.rightLab.text = self.dataModel.endTime;
    }else if (indexPath.row == 5)
    {
        cell.rightLab.text = self.dataModel.broadbandSize;
    }else if (indexPath.row == 6)
    {
        cell.rightLab.text = self.dataModel.state;
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section ==0) {
        CGSize size = [XYCaculateTool sizeWithString:self.dataModel.productName fontOfSize:14 viewWidth:(XYScreenW - 20-80)];
        
        if (size.height>15) {
            return size.height + 30;
        }
    }
    
    return 45;
}


@end
