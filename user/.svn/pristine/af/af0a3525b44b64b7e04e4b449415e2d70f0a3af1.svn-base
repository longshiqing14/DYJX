//
//  JXHomeCollectionView.m
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeRecommendCollectionView.h"
#import "JXHomeRecommendCell.h"

static NSString *cellID=@"cellID";

@interface JXHomeRecommendCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation JXHomeRecommendCollectionView


-(void)CollectuionInit{
   
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(130, 130);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 2;
    
    self.homeCollectuion = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
    self.homeCollectuion.backgroundColor = [UIColor whiteColor];
    self.homeCollectuion.delegate = self;
    self.homeCollectuion.dataSource = self;
    self.homeCollectuion.scrollsToTop = NO;
    self.homeCollectuion.showsVerticalScrollIndicator = NO;
    self.homeCollectuion.showsHorizontalScrollIndicator = NO;
//    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:kMyCollectionViewCellID];
    [self addSubview:self.homeCollectuion];

    
    
    
    
    [self.homeCollectuion registerNib:[UINib nibWithNibName:@"JXHomeRecommendCell" bundle:nil] forCellWithReuseIdentifier:cellID];
//    self.homeCollectuion.delegate=self;
//    self.homeCollectuion.dataSource=self;
    
}

-(void)setRecommendArray:(NSArray *)recommendArray{
    _recommendArray=recommendArray;
    
    [self.homeCollectuion reloadData];
}


#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _recommendArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    JXHomeRecommendCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell cell_init:[_recommendArray objectAtIndex:indexPath.row]];
    cell.AddShopCarClock = ^(CGPoint point) {
//        if (weakSelf.AddShop) {
        
            HomelRecommendListModel *model= [_recommendArray objectAtIndex:indexPath.row];
            [YWDTools addCartAnimationWithStartPoint:point endPoint:CGPointMake(0, 0) goodsImage:model.logo productId:model.productId animation:YES];
//            JXHomeRecommendCell *cell=(JXHomeRecommendCell *)[collectionView cellForItemAtIndexPath:indexPath];
//            weakSelf.AddShop(frame, [_recommendArray objectAtIndex:indexPath.row],cell.cellImgeView.image);
//        }
    };
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HomelRecommendListModel *ListModel=[_recommendArray objectAtIndex:indexPath.row];
    if (self.ClockItem) {
        self.ClockItem(ListModel);
    }
}
#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    return CGSizeMake(XYScreenW/2.5, 220);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

@end
