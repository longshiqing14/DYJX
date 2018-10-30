//
//  XYOrderReAddCommentFirstCell.h
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYOrderReAddCommentFirstCellDelegate <NSObject>

-(void)numOfStar:(NSInteger)num;

@end

@interface XYOrderReAddCommentFirstCell : UITableViewCell
/** 图标 */
@property(strong,nonatomic) UIImageView *iconImgView ;
/** 描述 */
@property(strong,nonatomic) UILabel *descLab ;

@property(assign,nonatomic) id<XYOrderReAddCommentFirstCellDelegate> delegate ;

/** 追加评论时用 */
@property(copy,nonatomic) NSString *descStr ;

@property(copy,nonatomic) NSString *star ;
@end
