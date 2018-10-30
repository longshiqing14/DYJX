//
//  JXPopExplainView.h
//  user
//
//  Created by liu_yakai on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXPopExplainView : UIView
@property(nonatomic,copy)void (^ Diss)();
@property (weak, nonatomic) IBOutlet UITextView *popExplainTextView;
-(void)setPop:(NSString *)popStr;
@end
