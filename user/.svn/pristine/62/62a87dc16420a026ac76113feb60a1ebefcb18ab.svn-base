//
//  JXDiscountView.m
//  user
//
//  Created by liu_yakai on 2017/12/3.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXDiscountView.h"
#import "JXDiscountCell.h"


static NSString *cellID=@"cellID";

@implementation JXDiscountView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)cell_init{
 

    self.discountCollectionView.delegate=self;
    self.discountCollectionView.dataSource=self;
    [ self.discountCollectionView  registerNib:[UINib nibWithNibName:@"JXDiscountCell" bundle:nil] forCellWithReuseIdentifier:cellID];
}

-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray=dataArray;
    [self.discountCollectionView reloadData];
}

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JXDiscountCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell cell_init:self.dataArray[indexPath.row]];
    return cell;
}


#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *title= self.dataArray[indexPath.row];
    return (CGSize){[YWDTools getSizeWithText:title].width+10,16};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
