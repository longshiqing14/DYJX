//
//  XYOrderDetailOrderStatusModel.m
//  user
//
//  Created by xingyun on 2017/9/22.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailOrderStatusModel.h"

@implementation XYOrderDetailOrderStatusModel

+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"status_id":@"id",
             };
}



@end


@implementation JXOrderStatusModel

+ (NSDictionary*)mj_objectClassInArray
{
    return @{
             @"logList":@"XYOrderDetailOrderStatusModel",@"logisticInfoData":@"JXLogisticInfoDataModel"
             };
}
@end

@implementation JXLogisticInfoDataModel

//+ (NSDictionary*)mj_objectClassInArray
//{
//    return @{
//             @"logList":@"XYOrderDetailOrderStatusModel",@"logisticInfoData":
//                 };
//}

@end
