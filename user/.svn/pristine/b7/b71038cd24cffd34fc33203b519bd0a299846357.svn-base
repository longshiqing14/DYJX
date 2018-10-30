//
//  XYDatePickerView.h
//  user
//
//  Created by xingyun on 2017/10/24.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYDatePickerViewDelegate <NSObject>

-(void)backTime:(NSDate *)timeStr WithPicker:(UIDatePicker *)picker;

@end
@interface XYDatePickerView : UIView


-(void)pickerShow;

@property(assign,nonatomic) id<XYDatePickerViewDelegate>delegate ;

@property(strong,nonatomic) UIDatePicker *datePicker ;


@end
