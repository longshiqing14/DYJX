//
//  JXRefundImageUploadCell.h
//  user
//
//  Created by 岩  熊 on 2018/4/9.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYOrderCommentDetailModel.h"

@interface JXRefundImageUploadCell : UITableViewCell
@property (copy, nonatomic) void(^addPicturesBlock)();
@property (copy, nonatomic) void (^deleteImageBlock)(NSInteger index);
/** 内容标签 */
@property(strong,nonatomic) UILabel *contentLab ;

/** 评论图片 */
@property(strong,nonatomic) UICollectionView *photoImgCollectionView ;
@property(strong, nonatomic) NSMutableArray *imagesArray;


@property(strong,nonatomic) XYOrderCommentDetailModel *model ;

@end
