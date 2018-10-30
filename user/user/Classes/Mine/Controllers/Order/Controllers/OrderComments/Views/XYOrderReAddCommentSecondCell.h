//
//  XYOrderReAddCommentSecondCell.h
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYOrderCommentDetailModel.h"

@interface XYOrderReAddCommentSecondCell : UITableViewCell

/** 内容标签 */
@property(strong,nonatomic) UILabel *contentLab ;

/** 评论图片 */
@property(strong,nonatomic) UICollectionView *photoImgCollectionView ;

/** 时间 */
@property(strong,nonatomic) UILabel *timeLab ;

@property(strong,nonatomic) XYOrderCommentDetailModel *model ;

@end
