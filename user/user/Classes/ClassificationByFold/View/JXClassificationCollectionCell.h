//
//  JXClassificationCollectionCell.h
//  user
//
//  Created by 岩  熊 on 2018/1/24.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXDiscountView.h"

typedef NSError *(^GoShopCartBtnClickBlock) (UIButton *btn);

@interface JXClassificationCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, strong) UILabel *goodsNameLabel;
@property (nonatomic, strong) UILabel *goodsPriceLabel;
@property (nonatomic, strong) UIButton *shopCartBTN;
@property (nonatomic, copy) GoShopCartBtnClickBlock ShopCartBtnClickBlock;
//@property (nonatomic, strong) TTGTextTagCollectionView *tagCollectionView;
//@property (nonatomic, strong) UIButton *couponView;
@property (nonatomic, strong) NSMutableArray<NSString*> *dataArray;
@property(nonatomic,strong)JXDiscountView *cellDiscount;
-(void)setDataArray:(NSMutableArray<NSString *> *)dataArray;
@end
