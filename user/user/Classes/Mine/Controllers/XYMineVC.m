//
//  XYMineVC.m
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineVC.h"

#import "XYBestNavigationVC.h"
#import "XYLoginVC.h"
#import "XYUserDefaults.h"
#import "JXHelpCenterViewController.h"
#import "XYMineTVCell.h"
#import "XYMineListModel.h"

#import "XYMineHeaderVC.h"// 页面 头
#import "XYMineOrderButtonVC.h" // 订单 分类 按钮

#import "XYTableViewFooterIntervalView.h" // tableview footerview

#import "XYLoginAndRegisterNet.h"

#import "XYEWalletVC.h"         //电子钱包
#import "XYPersonalInfoVC.h"    //个人信息

#import "XYDelieveryAddressVC.h"

#import <WebKit/WebKit.h>
#import "XYMyBoardBandVC.h" //我的宽带

#import "XYMineAllNet.h" //客服请求

#import "XYHomeAllNet.h"  //红点

#import "XYMineAboutUsVC.h" // 关于我们
#import "XYNotificationCenterWebVC.h" //消息

#import "JXSearchHistoryPage.h"
#import "XYUMSocialShareView.h"
#import "JXShareManager.h"
#import "JXShareModel.h"
#import "JXRefundCashPage.h"


@interface XYMineVC () <UITableViewDelegate,UITableViewDataSource,XYMineOrderButtonVCDelegate>


@property (nonatomic, strong) UITableView * tableView;

/** 头 */
@property (nonatomic, strong) UIView * headerView;

/** 头 视图 */
@property (nonatomic, strong) XYMineHeaderVC * mineHeaderVC;

/** 分类 按钮 视图 */
@property (nonatomic, strong) XYMineOrderButtonVC * orderButtonVC;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * functionDataSource;
/** 数据 */
@property (nonatomic, strong) NSMutableArray * accessDataSource;
/** 客服 字典
 *label 电话的显示文字，加了分隔符的   
 *phone 电话号码 
 */
@property(strong,nonatomic) NSDictionary *customerServiceDic ;

/** 选中拨号*/
@property(assign,nonatomic) BOOL selectDia ;

/** 信息上的红点 */
@property(strong,nonatomic) UIView *redPointView;


@end

@implementation XYMineVC

static CGFloat const redPointWidth = 8.f;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = XYGlobalBg;
   
    [self addNavRightRedPoint];
 
    [self addViewAndLayout];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netMineInfoData) name:LOGIN_SUCCESS object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self netMineInfoData];
    
    [self netMsgUnread];
    
    [self netCustomerData];

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

/** 添加 view */
- (void)addViewAndLayout
{
    [self updateDataSource];
    
    [self.view addSubview:self.tableView];
    WeakSelf;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
    }];
    
}
/** 导航右按钮 */
-(void)addNavRightRedPoint{
    
    UIButton* rightBT= [UIButton buttonWithType:UIButtonTypeCustom];
    rightBT.frame = CGRectMake(0, 0, 44, 44);
    rightBT.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    [rightBT setImage:[UIImage imageNamed:@"nav_btn_imessage"] forState:UIControlStateNormal];
    [rightBT addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.redPointView.frame = CGRectMake(44/2.0+21/2.0-redPointWidth/2 +10,44/2.0-33/2.0+redPointWidth/2 , redPointWidth, redPointWidth);
    [rightBT addSubview:self.redPointView];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItem = rightBar;
    
}

#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = header;
    
}

- (void)loadNewData
{
    [self netMineInfoData];
    [self.orderButtonVC netOrderCountData];
}

- (void)endHeaderWithFootRefresh:(BOOL)refresh
{
    if (refresh) {
        [self.tableView.mj_header endRefreshing];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
}


#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(datafromSever)];
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, mine_header_height)];
        _headerView.backgroundColor = XYWhiteColor;
        
        [_headerView addSubview:self.mineHeaderVC.view];
        
        [self.mineHeaderVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
        
    }
    return _headerView;
}

- (XYMineHeaderVC*)mineHeaderVC
{
    if (_mineHeaderVC == nil) {
        _mineHeaderVC = [[XYMineHeaderVC alloc]init];
        _mineHeaderVC.view.frame = CGRectZero;
        
        [self addChildViewController:_mineHeaderVC];
    }
    return _mineHeaderVC;
}

- (XYMineOrderButtonVC*)orderButtonVC
{
    if (_orderButtonVC == nil) {
        _orderButtonVC = [[XYMineOrderButtonVC alloc]init];
        _orderButtonVC.view.frame = CGRectZero;
        _orderButtonVC.delegate = self;
        [self addChildViewController:_orderButtonVC];
    }
    return _orderButtonVC;
}

