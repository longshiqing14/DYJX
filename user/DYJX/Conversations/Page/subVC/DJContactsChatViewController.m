//
//  DJContactsChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJContactsChatViewController.h"
#import "ContractHeadView.h"
#import "AppDelegate.h"
#import "DYJXIdentitySwitchingPage.h"
#import "NaviViewController.h"
#import "MutableSelectCell.h"
#import "DYGoodCell.h"
#import "JSExtension.h"
#import "DLLSearchContactResponse.h"
#import "DIISearchApply.h"
#import "BlackTableViewCell.h"
#import "DYAgreeTableViewCell.h"
#import "InApplayTableViewCell.h"
#import "DYYBlackListResponse.h"
#import "OtherApplyCell.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import "DNewContractViewController.h"

@interface DJContactsChatViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)ContractHeadView *headView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic,copy)NSString *searchText;
@property (nonatomic, strong)NSMutableArray <DLLResult *> * goodArray;
@property (nonatomic, strong)NSMutableArray <DLLResult *> * genralArray;
@property (nonatomic, strong)NSMutableArray <DIIResult *> * applyArray;
@property (nonatomic, strong)NSMutableArray <DYYResult *> * blackArray;

@end

@implementation DJContactsChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"联系人";
    [self initNavigation];
    [self.view addSubview:self.headView];

    [self.view addSubview:self.tableView];

    _type = 1;

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self reloadData];
    }];

    [self.tableView.mj_header beginRefreshing];
}

- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
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
    if (self.isPersonIdentification) {
        rightCustomView.layer.cornerRadius = 10;
        rightCustomView.clipsToBounds = YES;
    }
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (void)black_controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)reloadData {
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setObject:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:[JSExtension shared].myClientId forKey:@"ClientId"];
    [requestDic setObject:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"CertificateId"];
    if (self.searchText.length) {
        [requestDic setObject:self.searchText forKey:@"Keyword"];
    }
    if (self.type == 1) { // 好友
        [requestDic setObject:@2 forKey:@"ContactType"];
        [self searchText:requestDic];
    }
    else if(self.type == 2) {
        [requestDic setObject:@1 forKey:@"ContactType"];
        [self searchText:requestDic];
    }
    else if(self.type == 3) {
        [self searchApplyText:requestDic];
    }
    else if(self.type == 4) {
        [self searchDisabledList:requestDic];
    }
}

-(void)agreeApplyModel:(DIIResult *)model submit:(BOOL)isSubmit {
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setObject:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:[JSExtension shared].myClientId forKey:@"ClientId"];
    [requestDic setObject:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"CertificateId"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"Id"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"ReplyContent"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:@(isSubmit) forKey:@"IsAgree"];
    [data setObject:model.Id forKey:@"Id"];
    [data setObject:@"" forKey:@"ReplyContent"];
    [requestDic setObject:data forKey:@"Data"];
    [self handleApplay:requestDic];
}

