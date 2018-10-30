//
//  JXCityListModel.h
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXCommunityListModel : NSObject
@property(nonatomic,strong)NSString *cityId;
@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSString *theMerchantId;

@end

@interface JXValueModel : NSObject
@property(nonatomic,strong)NSArray *value;


@end





@interface JXCityListModel : NSObject
@property(nonatomic,strong)NSArray *communityList;
@property(nonatomic,strong)NSArray *alphaList;
@end
