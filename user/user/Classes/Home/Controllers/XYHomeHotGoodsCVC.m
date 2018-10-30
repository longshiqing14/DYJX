//
//  XYHomeHotGoodsCVC.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeHotGoodsCVC.h"

#import "XYHomeHotGoodsCVCell.h"
#import "XYGoodsDetailModel.h"

@interface XYHomeHotGoodsCVC ()



@end

@implementation XYHomeHotGoodsCVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    // 创建一个流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动的方向
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.collectionView.scrollEnabled = NO;
    
    self.collectionView.backgroundColor = XYWhiteColor;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView registerClass:[XYHomeHotGoodsCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYHomeHotGoodsCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    cell.backgroundColor = XYGlobalBg;
    
    if (self.dataSource.count > indexPath.item) {
        
        XYGoodsDetailModel * model = self.dataSource[indexPath.item];
        cell.detailModel = model;
    }
    
    
    return cell;
}




#pragma mark <UICollectionViewDelegate>

// collection item 尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //(XYScreenW -20 - 15*2)/3
    return CGSizeMake(130, 200);//原始120 ，200
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(homeHotGoodsSelectProductId:)]) {
        XYGoodsDetailModel * model = self.dataSource[indexPath.item];
        [self.delegate homeHotGoodsSelectProductId:model.productId];
    }
}


@end
