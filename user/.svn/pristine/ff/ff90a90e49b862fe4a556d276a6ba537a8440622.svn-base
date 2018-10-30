//
//  XYOrderDetailGoodsListTVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailGoodsListTVC.h"

#import "XYOrderDetailGoodsListTVCell.h"

#import "XYOrderDetailGoodsListModel.h"  // model

#import "XYOrderDetailModel.h"


#import "XYGoodsDetailVC.h"

@interface XYOrderDetailGoodsListTVC ()

/** 头 */
@property (nonatomic, strong) UIView * headerView;
/** 脚 */
@property (nonatomic, strong) UIView * footerView;
@property(nonatomic,strong)UILabel *lineLable;
@end

@implementation XYOrderDetailGoodsListTVC

const CGFloat goodList_cell_height = 110.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = XYWhiteColor;
    
    self.tableView.scrollEnabled = NO;
    
    self.isOpenList = NO;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载

-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable =[[UILabel alloc]init];
        _lineLable.backgroundColor=XYRGBAColor(244, 244, 244, 1);
        _lineLable.frame=CGRectMake(0, 0, XYScreenW, 10);
    }
    return _lineLable;
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 54)];
        _headerView.backgroundColor = XYWhiteColor;
        
        _headerView.layer.borderWidth = 0.5;
        _headerView.layer.borderColor = XYLineColor.CGColor;
        
        UILabel * headerLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, XYScreenW-20, 44)];
        headerLB.font          = XYFont_14;
        headerLB.textAlignment = NSTextAlignmentLeft;
        headerLB.contentMode   = UIViewContentModeBottom;
        headerLB.textColor     = XYBlackColor;
        headerLB.text     = @"商品清单";
        [_headerView addSubview:headerLB];
        
        
    }
    return _headerView;
}

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 44)];
        _footerView.backgroundColor = XYGlobalBg;
        
        UIButton * footerBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        footerBT.backgroundColor = XYWhiteColor;
        [footerBT setTitle:@"查看更多商品" forState:UIControlStateNormal];
        [footerBT setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [footerBT.titleLabel setFont:XYFont_15];
        [footerBT setImage:SETIMAGENAME(@"order_icon_up") forState:UIControlStateNormal];
        [footerBT setImageEdgeInsets:UIEdgeInsetsMake(0,160,0,0)];
        [footerBT setTitleEdgeInsets:UIEdgeInsetsMake(0,-60,0,0)];
        [footerBT addTarget:self action:@selector(footerViewClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:footerBT];
        
        [footerBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(1);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
        
    }
    return _footerView;
}

- (void)setType:(XYOrderDetailListType)type
{
    _type = type;
    
    if (type == XYOrderDetailListType_confirm) {
        [self.headerView addSubview:self.lineLable];
        self.tableView.tableHeaderView = self.headerView;
        self.tableView.tableFooterView = [UIView new];
//        self.tableView.tableFooterView = self.footerView;
    }else{
//        self.tableView.tableFooterView = self.footerView;
    }
}

- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    if (self.type == XYOrderDetailListType_confirm) {
        if (_dataSource.count > 3) {
            self.tableView.tableFooterView = self.footerView;
        }
    }
    
    WeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
    
}

- (void)footerViewClick:(UIButton*)sender
{
    if (self.isOpenList) {
        return;
    }
    
    self.isOpenList = YES;
    // 关键是这句话
//    UIView *footView = self.tableView.tableFooterView;
//    footView.height = 0;
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView reloadData];
    
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(orderConfirmGoodsListSelectFooter)]){
        [self.delegate orderConfirmGoodsListSelectFooter];
    }
    
    
    
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.type == XYOrderDetailListType_confirm) {
        if (self.isOpenList) {
            return _dataSource.count;
        }else{
            return _dataSource.count > 3 ? 3 : _dataSource.count;
        }
    }
    
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return goodList_cell_height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderDetailGoodsListTVCell * cell = [XYOrderDetailGoodsListTVCell cellWithTableView:tableView];
    
    if (_type == XYOrderDetailListType_confirm) {
        XYOrderDetailGoodsListModel * model = self.dataSource[indexPath.row];
        cell.listModel = model;
    }else if (_type == XYOrderDetailListType_detail){
        XYOrderDetailItemListModel * model = self.dataSource[indexPath.row];
        cell.detailModel = model;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_type == XYOrderDetailListType_confirm) {
    
        XYOrderDetailGoodsListModel * model = self.dataSource[indexPath.row];

        XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
        detailVC.productId = model.productId;
        [self.navigationController pushViewController:detailVC animated:YES];
    }else{
        XYOrderDetailItemListModel * model = self.dataSource[indexPath.row];
        XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
        detailVC.productId = model.commodityId;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    
}


/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}



@end
