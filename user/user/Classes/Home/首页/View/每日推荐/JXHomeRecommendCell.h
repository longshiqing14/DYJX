//
//  JXHomeRecommendCell.h
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeRecommendCell : UICollectionViewCell
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *cellImgeView;
//商品title
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
//价格
@property (weak, nonatomic) IBOutlet UILabel *cellPrice;
//购物车按钮
@property (weak, nonatomic) IBOutlet UIButton *recimmendButton;
//添加购物车
@property(nonatomic,copy)void (^ AddShopCarClock)(CGPoint point);
@property (weak, nonatomic) IBOutlet UILabel *sellingPointTextLable;
-(void)cell_init:(HomelRecommendListModel *)model;
@end
