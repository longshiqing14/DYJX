//
//  DLHeadScanView.h
//  user
//
//  Created by longshiqing on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLHeadScanView : UIView

@property (nonatomic, strong)HeadView *contractButton;
@property (nonatomic, strong)UIButton *scanButton;
@property (nonatomic, strong)UIButton *qrCodeButton;

@end

NS_ASSUME_NONNULL_END
