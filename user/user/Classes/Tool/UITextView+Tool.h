//
//  UITextView+Tool.h
//  JLYP
//
//  Created by liu_yakai on 17/6/28.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Tool)
/**
 *  协议划线文字或者变色文字
 *
 *  @param agreement 协议内容或者标题此处只能是html
 *
 *  @return 返回UITextView控件
 */
-(UITextView *)agreementStr:(NSString *)agreement;
@end
