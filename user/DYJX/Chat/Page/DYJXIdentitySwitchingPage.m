//
//  DYJXIdentitySwitchingPage.m
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingPage.h"
#import "DYJXIdentitySwitchingViewModel.h"
#import "DYJXIdentitySwitchingCell.h"
#import "NaviViewController.h"
#import "DYJXLoginPage.h"
#import "DYJXFindPasswordPage.h"
#import "DYJXIdentitySwitchingHeader.h"

@interface DYJXIdentitySwitchingPage ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)DYJXIdentitySwitchingViewModel *viewModel;
@end

static NSString *cellID=@"cellID";
static NSString *headerID=@"headerID";

@implementation DYJXIdentitySwitchingPage


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self.tableView registerClass:[DYJXIdentitySwitchingCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[DYJXIdentitySwitchingHeader class] forHeaderFooterViewReuseIdentifier:@"headerID"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
//    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4"]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self GetUserInfo];

}

- (void)initNavigation{
    self.title = @"身份切换";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(IdentitySwitchingCommit) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    [self.otherTableView.mj_header beginRefreshing];
}

- (void)GetUserInfo{
    WeakSelf;
    [self.viewModel getUserInfoSuccess:^{
        [weakSelf.viewModel getMyEnterprisesSuccess:^{
             [weakSelf.tableView reloadData];
        } failed:^(NSString *errorMsg) {
            
        }];
    } failed:^(NSString *errorMsg) {
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel numberOfCell:section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.viewModel numberOfSection];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXIdentitySwitchingCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel iconImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    tableCell.goodsNameLabel.text = [self.viewModel GroupName:indexPath];
    tableCell.sellingPointLable.text = [self.viewModel GroupNumberString:indexPath];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DYJXIdentitySwitchingHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (header == nil) {
        header = [[DYJXIdentitySwitchingHeader alloc] initWithReuseIdentifier:headerID];
    }

    [header.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel sectionHeadericonImageUrl:section]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    header.goodsNameLabel.text = [self.viewModel sectionHeaderGroupName:section];
    header.sellingPointLable.text = [self.viewModel sectionHeaderGroupNumberString:section];
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYJXIdentitySwitchingViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXIdentitySwitchingViewModel alloc] init];
    }
    return _viewModel;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //headerView
    //去掉UItableview的section的headerview黏性
    CGFloat sectionHeaderHeight = 46;
    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (IBAction)logoutBTN:(UIButton *)sender {
    [self.viewModel logoutSuccess:^{
        [YDBAlertView showToast:@"退出登录成功！"];
        [XYUserDefaults deleteUserDefaultsLoginedInfoModel];
        XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXLoginPage alloc] initWithNibName:@"DYJXLoginPage" bundle:nil]];
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (IBAction)modify:(UIButton *)sender {
    
    DYJXFindPasswordPage *findPasswordPage = [[DYJXFindPasswordPage alloc]initWithNibName:@"DYJXFindPasswordPage" bundle:nil];
    [self.navigationController pushViewController:findPasswordPage animated:YES];
}

- (void)IdentitySwitchingCommit{
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
