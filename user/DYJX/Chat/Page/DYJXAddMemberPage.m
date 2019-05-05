//
//  DYJXAddMemberPage.m
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXAddMemberPage.h"
#import "DYJXAddMemberTopView.h"

#import "DYJXAddMemberCollectionViewCell.h"
#import "DYJXSelectMemberPage.h"
#import "XYDYJXResult.h"
#import "DYJXDeleteMemberPage.h"
#import "DYJXAccessAdminPage.h"
#import "DYJXFireAdminPage.h"

@interface DYJXAddMemberPage ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DYJXAddMemberTopView *addMemberTopView;
@property (nonatomic, strong)UICollectionView *collectionView;
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
    return self.membersArray.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXAddMemberCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"DYJXAddMemberCollectionViewCell" forIndexPath:indexPath];
    cell.iconImage.layer.cornerRadius = (self.view.frame.size.width - 30 - 15*4)/5/2;
    cell.iconImage.layer.masksToBounds = YES;
    [cell.iconImage setImageWithURL:[NSURL URLWithString:[self.membersArray[indexPath.row].Business.IMInfo.HeadImgUrl XYImageURL]] placeholder:[UIImage imageNamed:@"dyjx_default_im_por"]];
    cell.nickName.text = self.membersArray[indexPath.row].DisplayName;
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width - 30 - 15*4)/5 , (self.view.frame.size.width - 30 - 15*4)/5 + 15 );
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
    WeakSelf;
    if (!_addMemberTopView) {
       _addMemberTopView = [[NSBundle mainBundle] loadNibNamed:@"DYJXAddMemberTopView" owner:self options:nil].firstObject;
        _addMemberTopView.block = ^(OperatorMember OperatorType) {
            
            if (OperatorType == OperatorMemberAdd) {
                
                DYJXSelectMemberPage *selectMemberPage = [[DYJXSelectMemberPage alloc]init];
                selectMemberPage.operatorType = OperatorType;
                selectMemberPage.block = ^(NSMutableArray<XYDYJXResult *> *membersArray) {
                    for (XYDYJXResult *obj in membersArray) {
                        DJJXMembers *member = [[DJJXMembers alloc]init];
                        member.Business = (DJJXBusines*)obj.IMUser.Business;
                        member.DisplayName = obj.IMUser.DisplayName;
                        [weakSelf.membersArray addObject:member];
                    }
                    [weakSelf.collectionView reloadData];
                };
                [weakSelf.navigationController pushViewController:selectMemberPage animated:YES];
                
            }else if (OperatorType == OperatorMemberDelete){
                DYJXDeleteMemberPage *deleteMemberPage = [[DYJXDeleteMemberPage alloc]init];
                deleteMemberPage.operatorType = OperatorType;
                
                DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
                __block NSMutableArray<DJJXMembers*> *deleteMembersArray = [NSMutableArray array];
                [weakSelf.membersArray enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (![obj.Id isEqualToString:userModel.UserID]) {
                       [deleteMembersArray addObject:obj];
                    }
                }];
                deleteMemberPage.deleteMembersArray = deleteMembersArray;
                
                [weakSelf.navigationController pushViewController:deleteMemberPage animated:YES];
                
                deleteMemberPage.block = ^(NSMutableArray<DJJXMembers *> *membersArray) {
                    for (DJJXMembers *obj in membersArray) {
                        for (DJJXMembers *memberObj in weakSelf.membersArray) {
                            if ([memberObj.NumberString isEqualToString:obj.NumberString]) {
                                [weakSelf.membersArray removeObject:memberObj];
                            }
                        }
                    }
                    [weakSelf.collectionView reloadData];
                };
                
            }else if (OperatorType == OperatorMemberAccessAdmin){
                
                DYJXAccessAdminPage *accessAdminPage = [[DYJXAccessAdminPage alloc]init];
                accessAdminPage.operatorType = OperatorType;
                
                __block NSMutableArray<DJJXMembers*> *accessAdminArray = [weakSelf.membersArray mutableCopy];
                
                for (int i=0; i<weakSelf.adminArray.count; i++) {
                    for (int j=0; j<weakSelf.membersArray.count; j++) {
                        if ([weakSelf.membersArray[j].NumberString isEqualToString:weakSelf.adminArray[i].NumberString]) {
                            [accessAdminArray removeObject:weakSelf.membersArray[j]];
                        }
                    }
                }
                
                accessAdminPage.accessAdminArray = accessAdminArray;
                
                [weakSelf.navigationController pushViewController:accessAdminPage animated:YES];
                
                accessAdminPage.block = ^(NSMutableArray<DJJXMembers *> *membersArray) {
                    __block NSMutableArray<DJJXMembers*> *tempMembersArray = [weakSelf.membersArray mutableCopy];
                    
                    for (DJJXMembers *obj in membersArray) {
                        for (DJJXMembers *memberObj in weakSelf.membersArray) {
                            if ([memberObj.NumberString isEqualToString:obj.NumberString]) {
                                [tempMembersArray removeObject:memberObj];
                            }
                        }
                    }
                    weakSelf.membersArray = [tempMembersArray mutableCopy];
                    [weakSelf.collectionView reloadData];
                };
                
            }else if (OperatorType == OperatorMemberFireAdmin){
                
                DYJXFireAdminPage *fireAdminPage = [[DYJXFireAdminPage alloc]init];
                fireAdminPage.operatorType = OperatorType;
                
                DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
                __block NSMutableArray<DJJXMembers*> *fireAdminArray = [NSMutableArray array];
                [weakSelf.adminArray enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (![obj.Id isEqualToString:userModel.UserID]) {
                        [fireAdminArray addObject:obj];
                    }
                }];
                fireAdminPage.fireAdminArray = fireAdminArray;
                
                [weakSelf.navigationController pushViewController:fireAdminPage animated:YES];
                
                fireAdminPage.block = ^(NSMutableArray<DJJXMembers *> *membersArray) {
                    __block NSMutableArray<DJJXMembers*> *tempMembersArray = [weakSelf.membersArray mutableCopy];
                    
                    for (DJJXMembers *obj in membersArray) {
                        for (DJJXMembers *memberObj in weakSelf.membersArray) {
                            if ([memberObj.NumberString isEqualToString:obj.NumberString]) {
                                [tempMembersArray removeObject:memberObj];
                            }
                        }
                    }
                    weakSelf.membersArray = [tempMembersArray mutableCopy];
                    [weakSelf.collectionView reloadData];
                };
                
            }
            
            
            
            };
        
        };
    return _addMemberTopView;
}

- (NSMutableArray<DJJXMembers *> *)membersArray{
    if (!_membersArray) {
        _membersArray = [NSMutableArray array];
    }
    return _membersArray;
}

- (NSMutableArray<DJJXMembers *> *)adminArray{
    if (!_adminArray) {
        _adminArray = [NSMutableArray array];
    }
    return _adminArray;
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