-(void)searchDisabledList:(NSMutableDictionary *)params {
    [XYNetWorking XYPOST:@"SearchBlackList" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                self.blackArray = [[NSArray modelArrayWithClass:[DYYResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                if (self.type == 4) {
                    [self.tableView reloadData];
                }
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)searchApplyText:(NSMutableDictionary *)params {
    [XYNetWorking XYPOST:@"SearchFriendApply" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                self.applyArray = [[NSArray modelArrayWithClass:[DIIResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                if (self.type == 3) {
                    [self.tableView reloadData];
                }
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)handleApplay:(NSMutableDictionary *)params {
    [XYNetWorking XYPOST:@"ProcessFriendApply" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {

            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                [self.tableView.mj_header beginRefreshing];
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];

            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)searchText:(NSMutableDictionary *)params {

    [XYNetWorking XYPOST:@"SearchContact" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {

            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                if (self.type == 1) {
                    self.goodArray = [[NSArray modelArrayWithClass:[DLLResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                    if (self.type == 1) {
                        [self.tableView reloadData];
                    }
                }
                else {
                    self.genralArray = [[NSArray modelArrayWithClass:[DLLResult class] json:[responseObject objectForKey:@"Result"]] mutableCopy];
                    if (self.type == 2) {
                        [self.tableView reloadData];
                    }
                }


            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];

                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE_] code:100000 userInfo:nil];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.type == 1) {
        return self.goodArray.count;
    }
    else if (self.type == 2) {
        return self.genralArray.count;
    }
    else if (self.type == 3) {
        return self.applyArray.count;
    }
    else if (self.type == 4) {
        return self.blackArray.count;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == 1) {
        return 60;
    }
    else if (self.type == 2) {
        return 60;
    }
    else if (self.type == 3) {
        DIIResult *result = (DIIResult *)self.applyArray[indexPath.row];

         if ((result.IsAgree && result.IsProcess) || (result.IsProcess && !result.IsAgree)) {
             return 60;
         }
        else if ([result.MemberTo.Id isEqualToString:[UserManager shared].getUserModel.UserID]) { // 待处理的好友请求
            return 60;
        }
        return 84;
    }
    else if (self.type == 4) {
        return 60;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == 1) {
        DYGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYGoodCell"];
        if (!cell) {
            cell = [[DYGoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DYGoodCell"];
        }
        DLLResult *result = (DLLResult *)self.goodArray[indexPath.row];
        cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.IMUser.DisplayName];
        cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.NumberString,result.Cellphone];
        [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.IMUser.Business.IMInfo.HeadImgUrl XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
        if (indexPath.row == self.goodArray.count - 1) {
            cell.line.hidden = YES;
        }
        else {
            cell.line.hidden = NO;
        }
        return (DYGoodCell *)cell;
    }
    else if (self.type == 2) {
        DYGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYGoodCell"];
        if (!cell) {
            cell = [[DYGoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DYGoodCell"];
        }
        DLLResult *result = (DLLResult *)self.genralArray[indexPath.row];
        cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.IMUser.DisplayName];
        cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.NumberString,result.Cellphone];
        [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.IMUser.Business.IMInfo.HeadImgUrl XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
        if (indexPath.row == self.genralArray.count - 1) {
            cell.line.hidden = YES;
        }
        else {
            cell.line.hidden = NO;
        }
        return (DYGoodCell *)cell;
    }
    else if (self.type == 3) {
        DIIResult *result = (DIIResult *)self.applyArray[indexPath.row];
        if ((result.IsAgree && result.IsProcess) || (result.IsProcess && !result.IsAgree)) {
            DYAgreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYAgreeTableViewCell"];
            if (!cell) {
                cell = [[DYAgreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DYAgreeTableViewCell"];
            }
            cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.MemberFrom.DisplayName];
            cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.MemberFrom.NumberString,result.MemberFrom.Cellphone];
            [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.MemberFrom.Business.IMInfo.HeadImgUrl XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
            if ((result.IsAgree && result.IsProcess)) {
                if ([result.MemberTo.Id isEqualToString:[UserManager shared].getUserModel.UserID]) {
                    cell.agreeLabel.text = @"已同意";
                    cell.agreeLabel.backgroundColor = [UIColor lightGrayColor];
                }
                else {
                    cell.agreeLabel.text = @"对方已同意";
                    cell.agreeLabel.backgroundColor = [UIColor whiteColor];
                }
            }
            else {
                cell.agreeLabel.text = @"对方已拒绝";
                cell.agreeLabel.backgroundColor = [UIColor whiteColor];
            }
            if (indexPath.row == self.applyArray.count - 1) {
                cell.line.hidden = YES;
            }
            else {
                cell.line.hidden = NO;
            }
            // DYAgreeTableViewCell 已同意
            // 请加我为好友的Cell InApplayTableViewCell
            return (DYAgreeTableViewCell *)cell;
        }
        else if ([result.MemberTo.Id isEqualToString:[UserManager shared].getUserModel.UserID]) { // 待处理的好友请求
            OtherApplyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherApplyCell"];
            if (!cell) {
                cell = [[OtherApplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OtherApplyCell"];
            }
            cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.MemberFrom.DisplayName];
            cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.MemberFrom.NumberString,result.MemberFrom.Cellphone];
            [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.MemberFrom.Business.IMInfo.HeadImgUrl XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];

            if (indexPath.row == self.applyArray.count - 1) {
                cell.line.hidden = YES;
            }
            else {
                cell.line.hidden = NO;
            }
            cell.confirmButton.tag = indexPath.row + 1;
            cell.rejectButton.tag = indexPath.row + 1;
            [cell.confirmButton addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rejectButton addTarget:self action:@selector(rejectClick:) forControlEvents:UIControlEventTouchUpInside];
            // DYAgreeTableViewCell 已同意
            // 请加我为好友的Cell InApplayTableViewCell
            return (OtherApplyCell *)cell;
        }
        // 请求别人为好友
        InApplayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InApplayTableViewCell"];
        if (!cell) {
            cell = [[InApplayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InApplayTableViewCell"];
        }
        cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.MemberFrom.DisplayName];
        cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.MemberFrom.NumberString,result.MemberFrom.Cellphone];
        [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.MemberFrom.Business.IMInfo.HeadImgUrl XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];

        if (indexPath.row == self.applyArray.count - 1) {
            cell.line.hidden = YES;
        }
        else {
            cell.line.hidden = NO;
        }
        return (InApplayTableViewCell *)cell;
    }
    else if (self.type == 4) {
        BlackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlackTableViewCell"];
        if (!cell) {
            cell = [[BlackTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BlackTableViewCell"];
        }
        DYYResult *result = (DYYResult *)self.blackArray[indexPath.row];
        cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.BlackObj.DisplayName];
        cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.BlackObj.NumberString,result.BlackObj.Cellphone];
        [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[@"" XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
        if (indexPath.row == self.blackArray.count - 1) {
            cell.line.hidden = YES;
        }
        else {
            cell.line.hidden = NO;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.releaseButton.tag = indexPath.row + 1;
        [cell.releaseButton addTarget:self action:@selector(releaseClick:) forControlEvents:UIControlEventTouchUpInside];
        return (DYGoodCell *)cell;
    }
    return [UITableViewCell new];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.type == 1) {
        DLLResult *result = (DLLResult *)self.goodArray[indexPath.row];
        [[JSExtension shared] getConversion:result.ContactEnterprise FromId:[JSExtension shared].myIdentityId type:0 DataSuccess:^(id  _Nonnull response) {
            SKResult *respo = (SKResult *)response;
            NIMSessionType type = NIMSessionTypeP2P;
            [JSExtension shared].type = 0;
            [JSExtension shared].conversionId = respo.Id;
            [JSExtension shared].UserType = result.UserType;
            [JSExtension shared].ImUserId = result.IMUser.Id;
            if (respo.LastMsg.RowData) {
                NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
                NSDictionary *dic = [body stringToDictionary];
                if (dic[@"extra"]) {
                    NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                    [JSExtension shared].targetId = dict[@"TargetId"];
                    [JSExtension shared].targetName = dict[@"TargetName"];
                    [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
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
                chatVC.naviTitle = result.IMUser.DisplayName;
                chatVC.chatModel = chatModel;
                [self.navigationController pushViewController:chatVC animated:YES];
            }
            else {
                [self.view makeToast:@"会话ID获取失败"];
            }
        } failed:^(NSString * _Nonnull errorMsg) {
            [self.view makeToast:@"会话ID获取失败"];
        }];
    }
    else if(self.type == 2) {
        DLLResult *result = (DLLResult *)self.genralArray[indexPath.row];
        [[JSExtension shared] getConversion:result.ContactEnterprise FromId:[JSExtension shared].myIdentityId type:0 DataSuccess:^(id  _Nonnull response) {
            SKResult *respo = (SKResult *)response;
            NIMSessionType type = NIMSessionTypeP2P;
            [JSExtension shared].type = 0;
            [JSExtension shared].conversionId = respo.Id;
            [JSExtension shared].UserType = result.UserType;
            [JSExtension shared].ImUserId = result.IMUser.Id;

            if (respo.LastMsg.RowData) {
                NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
                NSDictionary *dic = [body stringToDictionary];
                if (dic[@"extra"]) {
                    NSDictionary *dict = [dic[@"extra"] stringToDictionary];
                    [JSExtension shared].targetId = dict[@"TargetId"];
                    [JSExtension shared].targetName = dict[@"TargetName"];
                    [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
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
                chatVC.naviTitle = result.IMUser.DisplayName;
                chatVC.chatModel = chatModel;
                [self.navigationController pushViewController:chatVC animated:YES];
            }
            else {
                [self.view makeToast:@"会话ID获取失败"];
            }
        } failed:^(NSString * _Nonnull errorMsg) {
            [self.view makeToast:@"会话ID获取失败"];
        }];

    }
    else if(self.type == 3) {
        DIIResult *result = (DIIResult *)self.applyArray[indexPath.row];
        DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
        page.userIconImageURL = [result.MemberFrom.Business.IMInfo.HeadImgUrl XYImageURL];
//                page.groupNumber = self.chatModel.targetId;
//                page.isAdmin = [self isAdmin:model];
        [self.navigationController pushViewController:page animated:YES];
    }
    else if(self.type == 4) {

    }
}

#pragma mark - Action
-(void)confirmClick:(UIButton *)sender {
    DIIResult *result = (DIIResult *)self.applyArray[sender.tag - 1];
    [self agreeApplyModel:result submit:YES];
}
-(void)rejectClick:(UIButton *)sender {
    DIIResult *result = (DIIResult *)self.applyArray[sender.tag - 1];
    [self agreeApplyModel:result submit:NO];
}
-(void)releaseClick:(UIButton *)sender {
    DYYResult *result = (DYYResult *)self.blackArray[sender.tag - 1];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setObject:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:[JSExtension shared].myClientId forKey:@"ClientId"];
    [requestDic setObject:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"CertificateId"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:result.BlackUserId forKey:@"BlackUserId"];
    [data setObject:result.UserId forKey:@"UserId"];
    [data setObject:result.Id forKey:@"Id"];
    [data setObject:result.BelongEnterprise forKey:@"BelongEnterprise"];
    [data setObject:result.BelongBlackUserEnterprise forKey:@"BelongBlackUserEnterprise"];
    [data setObject:result.BlackObj.mj_keyValues forKey:@"BlackObj"];
    [requestDic setObject:data forKey:@"Data"];

    [XYNetWorking XYPOST:@"RemoveBlacklist" params:requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                [XYProgressHUD svHUDDismiss];
                [self.tableView.mj_header beginRefreshing];

            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
            }

        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}
-(void)searchClick {
    self.searchText = self.headView.textField.text;
    [self.tableView.mj_header beginRefreshing];
}
-(void)buttonClick:(UIButton *)sender {
    [self.headView.goodContractButton setSelected:NO];
    [self.headView.nestContractButton setSelected:NO];
    [self.headView.generaContractButton setSelected:NO];
    [self.headView.hitContractButton setSelected:NO];
    [sender setSelected:YES];
    switch (sender.tag) {
        case 1:
            NSLog(@"好友联系人");
            self.type = 1;
            if (self.goodArray.count == 0) {
                [self reloadData];
            }
            else {
                [self.tableView reloadData];
            }
            break;
        case 2:
            NSLog(@"普通联系人");
            self.type = 2;
            if (self.genralArray.count == 0) {
                [self reloadData];
            }
            else {
                [self.tableView reloadData];
            }
            break;
        case 3:
            NSLog(@"新的联系人");
            self.type = 3;
            if (self.applyArray.count == 0) {
                [self reloadData];
            }
            else {
                [self.tableView reloadData];
            }
            break;
        case 4:
            NSLog(@"黑名单");
            self.type = 4;
            if (self.blackArray.count == 0) {
                [self reloadData];
            }
            else {
                [self.tableView reloadData];
            }
            break;
        case 5:
            NSLog(@"新增");
            [self pushNewContract];
            break;
        default:
            break;
    }
}

-(void)pushNewContract {
    DNewContractViewController *target = [[DNewContractViewController alloc] init];
    [self.navigationController pushViewController:target animated:YES];
}

#pragma mark - UI
-(ContractHeadView *)headView {
    if (!_headView) {
        _headView = [[ContractHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 110)];
        _headView.goodContractButton.selected = YES;
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.goodContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.generaContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.nestContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.hitContractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
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

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, kScreenWidth, kScreenHeight - 128 - 110) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delaysContentTouches = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSMutableArray *)goodArray {
    if (!_goodArray) {
        _goodArray = [[NSMutableArray alloc] init];
     }
    return _goodArray;
}
-(NSMutableArray<DLLResult *> *)genralArray {
    if (!_genralArray) {
        _genralArray = [[NSMutableArray alloc] init];
    }
    return _genralArray;
}
-(NSMutableArray<DIIResult *> *)applyArray {
    if (!_applyArray) {
        _applyArray = [[NSMutableArray alloc] init];
    }
    return _applyArray;
}
-(NSMutableArray<DYYResult *> *)blackArray {
    if (!_blackArray) {
        _blackArray = [[NSMutableArray alloc] init];
    }
    return _blackArray;
}

@end
