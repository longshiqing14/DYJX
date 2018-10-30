//
//  UITextField+LimitInputNumber.h
//  EABuyerAPP
//
//  Created by wuyang on 16/10/9.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LimitTextNumberDataSource <NSObject>

- (void)LimitTextFontOfNumber:(NSInteger)num;

@end

@interface UITextField (LimitInputNumber)


@property (nonatomic,assign) NSInteger maxLimitTextNumber;
@property (nonatomic,weak) id<LimitTextNumberDataSource> dataSource;

- (void)observeTextDidchangeNotification;

- (void)removeTextChangeNotificationObserver;


- (void)addLeftMarginView;
@end
