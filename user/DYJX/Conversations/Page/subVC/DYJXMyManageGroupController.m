//
//  DYJXMyManageGroupController.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXMyManageGroupController.h"
#import "DYJXMyManageGroupViewModel.h"
#import "DYJXMyManageGroupCell.h"

@interface DYJXMyManageGroupController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DYJXMyManageGroupViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DYJXMyManageGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self getInviteIntoMyManageGroup];
}

- (void)setNavigation {
    self.navigationItem.title = @"添加到群组";
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(uploadManageGroup)];
    self.navigationItem.rightBarButtonItem=rightitem;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];
}

- (void)uploadManageGroup {
    WeakSelf
    [self.viewModel uploadUserWithSuccess:^(id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popViewControllerAnimated:NO];
        });
    } failed:^(NSString * _Nonnull errMsg) {
        
    }];
}

- (void)getInviteIntoMyManageGroup {
    WeakSelf
    [self.viewModel getInviteIntoMyManageGroupSuccess:^(id  _Nonnull response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failed:^(NSString * _Nonnull errorMsg) {
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXMyManageGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYJXMyManageGroupCell" forIndexPath:indexPath];
    [cell setValue:self.viewModel.dataArray[indexPath.row] forKey:@"model"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return __X(68.5 * 2);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DYJXMyManageGroupCell class] forCellReuseIdentifier:@"DYJXMyManageGroupCell"];
    }
    return _tableView;
}

-(DYJXMyManageGroupViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DYJXMyManageGroupViewModel alloc]init];
    }
    return _viewModel;
}

@end
