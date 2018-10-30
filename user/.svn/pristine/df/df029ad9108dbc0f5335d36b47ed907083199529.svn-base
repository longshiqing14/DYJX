//
//  XYOrderCommon.m
//  user
//
//  Created by xingyun on 2017/9/22.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommon.h"

#import "XYMineOrderListVC.h"


@implementation XYOrderCommon

+ (NSString*)numOrderRedMarkViewController:(UIViewController*)VC
{
    NSString * string = @"";
    if ([VC isKindOfClass:[XYMineOrderListVC class]]) {//订单
        //p100:待付款,p101:待发货,p102:待收货,p112:已完成,p111:已取消
        
        if ([VC.title isEqualToString:@"全部"]) {
            
        }else if ([VC.title isEqualToString:@"待付款"]){
            string = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p100"];
        }else if ([VC.title isEqualToString:@"待发货"]){
            string = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p101"];
        }else if ([VC.title isEqualToString:@"待收货"]){
            string = [XYUserDefaults readAppDlegateOfStatusDictKey:@"counts" otherKey:@"p102"];
        }else if ([VC.title isEqualToString:@"评价"]){

        }
        
    }
    
    
    return string;
}



@end
