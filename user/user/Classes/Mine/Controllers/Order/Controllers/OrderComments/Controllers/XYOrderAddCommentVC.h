//
//  XYOrderAddCommentVC.h
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"

#import "XYCommentListModel.h"

typedef void(^addSuccessBlock)(void);
@interface XYOrderAddCommentVC : XYBestVC

/** 商品信息 */
@property(strong,nonatomic) XYCommentProductListModel *dataModel ;
/** 成功回调 */
@property(copy,nonatomic) addSuccessBlock successBlock ;
@end