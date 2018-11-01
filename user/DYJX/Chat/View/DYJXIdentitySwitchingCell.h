//
//  JXFoodCell.h
//  user
//
//  Created by 岩  熊 on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSError *(^GoShopCartBtnClickBlock) (UIButton *btn);

@interface DYJXIdentitySwitchingCell : UITableViewCell
@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UILabel *goodsNameLabel;
@property (nonatomic, strong) UILabel *sellingPointLable;
@property (nonatomic, strong) NSMutableArray<NSString*> *dataArray;

@end
