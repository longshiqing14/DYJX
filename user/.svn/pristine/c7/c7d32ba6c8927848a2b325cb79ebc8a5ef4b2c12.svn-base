//
//  XYOrderCommentListCell.h
//  user
//
//  Created by xingyun on 2017/9/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYCommentListModel.h"


@protocol XYOrderCommentListCellDelegate <NSObject>

-(void)commentBtnHandlerWithBool:(BOOL)leftBtn indexpath:(NSIndexPath *)index;

@end
@interface XYOrderCommentListCell : UITableViewCell
/** 图标 */
@property(strong,nonatomic) UIImageView *iconImgV ;
/** 描述标签 */
@property(strong,nonatomic) UILabel *descLab ;
/** 左侧按钮 */
@property(strong,nonatomic) UIButton *leftBtn;
/** 右侧按钮 */
@property(strong,nonatomic) UIButton *rightBtn ;
/** 金色 */
@property(strong,nonatomic) UIColor *rightColor ;

//@property(strong,nonatomic) XYCommentListModel *model ;


@property(strong,nonatomic) NSIndexPath *index ;


@property(assign,nonatomic) id<XYOrderCommentListCellDelegate>delegate ;

@end
