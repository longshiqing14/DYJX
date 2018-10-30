//
//  JXQueryConditionItem.h
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  箭头指示器方向
 */
typedef NS_ENUM(NSInteger,EABAItemArrowType) {
    /**
     *  无箭头指示器
     */
    EABAItemArrowNone = 0,
    /**
     *  向上箭头指示器
     */
    EABAItemArrowUp = 2,
    /**
     *  向下箭头指示器
     */
    EABAItemArrowDown = 1
    
};
@interface JXQueryConditionItem : UIControl

/**
 *  箭头指示器方向
 */
@property(nonatomic,assign)EABAItemArrowType arrowType;
/**
 *  是否显示箭头指示器
 */
@property (nonatomic, assign) BOOL showArrow;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *iconImage;
@end
