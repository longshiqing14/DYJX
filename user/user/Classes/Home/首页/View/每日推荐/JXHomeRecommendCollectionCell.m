//
//  JXHomeRecommendCollectionCell.m
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeRecommendCollectionCell.h"


@implementation JXHomeRecommendCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    
}


-(void)cell_init:(NSArray *)array{
    WeakSelf;
    self.collectionView=[[[NSBundle mainBundle]loadNibNamed:@"JXHomeRecommendCollectionView" owner:self options:nil]lastObject];
    self.collectionView.frame=CGRectMake(0, 0, kScreenWidth, 220);
    self.collectionView.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:self.collectionView];
    [self.collectionView CollectuionInit];
    [self.collectionView setRecommendArray:array];
    self.collectionView.ClockItem = ^(HomelRecommendListModel *model) {
        if (weakSelf.ClockItem) {
            weakSelf.ClockItem(model);
        }
    };
    
//    self.collectionView.AddShop = ^(CGRect frame, HomelRecommendListModel *ListModel,UIImage *carImage) {
//        if (weakSelf.AddShop) {
//            weakSelf.AddShop(frame, ListModel,carImage);
//        }
//    };
}

@end
