//
//  JXMyOrderDetailsModel.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOrderDetailsModel.h"

@implementation JXMyProcessStateInfoModel

@end

@implementation JXMyInvoiceInfoModel

@end



@implementation JXMyBuyerInfoModel

@end



@implementation JXMyItemsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"goodsID" : @"id"};
}


@end




@implementation JXMySellerInfoModel

@end



@implementation JXMyDeliveryPointInfoModel

@end

@implementation JXMyPayRecsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"paymentTypeID" : @"id"};
}
@end

@implementation JXMyOrderDetailsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"paymentArr" : [NSString class]};
}
@end


@implementation JXMyOrdersModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"items" : [JXMyItemsModel class],
             @"payRecs" : [JXMyPayRecsModel class]};
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"orderNotes" : @"description"};
}
@end
