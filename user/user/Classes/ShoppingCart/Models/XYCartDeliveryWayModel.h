//
//  XYCartDeliveryWayModel.h
//  user
//
//  Created by xingyun on 2017/10/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCartDeliveryWayModel : NSObject

@property(copy,nonatomic) NSString *name ;
/**  */
@property(copy,nonatomic) NSNumber *supportDP ;
/** 总价 */
@property(copy,nonatomic) NSNumber *totalPrice ;
/** id */
@property(assign,nonatomic) NSString *id;
//
//@property(strong,nonatomic) NSString * description ;

@end


@interface XYDeliveryPointInfo : NSObject
/** 地址 */
@property(copy,nonatomic) NSString *address ;
/**手机号*/
@property(copy,nonatomic) NSString *mobile ;
/** 联系人 */
@property(copy,nonatomic) NSString *name ;
@end
