//
//  DYJXAddMemberPage.m
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXAddMemberPage.h"
#import "DYJXAddMemberTopView.h"
#import "DYJXAddMemberViewModel.h"
#import "DYJXAddMemberCollectionViewCell.h"

@interface DYJXAddMemberPage ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DYJXAddMemberTopView *addMemberTopView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)DYJXAddMemberViewModel *viewModel;
@end

@implementation DYJXAddMemberPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
    self.title = @"添加成员";
    
    [self initCollectionView];
    
//    [self.viewModel.requestDic setObject:self.IdentityModel.Id forKey:@"CertificateId"];
//    [self.viewModel getMyAppsSuccess:^{
//        [weakSelf.collectionView reloadData];
//    } failed:^(NSString *errorMsg) {
//
//    }];
    
    [self initSubViews];
}

- (void)initSubViews{
    [self.view addSubview:self.addMemberTopView];
    [self.addMemberTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
//        make.height.mas_equalTo(80);
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.addMemberTopView.mas_bottom).mas_equalTo(20);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
        
    }];
}

- (void)initCollectionView{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DYJXAddMemberCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DYJXAddMemberCollectionViewCell"];
}


#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
//    return [self.viewModel numberOfSection];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
//    return [self.viewModel numberOfCellectionItem];
    return 13;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXAddMemberCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"DYJXAddMemberCollectionViewCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = (self.view.frame.size.width - 30 - 15*4)/5/2;
    cell.layer.masksToBounds = YES;
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width - 30 - 15*4)/5 , (self.view.frame.size.width - 30 - 15*4)/5 );
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

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        layout.headerReferenceSize = CGSizeZero;
        layout.footerReferenceSize = CGSizeZero;
        
        layout.itemSize = CGSizeMake(80 , 80);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

- (DYJXAddMemberTopView *)addMemberTopView{
    if (!_addMemberTopView) {
       _addMemberTopView = [[NSBundle mainBundle] loadNibNamed:@"DYJXAddMemberTopView" owner:self options:nil].firstObject;
    }
    return _addMemberTopView;
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
