//
//  JXStyleView.h
//  user
//
//  Created by 岩  熊 on 2017/11/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JXStyleViewDelegate <NSObject>
- (void)witchStyle:(NSInteger)style;
@end

@interface JXStyleView : UIView
@property (nonatomic, weak) id<JXStyleViewDelegate> delegate;

@end
