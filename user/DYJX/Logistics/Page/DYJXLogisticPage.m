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

@interface DYJXLogisticPage ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) DYJXLogisticViewModel *viewModel;
@end

@implementation DYJXLogisticPage

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [self initNavigation];
    [self initCollectionView];

    [self.viewModel.requestDic setObject:self.IdentityModel.GroupNumber forKey:@"CertificateId"];
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
            //168物流平台
        }else if (indexPath.row == 1){
            //百度
        }
    }else if (indexPath.section == 1){
        if ([self.viewModel itemName:indexPath]) {
            
        }
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    GJHomeMenuListModel *model=_homepageModel.menuList[indexPath.row];
//    if ([model.typeId isEqualToString:@"JYGL"]) {
//        //        经营管理
//        XYOperationManagementVC * operationManagementVC = [[XYOperationManagementVC alloc]init];
//        [self.navigationController pushViewController:operationManagementVC animated:YES];
//    }else if ([model.typeId isEqualToString:@"HDGL"]){
//        //        活动管理
//        XYActivityWebVC * activityWebVC = [[XYActivityWebVC alloc]init];
//        [self.navigationController pushViewController:activityWebVC animated:YES];
//    }else if ([model.typeId isEqualToString:@"YGGL"]){
//        //        员工管理
//        XYEmployeeManagementWebVC * employeeManagementWebVC = [[XYEmployeeManagementWebVC alloc]init];
//        [self.navigationController pushViewController:employeeManagementWebVC animated:YES];
//    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //168物流平台
        }else if (indexPath.row == 1){
            //百度
            DYJXBaiDuWebPage * baiDuWebPage = [[DYJXBaiDuWebPage alloc]init];
            baiDuWebPage.webURLstr = @"https://m.baidu.com/usrprofile?action=square";
            [self.navigationController pushViewController:baiDuWebPage animated:YES];
        }
    }else if (indexPath.section == 1){
        if ([self.viewModel itemName:indexPath]) {
            
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
//    self.navigationController.navigationBar.titleTextAttributes=
//    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
//      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];

    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(goBackPage) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
//    [rightBarButton setImageWithURL:[NSURL URLWithString:[self.IdentityModel.GroupHeadImg XYImageURL]] forState:(UIControlStateNormal) placeholder:[UIImage imageNamed:@"btn_group"]];
    [rightBarButton setImage:[UIImage imageNamed:@"btn_group"] forState:(UIControlStateNormal)];
    
    
//    [rightBarButton setTitle:@"提交" forState:UIControlStateNormal];
//    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
//    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
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

- (void)goBackPage{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)walletBTN:(UIButton *)sender {
    [YDBAlertView showToast:@"开发中，敬请期待！"];
}

- (IBAction)conversationBTN:(UIButton *)sender {
//    [self.navigationController pushViewController:[[DYJXConversationTabBarController alloc] init] animated:YES];
    XYKeyWindow.rootViewController = [[DYJXConversationTabBarController alloc] init];
    
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
