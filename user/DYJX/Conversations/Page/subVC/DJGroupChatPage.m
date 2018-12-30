//
//  DJGroupChatPage.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJGroupChatPage.h"
#import "GroupHeadView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "DJGroupChatViewModel.h"
#import "DJGroupChatHeaderView.h"
#import "DJGroupChatCell.h"

@interface DJGroupChatPage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)GroupHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)DJGroupChatViewModel *viewModel;
@end

@implementation DJGroupChatPage
{
    NSMutableArray *_isExpandArray;//记录section是否展开
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    self.navigationItem.title = @"群组";
    _isExpandArray = [[NSMutableArray alloc]init];
    [self initNavigation];
    [self initSubView];
    [self.viewModel getMyCompanyAndGroupDataSuccess:^{
        [weakSelf initExpandArray];
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
-(void)btnClick:(UIButton *)sender {
    [self.headView.innerButton setSelected:NO];
    [self.headView.outsideButton setSelected:NO];
    [sender setSelected:YES];
    if (sender.tag == 1) {
    }
    else {
    }
}

- (void) initExpandArray{
    for (NSInteger i = 0; i < [self.viewModel numberOfSection]; i++) {
//        if (i == 0) {
//            [_isExpandArray addObject:@"1"];//0:没展开 1:展开
//
//        }else{
            [_isExpandArray addObject:@"0"];//0:没展开 1:展开
            
//        }
    }
}

#pragma mark - UI
-(GroupHeadView *)headView {
    if (!_headView) {
        _headView = [[GroupHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.innerButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.outsideButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackPage)];
    }
    return _tapGestureRecognizer;
}

- (void)goBackPage{
    XYKeyWindow.rootViewController = [[NaviViewController alloc]initWithRootViewController:[[DYJXIdentitySwitchingPage alloc] initWithNibName:@"DYJXIdentitySwitchingPage" bundle:nil]];

}

- (void)initSubView{
    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatCell" bundle:nil] forCellReuseIdentifier:@"DJGroupChatCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJGroupChatHeaderView"];
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
    if ([_isExpandArray[section] isEqualToString:@"0"]) {
        //未展开
        return 0;
    }else{
        //展开
        return [self.viewModel numberOfCell:section];
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.viewModel numberOfSection];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DJGroupChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJGroupChatCell" forIndexPath:indexPath];
    [cell.userIcon setImageWithURL:[NSURL URLWithString:[[self.viewModel iconImageUrl:indexPath] XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
    cell.userName.text = [self.viewModel GroupName:indexPath];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DJGroupChatHeaderView *header = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DJGroupChatHeaderView"];
    header.backgroundColor = [UIColor colorWithHexString:@"C8E5FF"];
    header.groupName.text = [self.viewModel sectionHeaderGroupName:section];
    //    header.block = ^{
    //        DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
    //        //        page.userIconImageURL = [model.GroupHeadImg XYImageURL];
    //        //        page.groupNumber = self.chatModel.targetId;
    //        //        page.isAdmin = [self isAdmin:model];
    //        [self.navigationController pushViewController:page animated:YES];
    //    };
    
    if ([_isExpandArray[section] isEqualToString:@"0"]) {
        //未展开
        [header.arrowImage setImage:[UIImage imageNamed:@"zhedie_upper"]];
        
        
    }else{
        
        [header.arrowImage setImage:[UIImage imageNamed:@"zhedie_down"]];
        
    }
    
    [self addTableViewHeaderTapActionWithSection:section header:header];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor colorWithHexString:@"CFEEFF"];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)addTableViewHeaderTapActionWithSection:(NSInteger)section header:(UITableViewHeaderFooterView*)header{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    [header addGestureRecognizer:tap];
    header.tag = section;
    
}


- (void)tapAction:(UITapGestureRecognizer *)tap{
    WeakSelf;
    
    if ([_isExpandArray[tap.view.tag] isEqualToString:@"0"]) {
        //关闭 => 展开
//        [self updateExpandArray];
        [_isExpandArray removeObjectAtIndex:tap.view.tag];
        [_isExpandArray insertObject:@"1" atIndex:tap.view.tag];
        
    }else{
        //展开 => 关闭
//        [self updateExpandArray];
        [_isExpandArray removeObjectAtIndex:tap.view.tag];
        [_isExpandArray insertObject:@"0" atIndex:tap.view.tag];
    }
    
    //    }
    
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    
}


#pragma mark - UI

- (UITableView *)tableView{
    WeakSelf;
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.viewModel getMyCompanyAndGroupDataSuccess:^{
                [weakSelf.tableView.mj_header endRefreshing];
                [weakSelf.tableView reloadData];
            } failed:^(NSString *errorMsg) {
                
            }];
        }];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (DJGroupChatViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DJGroupChatViewModel alloc]init];
    }
    return _viewModel;
}

@end
