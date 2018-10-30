//
//  JXSeachCityModel.h
//  user
//
//  Created by liu_yakai on 2017/12/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JXListModel : NSObject
@property(nonatomic,strong)NSString *cityId;
@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSString *theMerchantId;
@end

@interface JXSeachCityModel : NSObject
@property(nonatomic,strong)NSArray *communityList;
@end
