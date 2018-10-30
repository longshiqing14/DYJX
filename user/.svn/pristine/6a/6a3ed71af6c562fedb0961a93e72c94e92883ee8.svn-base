//
//  XYAddCommentImgCVCell.h
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYAddCommentImgCVCellDelegate <NSObject>

-(void)deleBtnHandler:(NSIndexPath *)index;

@end

@interface XYAddCommentImgCVCell : UICollectionViewCell
/** 图片视图 */
@property(strong,nonatomic) UIImageView *photoImgView ;
/** 删除图片按钮 */
@property(strong,nonatomic) UIButton *deleImgBtn ;

@property(strong,nonatomic) NSIndexPath *index ;

@property(assign,nonatomic) id<XYAddCommentImgCVCellDelegate> delegate ;

@end
