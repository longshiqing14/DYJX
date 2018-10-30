//
//  XYEWalletPreDepositChildVC.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositChildVC.h"
#import "XYEWalletPreDepositFirstCell.h"
#import "XYEWalletPreDepositSecondCell.h"
#import "XYEWalletPreDepositFourthCell.h"
#import "XYEWalletPreDepositDetailModel.h"
@interface XYEWalletPreDepositChildVC ()

@property(nonatomic,strong)UIView *lineView;

@end
static NSString *const XYEWalletPreDepositFirstCellID = @"XYEWalletPreDepositFirstCell";

static NSString *const XYEWalletPreDepositSecondCellID = @"XYEWalletPreDepositSecondCell";

static NSString *const XYEWalletPreDepositFourthCellID = @"XYEWalletPreDepositFourthCell";
@implementation XYEWalletPreDepositChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
//    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = XYGlobalBg;
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass:[XYEWalletPreDepositFirstCell class] forCellReuseIdentifier:XYEWalletPreDepositFirstCellID];
    [self.tableView registerClass:[XYEWalletPreDepositFourthCell class] forCellReuseIdentifier:XYEWalletPreDepositFourthCellID];
}

-(void)setDataModel:(XYEWalletPreDepositDetailModel *)dataModel
{
    _dataModel = dataModel;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYLineColor;
    }
    return _lineView;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2+_dataModel.recordList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if (indexPath.row == 0) {
        XYEWalletPreDepositFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositFirstCellID forIndexPath:indexPath];
        
        cell.contentView.backgroundColor = XYRGBColor(233, 227, 210);
        cell.leftLab.textColor = XYMainColor;
        cell.rightLab.textColor = XYMainColor;
        cell.leftLab.text = [NSString stringWithFormat:@"返还总金额：￥%@",self.dataModel.hasCashbackPrice];
        cell.rightLab.text = [NSString stringWithFormat:@"开始时间：%@",self.dataModel.beginTime];
        
        return cell;
    }else if(indexPath.row == 1)
    {
        XYEWalletPreDepositFourthCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositFourthCellID forIndexPath:indexPath];
        cell.leftLab.text = @"返还时间";
        cell.middleLab.text = @"返还金额";
        cell.rightLab.text = @"是否到账";
        
        [cell.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        
        return cell;
        
    }else
    {
        XYEWalletPreDepositFourthCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositFourthCellID forIndexPath:indexPath];
        NSInteger i = indexPath.row - 2;
        if (i==0) {
            cell.leftLab.textColor = XYBlackColor;
            cell.middleLab.textColor = XYBlackColor;
            cell.rightLab.textColor = XYBlackColor;
        }else{
            cell.leftLab.textColor = XYGrayColor;
            cell.middleLab.textColor = XYGrayColor;
            cell.rightLab.textColor = XYGrayColor;
        
        }
        XYEWalletPreDepositDetailRecordListModel *listModel = self.dataModel.recordList[i];
        cell.leftLab.text = listModel.giveDate;
        cell.middleLab.text =[NSString stringWithFormat:@"￥%@", listModel.price];
        cell.rightLab.text = [listModel.state boolValue] ?@"是":@"否";
        return cell;
    
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0||indexPath.row == 1  ) {
        return 45;
    }else
    {
        return 32;
    }
}

@end
