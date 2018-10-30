//
//  XYDeliveryWayPopView.h
//  user
//
//  Created by xingyun on 2017/9/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XYDeliveryWayPopViewDelegate <NSObject>

@optional
/** 选中返回方式*/
-(void)selectWay:(NSString *)way;

@end

@interface XYDeliveryWayPopView : UIView

-(void)showWithStr:(NSString *)str;


@property(strong,nonatomic) NSArray *dataArr ;

@property(assign,nonatomic) id<XYDeliveryWayPopViewDelegate> delegate  ;


@end
