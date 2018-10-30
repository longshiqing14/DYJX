//
//  YWDLimitTextView.h
//  EA_CloudStoreBuyer
//
//  Created by wuyang on 15/11/26.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EABFLimitTextView : UITextView

@property (nonatomic,assign) NSInteger maxLimitTextNumber;

@property (nullable,nonatomic,copy) NSString *placeHolder;

@property (nonatomic,assign) CGFloat borderWidth;

@property (nonatomic,assign) UIColor *borderColor;

@property (nonatomic,assign) CGFloat cornerRadius;

@end
