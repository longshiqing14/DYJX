//
//  DYJXAddCompanyPageController.h
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSInteger ,DYJXAddCompanyType){
    DYJXAddCompanyType_None, // 默认公司
    DYJXAddCompanyType_Sub,   // 子公司
    DYJXAddCompanyType_Details // 公司详情
};

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddCompanyPageController : UIViewController

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType;

@end

NS_ASSUME_NONNULL_END
