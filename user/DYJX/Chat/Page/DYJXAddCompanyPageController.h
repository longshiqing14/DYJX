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

@property (nonatomic, copy) NSString *groupNumber;
@property (nonatomic, copy) NSString *targetId;
@property (nonatomic, assign) BOOL isAdmin;
@property (nonatomic, copy) NSString *userIconImageURL;
@property (nonatomic,assign) BOOL isFromMyCompany;

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType;

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType requestDic:(NSDictionary *)requestDic result:(DYJXXYResult *)result;

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType groupNumber:(NSString *)groupNumber targetId:(NSString *)targetId userIconImageURL:(NSString *)userIconImageURL isAdmin:(BOOL)isAdmin;

@end

NS_ASSUME_NONNULL_END
