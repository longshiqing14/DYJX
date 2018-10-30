//
//  JXVersionUpdateView.h
//  user
//
//  Created by 岩  熊 on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GoToAppStoreBlock)(void);
typedef void(^CancelBlock)(void);

@interface JXVersionUpdateView : UIView
@property (weak, nonatomic) IBOutlet UILabel *versionLb;
@property (weak, nonatomic) IBOutlet UILabel *targetSizeLb;
@property (weak, nonatomic) IBOutlet UILabel *updateLogLb;
@property (weak, nonatomic) IBOutlet UIButton *CloseBTN;
@property (weak, nonatomic) IBOutlet UIButton *uptateBTN;
@property (nonatomic, copy)GoToAppStoreBlock goToAppStoreBlock;
@property (nonatomic, copy)CancelBlock cancelBlock;
@end
