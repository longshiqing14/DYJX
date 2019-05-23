//
//  DYJXAddGroupMemberPageController.m
//  user
//
//  Created by YP on 2019/5/21.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberPageController.h"
#import "DYJXAddMemberTopView.h"
#import "DYJXAddGroupMemberModel.h"
#import "DYJXAddMemberCollectionViewCell.h"
#import "DYJXContactDetailsController.h"

@interface DYJXAddGroupMemberPageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DYJXAddMemberTopView *addMemberTopView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels;
@end

@implementation DYJXAddGroupMemberPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
    self.title = @"群成员管理";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:21]};
    [self setMembersArrayWithArray];
    [self initCollectionView];
    [self initSubViews];
}

- (void)setMembersArrayWithArray {
    WeakSelf
    [self.memberModels removeAllObjects];
    [self.membersArray enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([weakSelf.MemberIds containsObject:obj.Id] ) {
            [weakSelf.memberModels addObject:[weakSelf addGroupSubMemberWithChildren:obj]];
        }else {
            [weakSelf.membersArray removeObject:obj];
        }
    }];
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

-(void)black_controller {
    if (self.block) {
        self.block(self.memberModels,self.membersArray,self.MemberIds);
    }
    [super black_controller];
}

- (DYJXAddGroupSubMemberModel *)addGroupSubMemberWithChildren:(DJJXMembers *)member {
    DYJXAddGroupSubMemberModel *model = [[DYJXAddGroupSubMemberModel alloc]init];
    model.leftViewImgName = @"register_checkbox";
    model.leftViewselectionImgName = @"register_checkbox_active";
    model.iconName = member.Business.IMInfo.HeadImgUrl;
    model.groupName = member.DisplayName;
    model.isSelection = NO;
    model.GroupNumber = member.Id;
    return model;
}

#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.memberModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXAddMemberCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"DYJXAddMemberCollectionViewCell" forIndexPath:indexPath];
    cell.iconImage.layer.cornerRadius = (self.view.frame.size.width - 30 - 15*4)/5/2;
    cell.iconImage.layer.masksToBounds = YES;
    [cell.iconImage setImageWithURL:[NSURL URLWithString:[self.memberModels[indexPath.row].iconName XYImageURL]] placeholder:[UIImage imageNamed:@"dyjx_default_im_por"]];
    cell.nickName.text = self.memberModels[indexPath.row].groupName;
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DJJXMembers *member = (DJJXMembers *)self.membersArray[indexPath.row];
    DYJXContactDetailsController *page = [[DYJXContactDetailsController alloc]init];
    //    DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
    page.title = @"信息查看";
    page.groupNumber = member.NumberString;
    page.targetId = member.Id;
    [self.navigationController pushViewController:page animated:YES];
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
                DYJXAddGroupMemberController *addMemberVC = [[DYJXAddGroupMemberController alloc]init];
                addMemberVC.MemberIds = weakSelf.MemberIds.mutableCopy;
                addMemberVC.block = ^(NSMutableArray<DJJXMembers *> *memberModels, NSMutableArray<NSString *> *MemberIds) {
                    [weakSelf.MemberIds removeAllObjects];
                    [weakSelf.MemberIds addObjectsFromArray:MemberIds];
                    [weakSelf.membersArray addObjectsFromArray:memberModels];
                    [weakSelf setMembersArrayWithArray];
                    [weakSelf.collectionView reloadData];
                };
                [weakSelf.navigationController pushViewController:addMemberVC animated:YES];
            }else if (OperatorType == OperatorMemberDelete ||
                      OperatorType == OperatorMemberAccessAdmin ||
                      OperatorType == OperatorMemberFireAdmin){
                DYJXSelectMemberPageController *selectMemberPageVC = [[DYJXSelectMemberPageController alloc]init];
                selectMemberPageVC.memberModels = weakSelf.memberModels.mutableCopy;
                selectMemberPageVC.membersArray = weakSelf.membersArray.mutableCopy;
                selectMemberPageVC.MemberIds = weakSelf.MemberIds.mutableCopy;
                selectMemberPageVC.operatorType = OperatorType;
                selectMemberPageVC.block = ^(NSMutableArray<DYJXAddGroupSubMemberModel *> *memberModels, NSMutableArray<DJJXMembers *> *membersArray, NSMutableArray<NSString *> *MemberIds) {
                    weakSelf.memberModels = memberModels.mutableCopy;
                    weakSelf.membersArray = membersArray.mutableCopy;
                    weakSelf.MemberIds = MemberIds.mutableCopy;
                    [weakSelf setMembersArrayWithArray];
                    [weakSelf.collectionView reloadData];
                };
                [weakSelf.navigationController pushViewController:selectMemberPageVC animated:YES];
            }
        };
    }
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

-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)memberModels {
    if (!_memberModels) {
        _memberModels = [[NSMutableArray alloc]init];
    }
    return _memberModels;
}

-(NSMutableArray<NSString *> *)MemberIds {
    if (!_MemberIds) {
        _MemberIds = [[NSMutableArray alloc]init];
    }
    return _MemberIds;
}

@end
