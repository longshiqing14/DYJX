//
//  JXMyBroadbandAccountFootView.h
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXMyBroadbandAccountFootView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BtnHeight;
@property(nonatomic,copy)void (^BindAccount)();
@property (weak, nonatomic) IBOutlet UIButton *bindButton;
-(void)foot_init:(UIColor *)color Title:(NSString *)title;
@end
