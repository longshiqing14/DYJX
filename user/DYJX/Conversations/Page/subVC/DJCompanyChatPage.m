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

@interface DJCompanyChatPage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)ConpanyHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)DJCompanyChatViewModel *viewModel;
@end

@implementation DJCompanyChatPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    self.navigationItem.title = @"我创建或参与的公司";
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
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];

    UIImage *image = [UIImage imageNamed:@"btn_home"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 25;

    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (void)black_controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Action
-(void)searchClick {

}
-(void)addClick {

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

- (void)goBackPage{
    XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];

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
    header.block = ^{
        DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
//        page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//        page.groupNumber = self.chatModel.targetId;
//        page.isAdmin = [self isAdmin:model];
        [self.navigationController pushViewController:page animated:YES];
    };
    return header;
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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
