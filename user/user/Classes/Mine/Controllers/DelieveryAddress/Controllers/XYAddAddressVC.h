//
//  XYAddAddressVC.h
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"
#import "XYAddressListModel.h"

typedef void(^needRefresh)(void);
@interface XYAddAddressVC : XYBestVC



@property(strong,nonatomic) XYAddressListModel *dataModel ;


@property(copy,nonatomic) needRefresh refresh ;


@property(strong,nonatomic) NSArray *dataArr ;

@end
