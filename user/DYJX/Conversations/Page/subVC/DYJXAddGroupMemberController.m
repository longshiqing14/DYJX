//
//  DYJXAddGroupMemberController.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberController.h"
#import "DYJXAddGroupMemberViewModel.h"
#import "HeadSearchView.h"
#import "DYJXAddGroupMemberHeaderView.h"
#import "DYJXAddGroupMemberCell.h"

@interface DYJXAddGroupMemberController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) DYJXAddGroupMemberViewModel *viewModel;

@end

@implementation DYJXAddGroupMemberController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigation];
    [self headView];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    WeakSelf
    [self.viewModel getMyEnterprisesWithSuccess:^(id  _Nonnull response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}

- (void)initNavigation{
    self.navigationItem.title = @"选择成员"; self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(commitSelectMember) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)commitSelectMember {
    
}

- (void)searchClick{
    WeakSelf;
    //如果不是添加成员 不能筛选
    if (self.operatorType != OperatorMemberAdd) {
        return;
    }
    [self.view endEditing:YES];
    self.viewModel.isSearchUser = YES;
    [self.viewModel getSearchUserWithKeyword:self.headView.textField.text Success:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXAddGroupMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYJXAddGroupMemberCell" forIndexPath:indexPath];
    cell.isSearchUser = self.viewModel.isSearchUser;
    if (self.viewModel.isSearchUser) {
        [cell setValue:self.viewModel.searchDataArray[indexPath.row] forKey:@"model"];
    }else {
        [cell setValue:self.viewModel.dataArray[indexPath.section].groupSubMembers[indexPath.row] forKey:@"model"];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.isSearchUser) {
        return [UIView new];
    }else {
        DYJXAddGroupMemberHeaderView *header = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DYJXAddGroupMemberHeaderView"];
        [header setValue:self.viewModel.dataArray[section] forKey:@"model"];
        WeakSelf
        header.block = ^(DYJXAddGroupMemberHeaderView *headerView) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView layoutIfNeeded];
        };
        header.allElectionBlock = ^(DYJXAddGroupMemberHeaderView *headerView) {
            [weakSelf.tableView reloadData];
        };
        return header;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXAddGroupMemberCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell tapSelectionClcik];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.viewModel.isSearchUser) {
        return CGFLOAT_MIN;
    }
    return 50;
}

-(DYJXAddGroupMemberViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXAddGroupMemberViewModel alloc]init];
    }
    return _viewModel;
}

#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [self.view addSubview:_headView];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.headView.mas_bottom).mas_equalTo(0);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DYJXAddGroupMemberCell class] forCellReuseIdentifier:@"DYJXAddGroupMemberCell"];
        [_tableView registerClass:[DYJXAddGroupMemberHeaderView class] forHeaderFooterViewReuseIdentifier:@"DYJXAddGroupMemberHeaderView"];
    }
    return _tableView;
}

@end
