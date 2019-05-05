//
//  ImageUploadCell.h
//  user
//
//  Created by 岩  熊 on 2018/11/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "XYOrderCommentDetailModel.h"
@interface ImageUploadCell : BaseTableViewCell
@property (nonatomic, strong) LPXNewCustomerCellModel *cellmodel;
@property (copy, nonatomic) void(^addPicturesBlock)();
@property (copy, nonatomic) void (^deleteImageBlock)(NSInteger index);
///** 内容标签 */
//@property(strong,nonatomic) UILabel *contentLab ;

/** 评论图片 */
@property(strong,nonatomic) UICollectionView *photoImgCollectionView ;
@property(strong, nonatomic) NSMutableArray *imagesArray;


@property(strong,nonatomic) XYOrderCommentDetailModel *model ;
@end
