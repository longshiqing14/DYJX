//
//  DYJXAddCompanyPageController.h
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXAddCompanyPageViewModel.h"
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddCompanyPageController : BaseViewController

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType;

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType requestDic:(NSDictionary *)requestDic result:(DYJXXYResult *)result;

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType groupNumber:(NSString *)groupNumber targetId:(NSString *)targetId userIconImageURL:(NSString *)userIconImageURL;

@end

NS_ASSUME_NONNULL_END
