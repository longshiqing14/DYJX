//
//  XYOrderListCellGoodsListCVC.m
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderListCellGoodsListCVC.h"

#import "XYOrderListCellGoodsListCVCell.h"

#import "XYOrderListModel.h"

@interface XYOrderListCellGoodsListCVC ()

@end

@implementation XYOrderListCellGoodsListCVC

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
    self.collectionView.scrollEnabled = NO;
    self.collectionView.userInteractionEnabled = NO;
    
    
    
    [self.collectionView registerClass:[XYOrderListCellGoodsListCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    



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
    
    return _dataSource.count >= 3 ? 3 : _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderListCellGoodsListCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    XYOrderListGoodsListModel * model = _dataSource[indexPath.item];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    if ([model.amount isEqualToString:@"1"]) {
        cell.titleLB.text = @"";
    }else{
        cell.titleLB.text = [NSString stringWithFormat:@"X%@",model.amount];
    }

    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 60);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


@end
