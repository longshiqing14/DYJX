//
//  DYJXCompanyAddressController.h
//  user
//
//  Created by YP on 2019/4/29.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef NS_OPTIONS (NSInteger ,DYJXCompanyAddressType){
    DYJXCompanyAddressType_Province,        // 省
    DYJXCompanyAddressType_City,            // 市
    DYJXCompanyAddressType_District         // 区/县
};

NS_ASSUME_NONNULL_BEGIN

@interface DYJXCompanyAddressController : BaseViewController

- (instancetype)initWithAddressModel:(id)addressModel addressType:(DYJXCompanyAddressType)addressType provinceName:(NSString *)provinceName cityName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
