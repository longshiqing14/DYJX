//
//  DYJXFindGroup.m
//  user
//
//  Created by 岩  熊 on 2019/5/5.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXFindGroup.h"
#import "GroupHeadView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "DJGroupChatViewModel.h"
#import "DYJXGroupViewModel.h"
#import "DJGroupChatHeaderView.h"
#import "DJGroupChatCell.h"
#import "DJCompanyChatCell.h"
#import "JSExtension.h"
#import "DJAddMorePageViewController.h"
#import "DYJXNewGroupController.h"

@interface DYJXFindGroup ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong)GroupHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong)UITableView *findGroupsTableView;
@property (nonatomic, strong)DYJXGroupViewModel *findGroupViewModel;

@end

@implementation DYJXFindGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    self.navigationItem.title = @"搜索群";
//    [self initNavigation];
    [self initSubView];
    //    [self.viewModel getMyCompanyAndGroupDataSuccess:^{
    //        [weakSelf initExpandArray];
    //        [weakSelf.tableView reloadData];
    //    } failed:^(NSString *errorMsg) {
    //
    //    }];
    
    if (![YWDTools isNil:self.Keyword]) {
        [self.findGroupViewModel.requestDic setObject:self.Keyword forKey:@"Keyword"];
    };
    
    [self.findGroupViewModel refreshDataSuccess:^{
        [weakSelf.findGroupsTableView reloadData];
    } failed:^(NSString * _Nonnull errorMsg) {
        
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
    
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 20;
    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (void)black_controller{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Action
-(void)searchClick {
    if (![YWDTools isNil:self.headView.textField.text]) {
            [self.findGroupViewModel.requestDic setObject:self.headView.textField.text forKey:@"Keyword"];
    };

    [self.findGroupsTableView.mj_header beginRefreshing];
    
}
-(void)addClick {
    DJAddMorePageViewController *vc = [[DJAddMorePageViewController alloc] initWithNibName:@"DJAddMorePageViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)btnClick:(UIButton *)sender {
    [self.headView.innerButton setSelected:NO];
    [self.headView.outsideButton setSelected:NO];
    [sender setSelected:YES];
//    if (sender.tag == 1) {
//        [self.view bringSubviewToFront:self.tableView];
//    }
//    else {
//        [self.view bringSubviewToFront:self.wildGroupsTableView];
//    }
}


#pragma mark - UI
-(GroupHeadView *)headView {
    if (!_headView) {
        _headView = [[GroupHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
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
    //    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatCell" bundle:nil] forCellReuseIdentifier:@"DJGroupChatCell"];
    //    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJGroupChatHeaderView"];
    
    [self.findGroupsTableView registerNib:[UINib nibWithNibName:@"DJCompanyChatCell" bundle:nil] forCellReuseIdentifier:@"DJCompanyChatCell"];
    
    self.findGroupsTableView.showsVerticalScrollIndicator = NO;

    [self.findGroupsTableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    
    [self.view addSubview:self.headView];
    self.headView.addButton.hidden = YES;
    
    [self.view addSubview:self.findGroupsTableView];
    [self.findGroupsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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

        return [self.findGroupViewModel numberOfCell];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;

        
        DJCompanyChatCell *wildGroupcell = [tableView dequeueReusableCellWithIdentifier:@"DJCompanyChatCell" forIndexPath:indexPath];
        [wildGroupcell.userIcon setImageWithURL:[NSURL URLWithString:[[self.findGroupViewModel iconImageUrl:indexPath] XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
        wildGroupcell.userName.text = [self.findGroupViewModel GroupName:indexPath];
        cell = wildGroupcell;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        return [UIView new];
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

        return 0;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DYJXNewGroupController *NewGroupVC = [[DYJXNewGroupController alloc]init];
    [self.navigationController pushViewController:NewGroupVC animated:YES];
    
    
    WeakSelf
        DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
        [[JSExtension shared] getConversion:[self.findGroupViewModel sectionHeaderGroupNumber:indexPath] FromId:userModel.UserID type:1 DataSuccess:^(id  _Nonnull response) {
            SKResult *respo = (SKResult *)response;
            NIMSessionType type = NIMSessionTypeTeam;
            [JSExtension shared].type = 1;
            if (respo.LastMsg.RowData) {
                NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
                NSDictionary *dic = [body stringToDictionary];
                if (dic[@"extra"]) {
                    NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                    [JSExtension shared].targetId = dict[@"TargetId"];
                    [JSExtension shared].targetName = dict[@"TargetName"];
                    [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
                    [JSExtension shared].conversionId = respo.LastMsg.ConversationId;
                }
            }
            
            if([JSExtension shared].conversionId.length) {
                [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
                
                NIMSession *session = [NIMSession session:respo.LastMsg.ConversationId type:type];
                [JSExtension shared].session = session;
                JXChatViewController *chatVC = [[JXChatViewController alloc] initWithSession:session];
                RCConversationModel *chatModel = [[RCConversationModel alloc] init];
                chatModel.targetId = [JSExtension shared].conversionId;
                [JSExtension shared].chatVC = chatVC;
                chatVC.naviTitle = respo.TargetName;
                chatVC.chatModel = chatModel;
                [weakSelf.navigationController pushViewController:chatVC animated:YES];
            }
            else {
                [weakSelf.view makeToast:@"会话ID获取失败"];
            }
        } failed:^(NSString * _Nonnull errorMsg) {
            [weakSelf.view makeToast:@"会话ID获取失败"];
        }];
        
        
}

- (void)addTableViewHeaderTapActionWithSection:(NSInteger)section header:(UITableViewHeaderFooterView*)header{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    [header addGestureRecognizer:tap];
    header.tag = section;
    
}




#pragma mark - UI

- (UITableView *)findGroupsTableView{
    WeakSelf;
    if (!_findGroupsTableView) {
        _findGroupsTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _findGroupsTableView.delegate = self;
        _findGroupsTableView.dataSource = self;
        _findGroupsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (![YWDTools isNil:weakSelf.headView.textField.text]) {
                [weakSelf.findGroupViewModel.requestDic setObject:weakSelf.headView.textField.text forKey:@"Keyword"];
            };
            
            [weakSelf.findGroupViewModel refreshDataSuccess:^{
                [weakSelf.findGroupsTableView.mj_header endRefreshing];
                [weakSelf.findGroupsTableView reloadData];
            } failed:^(NSString * _Nonnull errorMsg) {
                
            }];
        }];
        
        _findGroupsTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.findGroupViewModel loadMoreDataSuccess:^{
                [weakSelf.findGroupsTableView.mj_footer endRefreshing];
                [weakSelf.findGroupsTableView reloadData];
            } failed:^(NSString *errorMsg) {
                [weakSelf.findGroupsTableView.mj_footer endRefreshing];
            }];
            
        }];
        
        _findGroupsTableView.backgroundColor = [UIColor whiteColor];
    }
    return _findGroupsTableView;
}

- (DYJXGroupViewModel *)findGroupViewModel{
    if (!_findGroupViewModel) {
        _findGroupViewModel = [[DYJXGroupViewModel alloc]init];
    }
    return _findGroupViewModel;
}




@end
