//
//  BlackTableViewCell.h
//  user
//
//  Created by longshiqing on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlackTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, strong) UILabel *goodsNameLabel;
@property (nonatomic, strong) UILabel *sellingPointLable;
@property (nonatomic, strong) UILabel *line;
@property (nonatomic, strong) UIButton *releaseButton;

@end

NS_ASSUME_NONNULL_END
