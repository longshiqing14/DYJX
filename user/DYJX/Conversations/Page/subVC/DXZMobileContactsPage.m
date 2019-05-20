//
//  DXZMobileContactsPage.m
//  user
//
//  Created by longshiqing on 2019/4/27.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "DXZMobileContactsPage.h"

#import "JSExtension.h"
#import "MutableSelectCell.h"
#import "HeadSearchView.h"
#import "NIMKitTitleView.h"
#import "DYSelecteContractsPage.h"
#import "CQColorfulAlertView.h"
#import "IMSDK.h"
#import "DLHeadScanView.h"
#import "DYJXQRCodePage.h"
#import "SWQRCodeViewController.h"
#import "DYXJSearchUserModel.h"
#import "DYGoodCell.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import "DSSMobileView.h"
#import "MobileView.h"

@interface DXZMobileContactsPage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)DLHeadScanView *scanView;
@property (nonatomic, strong)NSMutableArray <DYXJResult *> *userLists;
@property (nonatomic, assign)NSInteger pageIndex;
@property (nonatomic, strong)DSSMobileView *mobileView;
//@property (nonatomic, strong)MobileView *mobileView;

@end

@implementation DXZMobileContactsPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.mobileView];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.tableView];

    [self baseUI];
    [self setUpTitleView];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        [self reloadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    // 已读
}

-(void)loadMore {
    self.pageIndex += 1;
    [self reloadData];
}

-(void)reloadData {
    [self.view resignFirstResponder];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setObject:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:[JSExtension shared].myClientId forKey:@"ClientId"];
    [requestDic setObject:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setObject:[JSExtension shared].myIdentityId forKey:@"CertificateId"];
    [requestDic setObject:@20 forKey:@"PageSize"];
    [requestDic setObject:@1 forKey:@"PageIndex"];
    if (self.headView.textField.text.length) {
//        if (self.pageIndex == 1) {
//            [self.tableView.mj_header beginRefreshing];
//        }
//        else {
//            [self.tableView.mj_footer beginRefreshing];
//        }

        if (self.userLists.count >= 20) {
            MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
            self.tableView.mj_footer = footer;
        }
        else {
            self.tableView.mj_footer = nil;
        }
        [requestDic setObject:self.headView.textField.text forKey:@"Keyword"];
        [XYNetWorking XYPOST:@"UploadPhonebook" params:requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
            if (self.pageIndex == 1) {
                [self.tableView.mj_header endRefreshing];
            }
            else {
                [self.tableView.mj_footer endRefreshing];
            }
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                if ([[responseObject objectForKey:@"Succeed"] boolValue] ) {
                    if (self.pageIndex == 1) {
                        [self.userLists removeAllObjects];
                    }
                    [self.userLists addObjectsFromArray:[NSArray modelArrayWithClass:[DYXJResult class] json:[responseObject objectForKey:@"Result"]]];
                    [self.tableView reloadData];
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];
                }

            }else{
                [YDBAlertView showToast:@"没有要上传的通讯记录！" dismissDelay:1.0];
            }

        } fail:^(NSURLSessionDataTask *task, NSError *error) {
            if (self.pageIndex == 1) {
                [self.tableView.mj_header endRefreshing];
            }
            else {
                [self.tableView.mj_footer endRefreshing];
            }
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }];
    }else{
                if (self.pageIndex == 1) {
                    [self.tableView.mj_header endRefreshing];
                }
                else {
                    [self.tableView.mj_footer endRefreshing];
                }
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }
}

- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;

        titleView.titleLabel.text = @"添加手机联系人";
    }

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBarButtonItem)];

    [titleView sizeToFit];
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userLists.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    MutableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MutableSelectCell"];
    //    if (!cell) {
    //        cell = [[MutableSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MutableSelectCell"];
    //    }

    DYGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DYGoodCell"];
    if (!cell) {
        cell = [[DYGoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DYGoodCell"];
    }
    DYXJResult *result = (DYXJResult *)self.userLists[indexPath.row];
    cell.sellingPointLable.text = [NSString stringWithFormat:@"%@",result.DisplayName];
    cell.goodsNameLabel.text = [NSString stringWithFormat:@"ID:%@ TEL:%@", result.NumberString,result.DisplayTel];
    [cell.goodsImageView setImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
    //    [cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[result.Business.IMInfo.N XYImageURL]] placeholderImage:[UIImage imageNamed:@"dyjx_default_im_por"]];
    if (indexPath.row == self.userLists.count - 1) {
        cell.line.hidden = YES;
    }
    else {
        cell.line.hidden = NO;
    }
    return (DYGoodCell *)cell;
    //    return (RCConversationBaseCell *)cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DYXJResult *result = (DYXJResult *)self.userLists[indexPath.row];
    DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
    page.title = @"信息查看";
    page.groupNumber = result.NumberString;
    page.targetId = result.Id;
    [self.navigationController pushViewController:page animated:YES];
    //    [[JSExtension shared] getConversion:result.Id FromId:[UserManager shared].getUserModel.UserID type:result.Type DataSuccess:^(id  _Nonnull response) {
    //        SKResult *respo = (SKResult *)response;
    //        NIMSessionType type = NIMSessionTypeP2P;
    //        [JSExtension shared].type = 0;
    //        if (respo.LastMsg.RowData) {
    //            NSString *body = [NSString stringWithFormat:@"%@",respo.LastMsg.RowData];
    //            NSDictionary *dic = [body stringToDictionary];
    //            if (dic[@"extra"]) {
    //                NSDictionary *dict = [dic[@"extra"] stringToDictionary];
    //                [JSExtension shared].targetId = dict[@"TargetId"];
    //                [JSExtension shared].targetName = dict[@"TargetName"];
    //                [JSExtension shared].targetImg = dict[@"TargetHeadImg"];
    //                [JSExtension shared].conversionId = respo.LastMsg.ConversationId;
    //            }
    //        }
    //
    //        if([JSExtension shared].conversionId.length) {
    //            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
    //
    //            NIMSession *session = [NIMSession session:respo.LastMsg.ConversationId type:type];
    //            [JSExtension shared].session = session;
    //            JXChatViewController *chatVC = [[JXChatViewController alloc] initWithSession:session];
    //            RCConversationModel *chatModel = [[RCConversationModel alloc] init];
    //            chatModel.targetId = [JSExtension shared].conversionId;
    //            [JSExtension shared].chatVC = chatVC;
    //            chatVC.naviTitle = result.DisplayName;
    //            chatVC.chatModel = chatModel;
    //            [self.navigationController pushViewController:chatVC animated:YES];
    //        }
    //        else {
    //            [self.view makeToast:@"会话ID获取失败"];
    //        }
    //    } failed:^(NSString * _Nonnull errorMsg) {
    //        [self.view makeToast:@"会话ID获取失败"];
    //    }];
}

#pragma mark - Action
-(void)clickRightBarButtonItem {
    NSLog(@"提交");
}
-(void)buttonClick:(UIButton *)sender {
    if (sender.tag == 1) {
        NSLog(@"添加手机联系人");
    }
    else if(sender.tag == 2) {
        NSLog(@"扫一扫");
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;

        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        qrcodeVC.callBack = ^(id anyobject){
            if (anyobject) {
                DYXJResult *result = (DYXJResult *)anyobject;
                [self.userLists removeAllObjects];
                [self.userLists addObject:result];
                [self.tableView reloadData];
            }

        };
        [self.navigationController pushViewController:qrcodeVC animated:YES];
    }
    else if(sender.tag == 3) {
        NSLog(@"二维码");
        DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
        qrCodePage.userIdOrCompanyId = [UserManager shared].getUserModel.UserID;
        qrCodePage.companyNumber = [UserManager shared].getUserModel.Result.NumberString;
        qrCodePage.companyName = [UserManager shared].getUserModel.Result.UserName;
        [self.navigationController pushViewController:qrCodePage animated:YES];
    }
}

-(void)black_controller {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchClick:(UIButton *)sender {
    [self.view endEditing:YES];
    [self reloadData];
}

#pragma mark - UI
-(NSMutableArray<DYXJResult *> *)userLists {
    if (!_userLists) {
        _userLists = [[NSMutableArray alloc] init];
    }
    return _userLists;
}
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, kScreenWidth, kScreenHeight - 64 - 140) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delaysContentTouches = NO;
    }
    return _tableView;
}

-(DLHeadScanView *)scanView {
    if (!_scanView) {
        _scanView = [[DLHeadScanView alloc] initWithFrame:CGRectMake(0, 60, kScreenWidth, 90)];
        [_scanView.contractButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scanView.scanButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scanView.qrCodeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanView;
}
//-(MobileView *)mobileView {
//    if (!_mobileView) {
//        _mobileView = [[NSBundle mainBundle] loadNibNamed:@"MobileView" owner:self options:nil][0];;
//    }
//    return _mobileView;
//}
-(DSSMobileView *)mobileView {
    if (!_mobileView) {
        _mobileView = [[DSSMobileView alloc] initWithFrame:CGRectMake(0, 60, kScreenWidth, 80)];
        _mobileView.block = ^(NSInteger index) {
            switch (index) {
                case MobileTypeAll:
                    _pageType = PageMobileTypeAll;
                    break;
                case MobileTypeClear:
                    _pageType = PageMobileTypeClear;
                    break;
                case MobileTypeFriend:
                    _pageType = PageMobileTypeFriend;
                    break;
                case MobileTypeNormal:
                    _pageType = PageMobileTypeNormal;
                    break;
                case MobileTypeBlack:
                    _pageType = PageMobileTypeBlack;
                    break;
                case MobileTypeDelete:
                    _pageType = PageMobileTypeDelete;
                    break;
                default:
                    break;
            }
        };
    }
    return _mobileView;
}


@end
