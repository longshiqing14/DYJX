//
//  DYJXAddressModel.h
//  user
//
//  Created by YP on 2019/4/29.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DYJXProvinceAddressModel;
@class DYJXCityAddressModel;
@class DYJXAreaAddressModel;

@interface DYJXAddressModel : NSObject

@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, strong) NSArray<DYJXProvinceAddressModel *> * Provinces;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, copy) NSString * UserID;

@end

@interface DYJXProvinceAddressModel : NSObject

@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, copy) NSString * ProvinceID;
@property (nonatomic, copy) NSString * ProvinceName;
@property (nonatomic, copy) NSString *CityID;
@property (nonatomic, copy) NSString * CityName;
@property (nonatomic, copy) NSString *ZipCode;
@property (nonatomic, copy) NSString *DistrictID;
@property (nonatomic, copy) NSString *DistrictName;


@end

@interface DYJXAreaAddressModel : NSObject

@end

NS_ASSUME_NONNULL_END
