//
//  UIAlertView+UIAlertView_Block.h
//  YSO2O
//
//  Created by Benson on 4/9/15.
//  Copyright (c) 2015 Eascs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock) (NSInteger buttonIndex);

@interface UIAlertView (UIAlertView_Block)

// 用Block的方式回调，这时候会默认用self作为Delegate
- (void)showAlertViewWithCompleteBlock:(CompleteBlock)block;

@end
