//
//  CompanyAdminBottomView.h
//  user
//
//  Created by 岩  熊 on 2018/12/4.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^EnterConversionBlock)(void);
typedef void(^ExitCompanyBlock)(void);
typedef void(^DeleteCompanyBlock)(void);

@interface CompanyAdminBottomView : UIView
@property (nonatomic,copy)EnterConversionBlock enterConversionBlock;
@property (nonatomic,copy)ExitCompanyBlock exitCompanyBlock;
@property (nonatomic,copy)DeleteCompanyBlock deleteCompanyBlock;
@end
