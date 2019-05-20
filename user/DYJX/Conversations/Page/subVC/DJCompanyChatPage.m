//
//  DJCompanyChatPage.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJCompanyChatPage.h"
#import "ConpanyHeadView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "DJCompanyChatViewModel.h"
#import "DJCompanyChatCell.h"
#import "DJCompanyChatHeader.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import "WebAppController.h"
#import "JSExtension.h"
#import "DYJXAddCompanyPageController.h"

@interface DJCompanyChatPage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)ConpanyHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer *shanghaoTapGestureRecognizer;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)DJCompanyChatViewModel *viewModel;
@end

@implementation DJCompanyChatPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [self initNavigation];
    [self.view addSubview:self.headView];
//    [self initNavigator];
    [self initSubView];
    [self.viewModel getMyGroupsDataSuccess:^{
        [weakSelf.tableView reloadData];
    } failed:^(NSString *errorMsg) {
        
    }];
}


- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];

    UIImage *image = [UIImage imageNamed:@"btn_home"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    titleLb.text = @"公司";
    titleLb.textColor = [UIColor colorWithHexString:@"#F2A73B"];
    titleLb.font = [UIFont systemFontOfSize:17];
    
    UIBarButtonItem *leftSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    leftSpace.width = 80;
    
    self.navigationItem.leftBarButtonItems= @[item,leftSpace,[[UIBarButtonItem alloc]initWithCustomView:titleLb]];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 20;

    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    UILabel *shanghaoLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    shanghaoLb.text = @"我的商号";
    shanghaoLb.textColor = [UIColor colorWithHexString:@"FFFFFF"];
    shanghaoLb.font = [UIFont systemFontOfSize:17];
    
    UIView *shanghaoCustomView = [[UIView alloc] initWithFrame: shanghaoLb.frame];
    [shanghaoCustomView addGestureRecognizer:self.shanghaoTapGestureRecognizer];
    [shanghaoCustomView addSubview: shanghaoLb];
    
    UIBarButtonItem *rightSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    rightSpace.width = 80;
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:rightCustomView],rightSpace,[[UIBarButtonItem alloc]initWithCustomView:shanghaoCustomView]];

}

- (void)black_controller{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Action
-(void)searchClick {

}
-(void)addClick {// 新增公司
    DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(DYJXAddCompanyType_None) requestDic:self.viewModel.requestDic result:[[DYJXXYResult alloc]init]];
    [self.navigationController pushViewController:page animated:YES];
}

#pragma mark - UI
-(ConpanyHeadView *)headView {
    if (!_headView) {
        _headView = [[ConpanyHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBackPage)];
    }
    return _tapGestureRecognizer;
}

- (UITapGestureRecognizer *)shanghaoTapGestureRecognizer{
    if (!_shanghaoTapGestureRecognizer) {
        _shanghaoTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToShangHaoPage)];
    }
    return _shanghaoTapGestureRecognizer;
}

- (void)goBackPage{
    XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];
}

- (void)goToShangHaoPage{
    [JSExtension shared].action = @"myNumber";
    WebAppController  *pWebAppController = [[WebAppController alloc] init];
    self.navigationController.navigationBarHidden = YES;
    pWebAppController.AppId = @"com.zlMax.myNumber";
    [self.navigationController pushViewController:pWebAppController animated:YES];
}

- (void)initSubView{
    [self.tableView registerNib:[UINib nibWithNibName:@"DJCompanyChatCell" bundle:nil] forCellReuseIdentifier:@"DJCompanyChatCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJCompanyChatHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJCompanyChatHeader"];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];

    [self.view addSubview:self.headView];

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headView.mas_bottom).mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.viewModel numberOfCell];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DJCompanyChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJCompanyChatCell" forIndexPath:indexPath];
    [cell.userIcon setImageWithURL:[NSURL URLWithString:[[self.viewModel sectionHeadericonImageUrl:indexPath.section] XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
    cell.userName.text = [NSString stringWithFormat:@"%@ %@(全员+管理员)",[self.viewModel GroupNumberString:indexPath],[self.viewModel GroupName:indexPath]];

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DJCompanyChatHeader *header = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DJCompanyChatHeader"];
    header.groupName.text = [self.viewModel sectionHeaderGroupName:section];
    WeakSelf
    header.block = ^{ // 新增子公司
        DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(DYJXAddCompanyType_Sub) requestDic:weakSelf.viewModel.requestDic result:[weakSelf.viewModel getRefundReasonsArray][section]];
        [weakSelf.navigationController pushViewController:page animated:YES];
    };
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXXYResult *result = [self.viewModel getRefundReasonsArray][indexPath.section];
    DYJXAddCompanyType companyType = DYJXAddCompanyType_Details;
    if (result.IsPart) {
        companyType = DYJXAddCompanyType_SubDetails;
    }
    DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(companyType) requestDic:@{} result:result];
    page.groupNumber = result.GroupNumber;
    [self.navigationController pushViewController:page animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

#pragma mark - UI

- (UITableView *)tableView{
    WeakSelf;
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.viewModel getMyGroupsDataSuccess:^{
                [weakSelf.tableView.mj_header endRefreshing];
                [weakSelf.tableView reloadData];
            } failed:^(NSString *errorMsg) {
                
            }];
        }];
    }
    return _tableView;
}

- (DJCompanyChatViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DJCompanyChatViewModel alloc]init];
    }
    return _viewModel;
}

@end
