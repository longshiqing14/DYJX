//
//  XYSelectIconPopView.h
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XYSelectIconPopViewDelegate <NSObject>
@required
-(void)selectWayIndex:(NSInteger )index;

@end

@interface XYSelectIconPopView : UIView


-(void)show;

@property(assign,nonatomic) id<XYSelectIconPopViewDelegate> delegate ;

@end
