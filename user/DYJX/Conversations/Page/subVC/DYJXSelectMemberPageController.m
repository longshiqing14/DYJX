//
//  DYJXSelectMemberPageController.m
//  user
//
//  Created by YP on 2019/5/21.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXSelectMemberPageController.h"
#import "DYJXAddGroupMemberModel.h"
#import "HeadSearchView.h"
#import "DYJXAddGroupMemberCell.h"

@interface DYJXSelectMemberPageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation DYJXSelectMemberPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigation];
    [self headView];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;

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
    if (self.block) {
        WeakSelf
        if (self.operatorType == OperatorMemberDelete) {
            NSArray<DYJXAddGroupSubMemberModel *> *memberModels = self.memberModels.copy;
            [memberModels enumerateObjectsUsingBlock:^(DYJXAddGroupSubMemberModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.isSelection) {
                    NSInteger index = [weakSelf.memberModels containsObject:obj];
                    [weakSelf.membersArray removeObjectAtIndex:index];
                    [weakSelf.MemberIds removeObjectAtIndex:index];
                    [weakSelf.memberModels removeObjectAtIndex:index];
                }
            }];
        }
        self.block(self.memberModels.mutableCopy,self.membersArray.mutableCopy,self.MemberIds);
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (NSInteger)searchWithId:(NSString *)Id {
    __block NSInteger index;
    [self.memberModels enumerateObjectsUsingBlock:^(DYJXAddGroupSubMemberModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.GroupNumber isEqualToString:Id]) {
            index = idx;
            *stop = YES;
        }
    }];
    return index;
}

- (void)searchClick {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.memberModels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXAddGroupMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYJXAddGroupMemberCell" forIndexPath:indexPath];
    [cell setValue:self.memberModels[indexPath.row] forKey:@"model"];
    cell.operatorType = self.operatorType;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        return [UIView new];
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
    return CGFLOAT_MIN;
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
    }
    return _tableView;
}

-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)memberModels {
    if (!_memberModels) {
        _memberModels = [[NSMutableArray alloc]init];
    }
    return _memberModels;
}

-(NSMutableArray<NSString *> *)MemberIds {
    if (!_MemberIds) {
        _MemberIds = [[NSMutableArray alloc]init];
    }
    return _MemberIds;
}


@end
