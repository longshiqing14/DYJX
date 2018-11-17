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
#import "DYJXLogisticPage.h"
#import "DYJXIdentitySwitchingModel.h"
#import "JSExtension.h"
#import "AppDelegate.h"
#import "XJInfoDetailPage.h"

@interface DYJXIdentitySwitchingPage ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)DYJXIdentitySwitchingViewModel *viewModel;
@property(nonatomic, strong)DYJXIdentitySwitchingModel *selectedIdentity;
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
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF"]];
    
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
    
    return [self.viewModel numberOfCell];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXIdentitySwitchingCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSArray *titles = @[@"本人\n详情",@"公司\n详情",@"子公司\n  详情"];
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[[self.viewModel iconImageUrl:indexPath] XYImageURL]] placeholderImage:[UIImage imageNamed:@"btn_group"]];
    [tableCell.detailButton addTarget:self action:@selector(btnClick:)
                     forControlEvents:UIControlEventTouchUpInside];
    tableCell.detailButton.tag = indexPath.row;
    tableCell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:", [self.viewModel GroupNumberString:indexPath]];
    tableCell.sellingPointLable.text = [NSString stringWithFormat:@"%@%@",[self.viewModel GroupName:indexPath],@"(参与者)"];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 60;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    DYJXIdentitySwitchingHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
//    if (header == nil) {
//        header = [[DYJXIdentitySwitchingHeader alloc] initWithReuseIdentifier:headerID];
//    }
//
//    [header.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel sectionHeadericonImageUrl:section]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    header.goodsNameLabel.text = [self.viewModel sectionHeaderGroupName:section];
//    header.sellingPointLable.text = [self.viewModel sectionHeaderGroupNumberString:section];
//    return header;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIdentity = [self.viewModel IdentityAtIndexPath:indexPath];
    [JSExtension shared].myIdentityId = self.selectedIdentity.Id;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYJXIdentitySwitchingModel *)selectedIdentity{
    if (!_selectedIdentity) {
        _selectedIdentity = [[DYJXIdentitySwitchingModel alloc] init];
    }
    return _selectedIdentity;
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
    CGFloat sectionHeaderHeight = 60;
    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - Action
-(void)btnClick:(UIButton *)sender {
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    DYJXIdentitySwitchingModel *model  = [self.viewModel IdentityAtIndexPath:indexpath];
    XJInfoDetailPage *target = [[XJInfoDetailPage alloc] init];
    [self.navigationController pushViewController:target animated:true];
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
    if ([YWDTools isNil:self.selectedIdentity.GroupNumber]) {
        [YDBAlertView showToast:@"请选择一个身份!"];
        return;
    }

    [JSExtension shared].myIdentityId = self.selectedIdentity.Id;
    [XYUserDefaults writeLoginedInfoRongTokenModel:self.selectedIdentity.Owner];
    AppDelegate *appD = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (appD) {
        [appD IMInit];
    }

    DYJXLogisticPage *logisticPage = [[DYJXLogisticPage alloc]initWithNibName:@"DYJXLogisticPage" bundle:nil];
    logisticPage.IdentityModel = self.selectedIdentity;
    
    [XYUserDefaults writeAppDlegateOfCertificateId:self.selectedIdentity.GroupNumber];
    [self.navigationController pushViewController:logisticPage animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

@end
