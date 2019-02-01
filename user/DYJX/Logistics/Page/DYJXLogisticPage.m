//
//  DYJXLogisticPage.m
//  user
//
//  Created by 岩  熊 on 2018/11/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLogisticPage.h"
#import "DYJXIdentitySwitchingModel.h"
#import "DYJXLogisticCollectionViewCell.h"
#import "DYJXLogisticViewModel.h"
#import "DYJXBaiDuWebPage.h"
#import "DYJXConversationTabBarController.h"
#import "WebAppController.h"
#import "WebViewController.h"
#import "PDRToolSystem.h"
#import "PDRToolSystemEx.h"
#import "PDRCoreAppFrame.h"
#import "PDRCoreAppManager.h"
#import "PDRCoreAppWindow.h"
#import "PDRCoreAppInfo.h"
#import "PDRCore.h"
#import "NIMKitTitleView.h"
#import "DJCompanyChatPage.h"
#import "JSExtension.h"
#import "DJCompanyChatViewModel.h"
#import "JXRefoundReasonPopView.h"
#import "DYJXComparePage.h"
#import "DJCompanyChatPage.h"
#import "iPhoneXBottomBackgroundView.h"

@interface DYJXLogisticPage ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) DYJXLogisticViewModel *viewModel;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property(nonatomic, strong)iPhoneXBottomBackgroundView *bottomBackgroundView;
@property(nonatomic, strong) DJCompanyChatViewModel *companyViewModel;
@end

@implementation DYJXLogisticPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [self initNavigation];
    [self initSubViews];
    [self initCollectionView];
//    [self setUpTitleView];

    [self.viewModel.requestDic setObject:self.IdentityModel.Id forKey:@"CertificateId"];
    [self.viewModel getMyAppsSuccess:^{
        [weakSelf.collectionView reloadData];
    } failed:^(NSString *errorMsg) {
        
    }];
}

-(void)viewWillAppear:(BOOL)animated {
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
}

- (void)initSubViews{
    [self.view addSubview:self.bottomBackgroundView];
    [self.view sendSubviewToBack:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(34);
    }];
}

- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    layout.headerReferenceSize = CGSizeZero;
    layout.footerReferenceSize = CGSizeZero;
    
    layout.itemSize = CGSizeMake(80 , 80);
    [self.collectionView setCollectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor colorWithRed:79/225. green:134/225. blue:209/225. alpha:1];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DYJXLogisticCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DYJXLogisticCollectionViewCell"];
     [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}


