//
//  XYMineOrderButtonVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineOrderButtonVC.h"
#import "JXMyRefundAfterSaleViewController.h"
#import "XYHomeButtonCVCell.h"
#import "XYHomeButtonModel.h"

#import "XYOrderAllNet.h"

#import "XYMineOrderListVCViewController.h" //订单列表
#import "XYLoginVC.h"
@interface XYMineOrderButtonVC () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLB;

@property (nonatomic, strong) UIButton * allOrderBT;

@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYMineOrderButtonVC

const CGFloat order_button_height = 70.0;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
 
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self netOrderCountData];
}

/** 添加 view */
- (void)addViewAndLayout
{

    [self updateDataSource];
    [self.view addSubview:self.bgView];
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [self.bgView addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(XY_Left_Margin);
    }];
    
    [self.bgView addSubview:self.allOrderBT];
    [self.allOrderBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_bgView.mas_bottom).offset(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(order_button_height);
    }];
    
}







#pragma mark - button click

/** 全部 订单按钮 点击事件 */
- (void)allOrderButtonClick:(UIButton*)sender
{
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    
    XYMineOrderListVCViewController * orderListVC = [[XYMineOrderListVCViewController alloc]init];
    
    [self.navigationController pushViewController:orderListVC animated:YES];
    
}


#pragma mark - 懒加载 

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYWhiteColor;
    }
    return _bgView;
}

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYBlackColor;
        _titleLB.text          = @"我的订单";
        _titleLB.font          = XYFont_15;
        _titleLB.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLB;
}

- (UIButton*)allOrderBT
{
    if (_allOrderBT == nil) {
        _allOrderBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_allOrderBT setTitle:@"查看全部 >" forState:UIControlStateNormal];
        [_allOrderBT setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _allOrderBT.titleLabel.font = XYFont_15;
        
        [_allOrderBT addTarget:self action:@selector(allOrderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allOrderBT;
}

- (UICollectionView*)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[XYHomeButtonCVCell class] forCellWithReuseIdentifier:NSStringFromClass([XYHomeButtonCVCell class])];
        _collectionView.delegate   = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        
    }
    return _collectionView;
}

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)updateDataSource
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString * p100 = @"";
    NSString * p101 = @"";
    NSString * p102 = @"";
    NSString *p103=@"";
    NSString * waitingAppraise = @"";
    
    NSDictionary * countDict = [XYUserDefaults readAppDlegateOfOrderCountDict];
    NSDictionary *registered = [XYUserDefaults readUserDefaultsRegistered];
    if (countDict.count == 0 && registered != nil) {

        
    }else {
        
        p100 = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p100"];
        p101 = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p101"];
        p102 = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p102"];
        waitingAppraise = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"waitingAppraise"];
        p103 = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p103"];
    }
    //p100:待付款,p101:待发货,p102:待收货,p112:已完成,p111:已取消
    
    [array addObject:@{@"image":@"info_order_bt_1",@"title":@"待付款",@"type":@"1",@"num":p100}];
    [array addObject:@{@"image":@"info_order_bt_2",@"title":@"待发货",@"type":@"2",@"num":p101}];
    [array addObject:@{@"image":@"info_order_bt_3",@"title":@"待收货",@"type":@"3",@"num":p102}];
    [array addObject:@{@"image":@"info_order_bt_4",@"title":@"待评价",@"type":@"4",@"num":waitingAppraise}];
    [array addObject:@{@"image":@"info_order_bt_5",@"title":@"退款/售后",@"type":@"5",@"num":p103}];
    
    for (NSDictionary * dict in array) {
        XYHomeButtonModel * model = [[XYHomeButtonModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        model.num = dict[@"num"];
        
        [self.dataSource addObject:model];
    }
    
    [self.collectionView reloadData];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYHomeButtonCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([XYHomeButtonCVCell class]) forIndexPath:indexPath];
    
    XYHomeButtonModel * model = self.dataSource[indexPath.item];
    
    cell.titleLB.text = model.title;
    cell.iconImageView.image = [UIImage imageNamed:model.image];
    
    if ([model.num isEqualToString:@""] || [model.num isEqualToString:@"0"]) {
        cell.numLB.hidden = YES;
    }else{
        cell.numLB.hidden = NO;
        cell.numLB.text = model.num;
    }
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((XYScreenW )/5, order_button_height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    XYHomeButtonModel * model=self.dataSource[indexPath.row];
    if ([model.type isEqualToString:@"5"]) {
        JXMyRefundAfterSaleViewController *myRefundAfterSaleViewController=[[JXMyRefundAfterSaleViewController alloc]init];
        [self.navigationController pushViewController:myRefundAfterSaleViewController animated:YES];
    }else{
        XYMineOrderListVCViewController * orderListVC = [[XYMineOrderListVCViewController alloc]init];
        orderListVC.selectIndex = indexPath.item+1;
        [self.navigationController pushViewController:orderListVC animated:YES];
    }
    
}

#pragma mark - data net

/**  角标 */
- (void)netOrderCountData
{
    WeakSelf;
    [XYOrderAllNet netOrderCountWithBlock:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf updateDataSource];
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