-(UIView *)redPointView
{
    if (!_redPointView) {
        _redPointView = [[UIView alloc] init];
        _redPointView.layer.cornerRadius = redPointWidth/2;
        _redPointView.layer.masksToBounds = YES;
        _redPointView.backgroundColor = [UIColor redColor];
    }
    return _redPointView;
    
}

- (NSMutableArray*)functionDataSource
{
    if (_functionDataSource == nil) {
        _functionDataSource = [NSMutableArray array];
    }
    return _functionDataSource;
}

- (NSMutableArray*)accessDataSource
{
    if (_accessDataSource == nil) {
        _accessDataSource = [NSMutableArray array];
    }
    return _accessDataSource;
}

- (void)updateDataSource
{
    if (self.functionDataSource.count != 0) {
        [self.functionDataSource removeAllObjects];
    }
    if (self.accessDataSource.count != 0) {
        [self.accessDataSource removeAllObjects];
    }
    
    
    NSMutableArray * functinArray = [NSMutableArray array];
    NSMutableArray * accessArray = [NSMutableArray array];
    
    NSString * serviceNum = @"";
    if (self.customerServiceDic.count != 0) {
        if ([self.customerServiceDic[@"label"] isKindOfClass:[NSString class]]) {
            serviceNum = self.customerServiceDic[@"label"];
        }
    }
    
//    [array addObject:@{@"image":@"info_list_icon_money",@"title":@"我的钱包",@"type":@"1",@"sub":@"",@"haveArrow":@"1"}];

    //    设置
    [functinArray addObject:@{@"image":@"info_list_icon_person",@"title":@"个人信息",@"type":@"1",@"sub":@"",@"haveArrow":@"1"}];
    [functinArray addObject:@{@"image":@"info_list_icon_collect",@"title":@"我的宽带",@"type":@"3",@"sub":@"",@"haveArrow":@"1"}];
    [functinArray addObject:@{@"image":@"info_list_icon_address",@"title":@"收货地址",@"type":@"4",@"sub":@"",@"haveArrow":@"1"}];

    [accessArray addObject:@{@"image":@"info_list_icon_service",@"title":@"帮助与客服",@"type":@"6",@"sub":@"",@"haveArrow":@"1"}];
//    [accessArray addObject:@{@"image":@"info_list_icon_service",@"title":@"联系客服",@"type":@"6",@"sub":serviceNum,@"haveArrow":@"0"}];
    [accessArray addObject:@{@"image":@"info_list_icon_aboutus",@"title":@"关于我们",@"type":@"7",@"sub":@"",@"haveArrow":@"1"}];
    [accessArray addObject:@{@"image":@"info_list_icon_share",@"title":@"分享App",@"type":@"8",@"sub":@"",@"haveArrow":@"1"}];

    
    for (NSDictionary * dict in functinArray) {
        XYMineListModel * model = [[XYMineListModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        model.sub = dict[@"sub"];
        model.haveArrow = dict[@"haveArrow"];
        
        [self.functionDataSource addObject:model];
    }
    for (NSDictionary * dict in accessArray) {
        XYMineListModel * model = [[XYMineListModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        model.sub = dict[@"sub"];
        model.haveArrow = dict[@"haveArrow"];
        
        [self.accessDataSource addObject:model];
    }
    
    [self.tableView reloadData];
}

#pragma mark - button click

/** 导航右按钮 信息 */
- (void)rightClick:(UIButton*)sender
{
    
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    XYNotificationCenterWebVC *noteWebVC = [[XYNotificationCenterWebVC alloc] init];
    
    [self.navigationController pushViewController:noteWebVC animated:YES];
    
}


#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.functionDataSource.count;
    }else if (section == 2){
        return self.accessDataSource.count;
    }

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 111;
    }else if (indexPath.section == 1 || indexPath.section == 2 ){
        return 50;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    if (section == 1 || section == 2) {
        return 10;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.contentView addSubview:self.orderButtonVC.view];
        
        [self.orderButtonVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        return cell;
    }else if (indexPath.section == 1){
        
        XYMineTVCell * cell = [XYMineTVCell cellWithTableView:tableView];
        
        cell.buttonModel = self.functionDataSource[indexPath.row];
        
        return cell;
    }else if (indexPath.section == 2){
        
        XYMineTVCell * cell = [XYMineTVCell cellWithTableView:tableView];
        
        cell.buttonModel = self.accessDataSource[indexPath.row];
        
        return cell;
    }

    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return;
    }    
    
    if (indexPath.section == 1) {
        
        XYMineListModel * model  = self.functionDataSource[indexPath.row];
        
        if ([model.type isEqualToString:@"6"] || [model.type isEqualToString:@"7"]) {
            
        }else{
            if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
                [XYCommon setPresentViewControllerWithLoginView];
                return;
            }
        }
        
        
        if ([model.type isEqualToString:@"1"]) {
            
            XYPersonalInfoVC * personalInfoVC = [[XYPersonalInfoVC alloc]init];
            [self.navigationController pushViewController:personalInfoVC animated:YES];
            
        }else if ([model.type isEqualToString:@"2"]){
            
            XYPersonalInfoVC * personalInfoVC = [[XYPersonalInfoVC alloc]init];
            [self.navigationController pushViewController:personalInfoVC animated:YES];
            
        }else if ([model.type isEqualToString:@"3"]){
            //        现在修改一个账号添加多个宽带信息
            UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //这个字符串是你要跳转面板的名字
            UIViewController *main =[board instantiateViewControllerWithIdentifier:@"JXMyBroadbandID"];
            [self.navigationController pushViewController:main animated:YES];
            //        之前的宽带信息
            //        [self.navigationController pushViewController:[XYMyBoardBandVC new] animated:YES];
            
        }else if ([model.type isEqualToString:@"4"]){
            
            XYDelieveryAddressVC *addressVC = [[XYDelieveryAddressVC alloc] init];
            [self.navigationController pushViewController:addressVC animated:YES];
        }else if ([model.type isEqualToString:@"5"]){
            XYPersonalInfoVC * personalInfoVC = [[XYPersonalInfoVC alloc]init];
            [self.navigationController pushViewController:personalInfoVC animated:YES];
        }
    }
    
    if (indexPath.section == 2) {
        XYMineListModel * model  = self.accessDataSource[indexPath.row];

         if ([model.type isEqualToString:@"6"]){
             JXHelpCenterViewController *helpCenterViewController=[[JXHelpCenterViewController alloc]init];
             helpCenterViewController.webURLstr =[NSString stringWithFormat:@"%@%@",BEST_H5_URL,kJXAPI_user_HelpCenter];
             [self.navigationController pushViewController:helpCenterViewController animated:YES];

             

            
            
        }else if ([model.type isEqualToString:@"7"]){

            XYMineAboutUsVC * aboutVC = [[XYMineAboutUsVC alloc]init];
            [self.navigationController pushViewController:aboutVC animated:YES];
            
            
        }else if ([model.type isEqualToString:@"8"]){
            [JXShareManager getShareInfoFromSeveiceSuccess:^(JXShareModel *model) {
                XYUMSocialShareView * shareView = [[XYUMSocialShareView alloc] initWithTitle:nil cancelButtonTitle:nil shareContent:model.shares[0].content shareTitle:model.shares[0].title iconUrl:model.shares[0].iconUrl shareUrl:model.shares[0].shareUrl];
                [shareView show];
            } fail:^{
                
            }];
            
        }
    }
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XYTableViewFooterIntervalView * footerView = [XYTableViewFooterIntervalView headerWithTableView:tableView];
    if (section == 1 || section == 0 || section == 2 ) {
        footerView.contentView.backgroundColor = XYGlobalBg;
    }else{
        footerView.contentView.backgroundColor = XYWhiteColor;
    }
    
    return footerView;
}


