//
//  XYHomePopAdsView.h
//  user
//
//  Created by xingyun on 2017/9/18.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYCycleImageModel;

typedef void(^popViewReturn)(BOOL clickImg ,NSString * url);

@interface XYHomePopAdsView : UIView

- (instancetype)initWithModel:(XYCycleImageModel*)model;

-(void)show;

@property(copy,nonatomic) popViewReturn popBackBlcok ;



@end
