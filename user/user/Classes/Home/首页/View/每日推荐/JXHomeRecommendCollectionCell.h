//
//  JXHomeRecommendCollectionCell.h
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomeRecommendCollectionView.h"
#import "JXHomelDataModel.h"

@interface JXHomeRecommendCollectionCell : UICollectionViewCell
@property(nonatomic,strong)JXHomeRecommendCollectionView*collectionView;
@property(nonatomic,copy)void (^ ClockItem)(HomelRecommendListModel *model);
@property(nonatomic,copy)void (^ AddShop)(CGRect frame,HomelRecommendListModel *ListModel,UIImage *carImage);
-(void)cell_init:(NSArray *)array;
@end