-(void)repeatDelay{

    self.selectDia = NO;
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


#pragma mark - data net

/** 消息 红点 */
-(void)netMsgUnread{
    self.redPointView.hidden = YES;
    if ([XYUserDefaults readUserDefaultsRegistered].count == 0) {
        return;
    }
    WeakSelf;
    [XYHomeAllNet netMessageUnreadBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            NSString *msgNum = [blockDictionary objectForKey:@"totalCount"];
            if ([msgNum integerValue] <= 0) {
                weakSelf.redPointView.hidden = YES;
            }else
            {
                weakSelf.redPointView.hidden = NO;
            }
        }
    }];
}
/** user info */
-(void)netMineInfoData
{
    WeakSelf;
   [XYLoginAndRegisterNet netGetUserInfoListBlock:^(NSDictionary *blockDictionary, NSError *error) {
       [weakSelf endHeaderWithFootRefresh:YES];
       if (error == nil) {
           [weakSelf.mineHeaderVC updateHeaderData];
           
       }
       
   }];

}

/** 客服电话 */
-(void)netCustomerData{

    if (self.customerServiceDic.count != 0) {
        return;
    }
    
    WeakSelf;
    [XYMineAllNet netMineFindCustomerServiceResultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            weakSelf.customerServiceDic = blockDictionary;
            [weakSelf updateDataSource];
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
