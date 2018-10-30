//
//  XYOrderDetailSubClassOrderStatusVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderStatusVC.h"

#import "XYOrderDetailOrderStatusTVCell.h"
#import "XYOrderDetailOrderStatusModel.h"
#import "JXOrderDetailSubClassOrderStatusHeatView.h"
#import "XYOrderAllNet.h"


@interface XYOrderDetailSubClassOrderStatusVC () <UITableViewDelegate,UITableViewDataSource>{
    JXOrderStatusModel *orderStatusModel;
}

@property (nonatomic, strong) JXOrderDetailSubClassOrderStatusHeatView* OrderStatusHeatView;
@property(nonatomic,strong)NSMutableArray *orderDetailStatusArray;


@property (nonatomic, strong) UITableView* tableView;

@end

@implementation XYOrderDetailSubClassOrderStatusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"配送状态";
    self.view.backgroundColor = XYGlobalBg;
    
    
    [self addViewAndLayout];
    
    [self netOrderTrackListData];
    [self refreshNormalTableView];
    
}


-(void)refreshNormalTableView{
    WeakSelf
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [weakSelf netOrderTrackListData];
    }];
}

- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
}



#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.sectionHeaderHeight=120;
//        _tableView.tableHeaderView = self.OrderStatusHeatView;
        _tableView.tableFooterView = [UIView new];
  
        
    }
    return _tableView;
}

- (JXOrderDetailSubClassOrderStatusHeatView*)OrderStatusHeatView
{
    if (_OrderStatusHeatView == nil) {
        _OrderStatusHeatView =[[[NSBundle mainBundle]loadNibNamed:@"JXOrderDetailSubClassOrderStatusHeatView" owner:self options:nil]lastObject];
//        _OrderStatusHeatView.backgroundColor = XYGlobalBg;
        
        
        
    }
    return _OrderStatusHeatView;
}


#pragma mark - tableview

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    [self.OrderStatusHeatView heat_init:orderStatusModel];
    return self.OrderStatusHeatView;
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeMake(100, MAXFLOAT);//设置高度宽度的最大限度
    CGRect rect = [orderStatusModel.billNo boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil];
    
    NSLog(@"%f",rect.size.height);
    
        return rect.size.height+80;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}
//
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return UITableViewAutomaticDimension;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _orderDetailStatusArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JXLogisticInfoDataModel *model=_orderDetailStatusArray[indexPath.row];
    CGFloat heat;
//    if(indexPath.row==0){
//        heat=[self setIntroductionText:str]+10;
//    }else{
        heat=[self setIntroductionText:model.context];
//    }
    return heat;
}

//赋值 and 自动换行,计算出cell的高度
-(CGFloat)setIntroductionText:(NSString*)text{
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    CGRect infoRect =   [attrStr boundingRectWithSize:CGSizeMake(XYScreenW-100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    return  infoRect.size.height+60;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYOrderDetailOrderStatusTVCell *cell  = [XYOrderDetailOrderStatusTVCell cellWithTableView:tableView];
    
    cell.statusModel = _orderDetailStatusArray[indexPath.row];
  
    if (indexPath.row == 0) {
        cell.lineUpView.hidden = YES;
        cell.iconImageView.backgroundColor=XYRGBAColor(236,59,44, 1);
        cell.titleLB.textColor=XYRGBAColor(236,59,44, 1);
        cell.timeLB.textColor=XYRGBAColor(236,59,44, 1);
    }else{
        cell.lineUpView.hidden = NO;
        cell.iconImageView.backgroundColor=XYRGBAColor(153,153,153, 1);
        cell.titleLB.textColor=XYRGBAColor(0,0,0, 1);
        cell.timeLB.textColor=XYRGBAColor(153,153,153, 1);
    }
    
    if (indexPath.row == _orderDetailStatusArray.count -1) {
        cell.lineDownView.hidden = YES;
    }else{
        cell.lineDownView.hidden = NO;
    }
    
    
    return cell;
}


- (void)netOrderTrackListData
{
    WeakSelf;
    [XYOrderAllNet netOrderTrackWithOrderid:self.order_ID Block:^(NSDictionary *blockDictionary, NSError *error) {
       [_tableView.mj_header endRefreshing];
        if (error == nil) {

            orderStatusModel=[JXOrderStatusModel mj_objectWithKeyValues:blockDictionary];
            _orderDetailStatusArray=[[NSMutableArray alloc]initWithArray:orderStatusModel.logisticInfoData];
            for (XYOrderDetailOrderStatusModel *orderDetailOrderStatusModel in orderStatusModel.logList) {
                JXLogisticInfoDataModel *logisticInfoDataModel=[[JXLogisticInfoDataModel alloc]init];
                logisticInfoDataModel.context=orderDetailOrderStatusModel.logInfo;
                logisticInfoDataModel.time=orderDetailOrderStatusModel.time;
//                _orderDetailStatusArray=[NSMutableArray arrayWithArray:orderStatusModel.logisticInfoData];
                
                [_orderDetailStatusArray addObject:logisticInfoDataModel];
            }
//            NSArray * dpFromResponse = [blockDictionary objectForKey:@"logList"];
//            for (NSDictionary * attributes in dpFromResponse) {
//                NSDictionary * butesdict = [XYCommon removeNull:attributes];
//                XYOrderDetailOrderStatusModel * newModel = [XYOrderDetailOrderStatusModel mj_objectWithKeyValues:butesdict];
//
//                [weakSelf.dataSource addObject:newModel];
//            }
            [weakSelf.tableView reloadData];
        }
        
        
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
