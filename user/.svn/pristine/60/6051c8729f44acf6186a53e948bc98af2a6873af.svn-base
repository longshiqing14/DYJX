//
//  XYClassificationGoodsRightCVC.m
//  user
//
//  Created by xingyun on 2017/11/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationGoodsRightCVC.h"

#import "XYClassificationGoodsRightCVCell.h"
#import "XYClassificationModel.h"
#import "JXSearchResultPage.h"

@interface XYClassificationGoodsRightCVC ()

@end

@implementation XYClassificationGoodsRightCVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    // 创建一个流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动的方向
    //    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = XYWhiteColor;
    
    // Register cell classes
    [self.collectionView registerClass:[XYClassificationGoodsRightCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    
    [self.collectionView reloadData];
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYClassificationGoodsRightCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (_dataSource.count > indexPath.row) {
        XYClassificationModel * model = _dataSource[indexPath.row];
        
        [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cell.titleLB.text = model.name;
    }
    
    
    return cell;
}



#pragma mark <UICollectionViewDelegate>

// collection item 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //(XYScreenW - 100 - 15*2)/3
    return CGSizeMake((XYScreenW - 100 - 15*2 - 10*2)/3, 100);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYClassificationModel * model = self.dataSource[indexPath.row];
//    if (self.productClickBlock) {
//        self.productClickBlock(model.columnId);
//    }
    
    JXSearchResultPage *searchResultPage = [[JXSearchResultPage alloc]init];
    searchResultPage.columnID = model.columnId;
    [self.navigationController pushViewController:searchResultPage animated:NO];
    
}



@end
