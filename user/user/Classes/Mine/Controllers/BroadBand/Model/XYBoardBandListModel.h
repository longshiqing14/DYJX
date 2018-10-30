//
//  XYBoardBandListModel.h
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XYBoardBandUserInfoModel;
@interface XYBoardBandListModel : NSObject
/**安装地址*/
@property(copy,nonatomic) NSString *address ;
/**ID*/
@property(copy,nonatomic) NSString *broadbandId ;



/**带宽*/
@property(copy,nonatomic) NSString *broadbandSize ;

/**创建时间*/
@property(copy,nonatomic) NSString *createTime ;
/**	结束时间*/
@property(copy,nonatomic) NSString *endTime ;

/** 登记手机号*/
@property(copy,nonatomic) NSString *mobile ;
/** 登记名称 */
@property(copy,nonatomic) NSString *name ;
/** 套餐名称 */
@property(copy,nonatomic) NSString *productName ;

/** 结束时间*/
@property(copy,nonatomic) NSString *residueTime ;

/** 状态 */
@property(copy,nonatomic) NSString *state ;
/** 交易时间 */
@property(copy,nonatomic) NSString *transactionTime ;

@property(strong,nonatomic) XYBoardBandUserInfoModel *userInfo ;

/** 续费id 在续费列表中可用 */
@property(copy,nonatomic) NSString *renewalId ;

@end


@interface XYBoardBandUserInfoModel : NSObject

/** 昵称 */
@property(copy,nonatomic) NSString *nickName ;
/** 真名 */
@property(copy,nonatomic) NSString *realName ;
/** 用户id */
@property(copy,nonatomic) NSString *userId ;

@end

