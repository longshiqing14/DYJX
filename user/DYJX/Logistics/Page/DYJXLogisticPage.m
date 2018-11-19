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

@interface DYJXLogisticPage ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) DYJXLogisticViewModel *viewModel;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation DYJXLogisticPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [self initNavigation];
    [self initCollectionView];

    [self.viewModel.requestDic setObject:self.IdentityModel.Id forKey:@"CertificateId"];
    [self.viewModel getMyAppsSuccess:^{
        [weakSelf.collectionView reloadData];
    } failed:^(NSString *errorMsg) {
        
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
    self.collectionView.backgroundColor = [UIColor colorWithRed:106/225. green:171/225. blue:206/225. alpha:1];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DYJXLogisticCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DYJXLogisticCollectionViewCell"];
     [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}


#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return [self.viewModel numberOfSection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return [self.viewModel numberOfCellectionItem];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXLogisticCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"DYJXLogisticCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //16888物流平台
            cell.content1.text = @"16888";
            cell.content2.text = @"物流";
            cell.content3.text = @"平台";
            
        }else if (indexPath.row == 1){
            //百度
            cell.content1.text = @"百度";
            cell.content2.text = @"";
            cell.content3.text = @"More";
        }
    
    }else if (indexPath.section == 1){
        if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_ea"]) {
            //新泰通物流员工端
            cell.content1.text = @"新泰通";
            cell.content2.text = @"物流";
            cell.content3.text = @"员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_back"]){
            //广州退货员工端
            cell.content1.text = @"广州";
            cell.content2.text = @"退货";
            cell.content3.text = @"员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt"]){
            //新泰通报销员工端
            cell.content1.text = @"新泰通";
            cell.content2.text = @"报销";
            cell.content3.text = @"员工端";
        }else if ([[self.viewModel itemName:indexPath] isEqualToString:@"xtt_qcd"]){
            //全城达
            cell.content1.text = @"全城达";
            cell.content2.text = @"同城";
            cell.content3.text = @"员工端";
        }
    
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //16888物流平台
            // Webivew集成不能同时WebApp集成，需要修改AppDelegate文件的PDRCore的启动参数

          WebAppController  *pWebAppController = [[WebAppController alloc] init];
            pWebAppController.AppId = @"com.zlMax.lw16888Logistics";
            if (pWebAppController) {
                self.navigationController.navigationBarHidden = YES;
                [self.navigationController pushViewController:pWebAppController animated:YES];
            }            
        }else if (indexPath.row == 1){
            //百度
            DYJXBaiDuWebPage * baiDuWebPage = [[DYJXBaiDuWebPage alloc]init];
            self.navigationController.navigationBarHidden = YES;
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
            pWebAppController.AppId = @"com.zlMax.xttlc";
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
            
        }
    }
}
#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width - 15*5)/4 , (self.view.frame.size.width - 15*5)/4 );
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
        return CGSizeMake(kScreenWidth, 5);
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
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return [UICollectionReusableView new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigation{
    self.title = @"达意简讯";

    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [iconImage setContentMode:UIViewContentModeScaleAspectFill];
    iconImage.clipsToBounds = YES;
    [iconImage setImageWithURL:[NSURL URLWithString:[self.IdentityModel.GroupHeadImg XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 30;
    
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

- (void)goBackPage:(UITapGestureRecognizer*)tapGestureRecognizer{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)walletBTN:(UIButton *)sender {
    [YDBAlertView showToast:@"开发中，敬请期待！"];
}

- (IBAction)conversationBTN:(UIButton *)sender {
//    [self.navigationController pushViewController:[[DYJXConversationTabBarController alloc] init] animated:YES];
    DYJXConversationTabBarController *conversationTabBarController = [[DYJXConversationTabBarController alloc] initWithIconUrl:[self.IdentityModel.GroupHeadImg XYImageURL]];
    XYKeyWindow.rootViewController = conversationTabBarController;
    
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