#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return [self.viewModel numberOfSection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return [self.viewModel numberOfCellectionItem];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXLogisticCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"DYJXLogisticCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //比价
            cell.content1.text = @"比价";
        }else if (indexPath.row == 1){
            //商号市场
            cell.content1.text = @"商号\n市场";
        }else if (indexPath.row == 2){
            //16888物流平台
            cell.content1.text = @"16888\n 物流\n 平台";
        }else if (indexPath.row == 3){
            //百度
            cell.content1.text = @"百度\nMore";
        }
    
    }else if (indexPath.section == 1){
        if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt"]) {
            //新泰通物流员工端
            cell.content1.text = @"新泰通\n 物流\n员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_back"]){
            //广州退货员工端
            cell.content1.text = @"广州\n 退货\n员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_ea"]){
            //新泰通报销员工端
            cell.content1.text = @"新泰通\n 报销\n员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_qcd"]){
            //全城达
            cell.content1.text = @"全城达\n 同城\n员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"ea"]){
            //报销登记审核
            cell.content1.text = @"报销\n登记\n审核";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"numberMarket"]){
            //公司和我的商号
            cell.content1.text = @"公司\n 和\n我的商号";
        }
        cell.content1.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    
    if (indexPath.section == 0) {
        cell.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFE0"];
    }else {
        cell.contentView.backgroundColor = [UIColor colorWithRed:221/255.0 green:238/255.0 blue:205/255.0 alpha:1];
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            DYJXComparePage *target = [[DYJXComparePage alloc] init];
            [self.navigationController pushViewController:target animated:YES];
            return;
            [YDBAlertView showToast:@"功能开发中，敬请期待！"];
        }else if (indexPath.row == 1){
            [JSExtension shared].action = @"numberMarket";
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            self.navigationController.navigationBarHidden = YES;
            pWebAppController.AppId = @"com.zlMax.xttNumber";
            [self.navigationController pushViewController:pWebAppController animated:YES];
        }else if (indexPath.row == 2){
            //16888物流平台
            // Webivew集成不能同时WebApp集成，需要修改AppDelegate文件的PDRCore的启动参数
            
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            pWebAppController.AppId = @"com.zlMax.xttlc";
            if (pWebAppController) {
                self.navigationController.navigationBarHidden = YES;
                [self.navigationController pushViewController:pWebAppController animated:YES];
            }
        }else if (indexPath.row == 3){
            //百度
            DYJXBaiDuWebPage * baiDuWebPage = [[DYJXBaiDuWebPage alloc]init];
            //            self.navigationController.navigationBarHidden = YES;
            baiDuWebPage.webURLstr = @"https://m.baidu.com/usrprofile?action=square";
            [self.navigationController pushViewController:baiDuWebPage animated:YES];
        }
    }else if (indexPath.section == 1){
        if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_ea"]) {
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            pWebAppController.AppId = @"com.zlMax.xttEA";
            self.navigationController.navigationBarHidden = YES;
                [self.navigationController pushViewController:pWebAppController animated:YES];
            
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_back"]){
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            pWebAppController.AppId = @"com.zlMax.lw16888Logistics";
            self.navigationController.navigationBarHidden = YES;
                [self.navigationController pushViewController:pWebAppController animated:YES];
            
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt"]){
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            pWebAppController.AppId = @"com.zlMax.xttLogistics";
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:pWebAppController animated:YES];
            
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_qcd"]){
            WebAppController  *pWebAppController = [[WebAppController alloc] init];
            self.navigationController.navigationBarHidden = YES;
            pWebAppController.AppId = @"com.zlMax.xttLogisticsQcd";
            [self.navigationController pushViewController:pWebAppController animated:YES];
            
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"ea"]){

            [self.companyViewModel getMyGroupsDataSuccess:^{
                JXRefoundReasonPopView *ReasonPopView = [[NSBundle mainBundle] loadNibNamed:@"JXRefoundReasonPopView" owner:self options:nil][0];
                ReasonPopView.selectReasonBlock = ^(NSString *enterpriseId) {
                    [JSExtension shared].enterpriseId = enterpriseId;
                    if ([self.companyViewModel getRefundReasonsArray].count == 0) {
                        return ;
                    }else{
                        WebAppController  *pWebAppController = [[WebAppController alloc] init];
                        self.navigationController.navigationBarHidden = YES;
                        pWebAppController.AppId = @"com.zlMax.EA";
                        [self.navigationController pushViewController:pWebAppController animated:YES];
                        
                    }
                    
                };
                ReasonPopView.dataArray = [self.companyViewModel getRefundReasonsArray];
                [ReasonPopView registCell];
                [ReasonPopView.reasonTab reloadData];
                [YWDPopupControl popupView:ReasonPopView];
            } failed:^(NSString *errorMsg) {
                
            }];
            
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"numberMarket"]){

            DJCompanyChatPage *companyChatPage = [[DJCompanyChatPage alloc]init];
                [self.navigationController pushViewController:companyChatPage animated:YES];
        }
    }
}
#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width - 30 - 15*5)/4 , (self.view.frame.size.width - 30 - 15*5)/4 );
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
   return 15;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return CGSizeMake(kScreenWidth, 2.5);
    }
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 0);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        return [self collectionView:collectionView viewForHeadViewOfKind:kind atIndexPath:indexPath];
    }
    //    else
    //    return [UICollectionReusableView new];
    return nil;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForHeadViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];

        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 2.5)];
        subView.backgroundColor = [UIColor whiteColor];

        [view addSubview:subView];
        return view;
    }
    return [UICollectionReusableView new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;

        titleView.titleLabel.text = @"公司简讯";
    }

    [titleView sizeToFit];
}

- (void)initNavigation{
    self.title = @"公司简讯";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [iconImage setContentMode:UIViewContentModeScaleAspectFill];
    
    if ([UserManager shared].isCompany == 1) {
        iconImage.layer.cornerRadius = 12.5;
    }
    
    iconImage.clipsToBounds = YES;
    [iconImage setImageWithURL:[NSURL URLWithString:[self.IdentityModel.GroupHeadImg XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 25;
    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (DYJXIdentitySwitchingModel *)IdentityModel{
    if (!_IdentityModel) {
        _IdentityModel = [[DYJXIdentitySwitchingModel alloc]init];
    }
    return _IdentityModel;
}

- (DYJXLogisticViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXLogisticViewModel alloc]init];
    }
    return _viewModel;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackPage:)];
    }
    return _tapGestureRecognizer;
}

- (iPhoneXBottomBackgroundView *)bottomBackgroundView{
    if (!_bottomBackgroundView) {
        _bottomBackgroundView = [[NSBundle mainBundle]loadNibNamed:@"iPhoneXBottomBackgroundView" owner:self options:nil].firstObject;

    }
    return _bottomBackgroundView;
}

- (void)goBackPage:(UITapGestureRecognizer*)tapGestureRecognizer{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)walletBTN:(UIButton *)sender {
    //             wallet ,  numberMarket  ,  myNumber;
    [JSExtension shared].action = @"wallet";
    WebAppController  *pWebAppController = [[WebAppController alloc] init];
    self.navigationController.navigationBarHidden = YES;
    pWebAppController.AppId = @"com.zlMax.xttNumber";
    [self.navigationController pushViewController:pWebAppController animated:YES];
}

- (IBAction)conversationBTN:(UIButton *)sender {
//    [self.navigationController pushViewController:[[DYJXConversationTabBarController alloc] init] animated:YES];
    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[self.IdentityModel.GroupHeadImg XYImageURL]];
    [XYUserDefaults writeAppDlegateOfCurrentUserIconURL:[self.IdentityModel.GroupHeadImg XYImageURL]];
    [XYKeyWindow.rootViewController presentViewController:conversationTabBarController animated:YES completion:nil];
    
}

- (DJCompanyChatViewModel *)companyViewModel{
    if (!_companyViewModel) {
        _companyViewModel = [[DJCompanyChatViewModel alloc]init];
    }
    return _companyViewModel;
}

- (void)dealloc{
    
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
