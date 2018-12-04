//
//  CompanyBottomView.h
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EnterConversionBlock)(void);
typedef void(^ExitCompanyBlock)(void);

@interface CompanyBottomView : UIView
@property (nonatomic,copy)EnterConversionBlock enterConversionBlock;
@property (nonatomic,copy)ExitCompanyBlock exitCompanyBlock;
@end
