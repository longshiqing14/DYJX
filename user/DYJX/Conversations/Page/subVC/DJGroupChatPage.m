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
#import "DJGroupChatWildGroupsViewModel.h"
#import "DJGroupChatHeaderView.h"
#import "DJGroupChatCell.h"
#import "DJCompanyChatCell.h"
#import "DJWildGroupHeaderView.h"
#import "JSExtension.h"
#import "DJAddMorePageViewController.h"

@interface DJGroupChatPage ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong)GroupHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITableView *wildGroupsTableView;
@property (nonatomic, strong)DJGroupChatViewModel *viewModel;
@property (nonatomic, strong)DJGroupChatWildGroupsViewModel *wildGroupsviewModel;
@end

@implementation DJGroupChatPage
{
    NSMutableArray *_isExpandArray;//记录section是否展开
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    self.navigationItem.title = @"内部群";
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

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 20;

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
    [self.viewModel.requestDic setObject:self.headView.textField.text forKey:@"Keyword"];
    [self.tableView.mj_header beginRefreshing];
}
-(void)addClick {
    DJAddMorePageViewController *vc = [[DJAddMorePageViewController alloc] initWithNibName:@"DJAddMorePageViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btnClick:(UIButton *)sender {
//    [self.headView.innerButton setSelected:NO];
//    [self.headView.outsideButton setSelected:NO];
//    [sender setSelected:YES];
//    if (sender.tag == 1) {
//        [self.view bringSubviewToFront:self.tableView];
//    }
//    else {
//        [self.view bringSubviewToFront:self.wildGroupsTableView];
//    }
}

- (void) initExpandArray{
    for (NSInteger i = 0; i < [self.viewModel numberOfSection]; i++) {
        if (i == [self.viewModel numberOfSection] - 1) {
            [_isExpandArray addObject:@"1"];//0:没展开 1:展开

        }else{
            [_isExpandArray addObject:@"0"];//0:没展开 1:展开
            
        }
    }
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
    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatCell" bundle:nil] forCellReuseIdentifier:@"DJGroupChatCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJGroupChatHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJGroupChatHeaderView"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJWildGroupHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJWildGroupHeaderView"];
    
    
    self.tableView.showsVerticalScrollIndicator = NO;
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
    header.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    UILabel *lb = [[UILabel alloc]init];
    lb.textColor = [UIColor colorWithHexString:@"333333"];
    lb.font = [UIFont systemFontOfSize:15];
    lb.text = @"公司内部群";
    
    [header addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    // 设置header
    self.tableView.tableHeaderView = header;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    
    [self.view addSubview:self.headView];
    
    //内部群tableview
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

    if (_isExpandArray.count == 0) {
        return 0;
    }else{
        if ([_isExpandArray[section] isEqualToString:@"0"]) {
            //未展开
            return 0;
        }else{
            //展开
            return [self.viewModel numberOfCell:section];
            
        }
    }

        
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return [self.viewModel numberOfSection];
        
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
        DJGroupChatCell *groupChatCell = [self.tableView dequeueReusableCellWithIdentifier:@"DJGroupChatCell" forIndexPath:indexPath];
        [groupChatCell.userIcon setImageWithURL:[NSURL URLWithString:[[self.viewModel iconImageUrl:indexPath] XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
        groupChatCell.userName.text = [self.viewModel GroupName:indexPath];
        cell = groupChatCell;
        
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section + 1 <=self.viewModel.innerGroupdataArray.count) {
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
    }else{
        DJWildGroupHeaderView *header = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DJWildGroupHeaderView"];
        return header;
    }
    
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
     if (section + 1 <=self.viewModel.innerGroupdataArray.count) {
            if ([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
                ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor colorWithHexString:@"CFEEFF"];
            }
     }else{
         if ([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
             ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
         }
     }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 50;

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf
    if (indexPath.section + 1 <= self.viewModel.innerGroupdataArray.count) {
        
            DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
            [[JSExtension shared] getConversion:self.viewModel.innerGroupdataArray[indexPath.section].Children[indexPath.row].GroupNumber FromId:userModel.UserID type:1 DataSuccess:^(id  _Nonnull response) {
                SKResult *respo = (SKResult *)response;
                NIMSessionType type = NIMSessionTypeTeam;
                [JSExtension shared].type = 1;
                [JSExtension shared].conversionId = respo.Id;
                if (respo.LastMsg.RowData) {
                    NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
                    NSDictionary *dic = [body stringToDictionary];
                    if (dic[@"extra"]) {
                        NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                        [JSExtension shared].targetId = dict[@"TargetId"];
                        [JSExtension shared].targetName = dict[@"TargetName"];
                        [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
                        [JSExtension shared].conversionId = respo.Id;
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
     
        
    }else{
        
        DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
        [[JSExtension shared] getConversion:self.viewModel.wildGroupdataArray[indexPath.section].GroupNumber FromId:userModel.UserID type:1 DataSuccess:^(id  _Nonnull response) {
            SKResult *respo = (SKResult *)response;
            NIMSessionType type = NIMSessionTypeTeam;
            [JSExtension shared].type = 1;
            [JSExtension shared].conversionId = respo.Id;
            if (respo.LastMsg.RowData) {
                NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
                NSDictionary *dic = [body stringToDictionary];
                if (dic[@"extra"]) {
                    NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                    [JSExtension shared].targetId = dict[@"TargetId"];
                    [JSExtension shared].targetName = dict[@"TargetName"];
                    [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
                    [JSExtension shared].conversionId = respo.Id;
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
            if (![YWDTools isNil:weakSelf.headView.textField.text]) {
                [weakSelf.viewModel.requestDic setObject:weakSelf.headView.textField.text forKey:@"Keyword"];
            };
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

- (DJGroupChatWildGroupsViewModel *)wildGroupsviewModel{
    if (!_wildGroupsviewModel) {
        _wildGroupsviewModel = [[DJGroupChatWildGroupsViewModel alloc]init];
    }
    return _wildGroupsviewModel;
}

- (DJGroupChatViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DJGroupChatViewModel alloc]init];
    }
    return _viewModel;
}

@end
