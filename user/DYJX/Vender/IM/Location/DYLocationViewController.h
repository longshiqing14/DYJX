//
//  DYLocationViewController.h
//  user
//
//  Created by longshiqing on 2018/12/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIMLocationViewController.h"
#import "NIMKitLocationPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYLocationViewController : UIViewController

@property (nonatomic, assign)BOOL isSubmit; // 是否显示提交按钮

@property(nonatomic,weak)   id<NIMLocationViewControllerDelegate> delegate;

@property (nonatomic, strong)NIMKitLocationPoint *centerPoint;

@end

NS_ASSUME_NONNULL_END
