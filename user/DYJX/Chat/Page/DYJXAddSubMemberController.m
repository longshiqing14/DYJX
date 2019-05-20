//
//  DYJXAddSubMemberController.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddSubMemberController.h"
#import "DJCompanyChatHeader.h"
#import "DYJXAddCompanyPageController.h"
#import "DJCompanyChatCell.h"

@interface DYJXAddSubMemberController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)DYJXXYResult *result;

@end

@implementation DYJXAddSubMemberController


-(instancetype)initWithCompanyResult:(DYJXXYResult *)result {
    self = [super init];
    if (self) {
        self.result = result;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
    [self setNavigation];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
//    [self.viewModel getMyEnterprisesWithClientId:@"" success:^(id  _Nonnull response) {
//
//    } failed:^(NSString * _Nonnull errorMsg) {
//
//    }];
}

- (void)setNavigation {
    self.title = @"子公司";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.result.Children.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJCompanyChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJCompanyChatCell" forIndexPath:indexPath];
    [cell.userIcon setImageWithURL:[NSURL URLWithString:[self.result.Children[indexPath.row].GroupHeadImg XYImageURL]] placeholder:[UIImage imageNamed:@"person_orange"]];
    cell.userName.text = [NSString stringWithFormat:@"%@ %@(全员+管理员)",self.result.Children[indexPath.row].NumberString,self.result.Children[indexPath.row].GroupName];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DJCompanyChatHeader *header = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DJCompanyChatHeader"];
    header.groupName.text = self.result.GroupName;
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc]init];
    [requestDic setObject:userModel.UserID forKey:@"UserID"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:userModel.MemberID forKey:@"MemberID"];
    [requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [requestDic setObject:@"1" forKey:@"GroupType"];
    WeakSelf
    header.block = ^{ // 新增子公司
        DYJXAddCompanyPageController *page = [[DYJXAddCompanyPageController alloc]initWithCompanyType:(DYJXAddCompanyType_Sub) requestDic:requestDic result:weakSelf.result];
        [weakSelf.navigationController pushViewController:page animated:YES];
    };
    return header;
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
    return 50;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(@0);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"DJCompanyChatCell" bundle:nil] forCellReuseIdentifier:@"DJCompanyChatCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"DJCompanyChatHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"DJCompanyChatHeader"];
    }
    return _tableView;
}

@end
