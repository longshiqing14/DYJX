//
//  JXHomeCommodityCell.h
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeCommodityCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellPrice;
@property (weak, nonatomic) IBOutlet UIButton *commodityButton;
@property(nonatomic,copy)void (^ AddShopCarClock)(CGPoint point);
@property(nonatomic,strong)IBOutlet UILabel *sellingPointTextLable;
-(void)cell_init:(HomelRecommendListModel *)model;

@end
