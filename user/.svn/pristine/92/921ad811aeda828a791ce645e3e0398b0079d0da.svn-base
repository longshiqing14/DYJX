//
//  YWDLimitTextTextField.m
//  EA_CloudStoreBuyer
//
//  Created by wuyang on 15/11/13.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "EABFLimitTextTextField.h"

@implementation EABFLimitTextTextField
 
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self observeTextDidchangeNotification];
    }
    return self;
}

-(void)dealloc{
    [self removeTextChangeNotificationObserver];
}
- (void)awakeFromNib{
    [self observeTextDidchangeNotification];
}

 @end
