//
//  JXHomeActivityCell.h
//  user
//  活动商品如冬日宅家
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXHomelDataModel.h"

@interface JXHomeActivityCell : UICollectionViewCell
//商品类型
@property (weak, nonatomic) IBOutlet UILabel *cellCommodityType;
//商品描述
@property (weak, nonatomic) IBOutlet UILabel *celldescribe;

//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
-(void)cell_init:(HomelRotateaModel *)model;
@end
