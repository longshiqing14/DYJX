//
//  XYOrderPaymentAddressHeaderVC.h
//  XY
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 yongxing. All rights reserved.
//

#import <UIKit/UIKit.h>


//#import "XYAddressListModel.h"
//#import "XYCartDeliveryWayModel.h"

@class XYAddressListModel;
@class XYOrderFromDetailDeliveryPointInfoModel;

@protocol XYOrderPaymentAddressHeaderVCDelegate <NSObject>

-(void)needFatherViewChangeHeaderFrame;

-(void)needReloadData;

@end

@interface XYOrderPaymentAddressHeaderVC : UIViewController

/** view  高度 */
extern const  CGFloat payment_address_height;

/** 配送方式 */
@property(strong,nonatomic) NSString *deliveryWay ;
/** 地址模型 */
@property(strong,nonatomic) XYAddressListModel *addressModel ;
/** 传递过来的数组 */
@property(strong,nonatomic) NSArray *deliveryWayArr ;
/** 传递过来的id */
@property(strong,nonatomic) NSString *deliveryId ;

/** 显示自提地址 */
@property(copy,nonatomic) XYOrderFromDetailDeliveryPointInfoModel *ponitInfoModel ;
/** 购物车id */
@property(copy,nonatomic) NSString *cartId ;

@property(assign,nonatomic) id<XYOrderPaymentAddressHeaderVCDelegate> delegate ;
/** 是否是默认自提 */
@property(assign,nonatomic) BOOL isdefault ;
/**提示标签 */
@property(strong,nonatomic) UILabel *warnLab ;

-(void)selectWay:(NSString *)way adressID:(NSString*)adressID;
@end
