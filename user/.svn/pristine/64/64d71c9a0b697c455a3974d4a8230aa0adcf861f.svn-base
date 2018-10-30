//
//  JXOderSettlementModel.m
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderSettlementModel.h"

@implementation JXOderSettlementModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"ocs" : [JXOderOcsModel class]};
}
@end

@implementation JXOderDeliveryAddressModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"addressID":@"id"
             };
}
@end

@implementation JXOderInvoiceInfoModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"invoiceInfoID":@"id"
             };
}
@end

@implementation JXOderAvailableDeliveryRuleResults
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"deliveryID":@"id",@"descriptionDoc":@"description"};
}
@end

@implementation JXOderPaymentListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"payID":@"id"};
}

@end

@implementation JXOderOcsModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"allCardRules" : [JXOderAllCardRulesModel class],@"availableDeliveryRuleResults":[JXOderAvailableDeliveryRuleResults class],@"paymentList":[JXOderPaymentListModel class],@"buyItems":[JXOderBuyItemsModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"descriptionDoc":@"description"};
}
@end


@implementation JXOderBuyItemsModel

@end

@implementation JXOderAllCardRulesModel
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"allCardRules" : [JXOderAllCardRulesModel class]};
//}
@end

@implementation JXOderIntegralModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"integralDesc" : [JXOderIntegralDescModel class]};
}
@end

@implementation JXOderIntegralDescModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"desc" : [NSString class]};
}
@end

//JXOderAvailableDeliveryRuleResults
@implementation JXOderDeliveryPointInfoModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"sinceID":@"id"
             };
}
@end
