//
//  JXBaseGoodsModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXBaseModel.h"
@interface JXBaseGoodsModel : NSObject
@property (nonatomic,copy) NSString  *memberPrice;
@property (nonatomic,copy) NSString  *title;
@property (nonatomic,copy) NSString  *productName;
@property (nonatomic,copy) NSString  *productId;
@property (nonatomic,copy) NSString  *logo;
@property (nonatomic,copy) NSString  *productID;
@property (nonatomic,strong) NSArray<NSString*> *lable;
@property (nonatomic,copy) NSString  *sellingPointText;
@end
