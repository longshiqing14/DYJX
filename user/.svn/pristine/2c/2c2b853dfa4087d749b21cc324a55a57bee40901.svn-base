//
//  XYOrderAlreadyCommentCell.h
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYCommentListModel.h"


@protocol XYOrderAlreadyCommentCellDelegate <NSObject>

-(void)btnHandlerWithIndex:(NSIndexPath *)index btnTitle:(NSString *)title;

@end

@interface XYOrderAlreadyCommentCell : UITableViewCell
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
/** 状态标签 */
@property(strong,nonatomic) UILabel *statusLab ;

@property(strong,nonatomic) XYCommentProductListModel *model ;


@property(strong,nonatomic) NSIndexPath *index ;
@property(assign,nonatomic) id<XYOrderAlreadyCommentCellDelegate> delegate ;

@end
