//
//  JXmyAfterSaleDetailFootView.h
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXMyAfterSaleDetailFootView : UIView
@property(nonatomic,copy)void (^ Clock)();
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@end
