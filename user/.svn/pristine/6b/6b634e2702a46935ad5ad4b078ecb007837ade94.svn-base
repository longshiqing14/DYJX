//
//  JXHomeCollectionView.h
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeRecommendCollectionView : UIView
@property (strong, nonatomic)  UICollectionView *homeCollectuion;
//点击每日推荐的商品
@property(nonatomic,copy)void (^ ClockItem)(HomelRecommendListModel *model);
//@property(nonatomic,copy)void (^ AddShop)(CGRect frame,HomelRecommendListModel *ListModel,UIImage *carImage);

@property(nonatomic,strong)NSArray *recommendArray;
-(void)setRecommendArray:(NSArray *)recommendArray;
-(void)CollectuionInit;
@end
