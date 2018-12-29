//
//  DYJXSelectMemberPage.m
//  user
//
//  Created by 岩  熊 on 2018/12/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXSelectMemberPage.h"
#import "HeadSearchView.h"
#import "DYJXSelectMemberViewModel.h"
#import "DYJXSelectMemberCell.h"

@interface DYJXSelectMemberPage ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)DYJXSelectMemberViewModel *viewModel;
@property (strong, nonatomic) NSMutableArray<NSString*> *selectIndexsArray;//多选，当前选中
@end

@implementation DYJXSelectMemberPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    self.title = @"选择成员";
    [self initNavigation];
    [self initSubView];

    if (self.operatorType == OperatorMemberAdd) {
        
        [self.viewModel.requestDic setObject:@2 forKey:@"ContactType"];
        [self.viewModel.requestDic setObject:@0 forKey:@"UserType"];
        [self.viewModel.requestDic setObject:@"" forKey:@"Keyword"];
        [self.viewModel.requestDic setObject:@1 forKey:@"PageIndex"];
        [self.viewModel.requestDic setObject:@50 forKey:@"PageSize"];
        [self.viewModel getGroupInfoWithGroupId:@"" Success:^{
            [weakSelf initSelectIndexArray:self.viewModel.dataArray];
            [weakSelf.tableView reloadData];
        } failed:^(NSString *errorMsg) {
            
        }];
        
    }else if (self.operatorType == OperatorMemberDelete){
        
    }else if (self.operatorType == OperatorMemberAccessAdmin){
        
    }else if (self.operatorType == OperatorMemberFireAdmin){
        
    }

    
}

- (void)initNavigation{
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(commitSelectMember) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
}

- (void)initSubView{
    [self.tableView registerNib:[UINib nibWithNibName:@"DYJXSelectMemberCell" bundle:nil] forCellReuseIdentifier:@"DYJXSelectMemberCell"];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF"]];
    [self.view addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
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
    
    return [self.viewModel numberOfCell];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DYJXSelectMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYJXSelectMemberCell" forIndexPath:indexPath];
    [cell.userIcon setImageWithURL:[NSURL URLWithString:[[self.viewModel userIcon:indexPath] XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
    cell.userName.text = [self.viewModel userName:indexPath];
    if ([self.selectIndexsArray[indexPath.row] isEqualToString:@"1"]) { //如果为选中状态
        [cell.selectIcon setImage:[UIImage imageNamed:@"register_checkbox_active"]];
    }else {
        //未选中
        [cell.selectIcon setImage:[UIImage imageNamed:@"register_checkbox"]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.selectIndexsArray[indexPath.row] isEqualToString:@"1"]) { //如果为选中状态
        //切换为未选中
        [self.selectIndexsArray replaceObjectAtIndex:indexPath.row withObject:@"0"]; //数据改为未选中
        [self.tableView reloadData];
    }else { //未选中
        //切换为选中
        [self.selectIndexsArray replaceObjectAtIndex:indexPath.row withObject:@"1"]; //数据改为已选中
        [self.tableView reloadData];
    }
    
}

- (void)initSelectIndexArray:(NSMutableArray<XYDYJXResult*> *)dataArray{
    
    for (int i = 0; i< dataArray.count; i++) {
         [self.selectIndexsArray addObject:@"0"];
    }
}

- (void)commitSelectMember{
    WeakSelf;
   __block NSMutableArray<XYDYJXResult*> *membersArray = [NSMutableArray array];
    [self.selectIndexsArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isEqualToString:@"1"]){
            [membersArray addObject:weakSelf.viewModel.dataArray[idx]];
        };
    }];
    
    if (self.block) {
        self.block(membersArray);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (void)searchClick{
    WeakSelf;
    //如果不是添加成员 不能筛选
    if (self.operatorType != OperatorMemberAdd) {
        return;
    }
    
    [self.viewModel.requestDic setObject:@2 forKey:@"ContactType"];
    [self.viewModel.requestDic setObject:@0 forKey:@"UserType"];
    if ([YWDTools isNil:self.headView.textField.text]) {
      [self.viewModel.requestDic setObject:@"" forKey:@"Keyword"];
    }else{
      [self.viewModel.requestDic setObject:self.headView.textField.text forKey:@"Keyword"];
    }
    
    [self.viewModel.requestDic setObject:@1 forKey:@"PageIndex"];
    [self.viewModel.requestDic setObject:@50 forKey:@"PageSize"];
    [self.viewModel getGroupInfoWithGroupId:@"" Success:^{
        [weakSelf initSelectIndexArray:self.viewModel.dataArray];
        [weakSelf.tableView reloadData];
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (DYJXSelectMemberViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXSelectMemberViewModel alloc]init];
    }
    return _viewModel;
}

- (NSMutableArray<NSString *> *)selectIndexsArray{
    if (!_selectIndexsArray) {
        _selectIndexsArray = [NSMutableArray array];
    }
    return _selectIndexsArray;
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