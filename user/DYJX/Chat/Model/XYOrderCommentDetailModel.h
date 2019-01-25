//
//  XYOrderCommentDetailModel.h
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XYOrderCommentDetailModel : NSObject
/**自动好评*/
@property(strong,nonatomic) NSString *certifyReason ;
/***/
@property(copy,nonatomic) NSString *certifyState ;

/**时间戳*/
@property(copy,nonatomic) NSString *certifyTime ;

/***/
@property(copy,nonatomic) NSString *certifyUserId ;

/***/
@property(strong,nonatomic) NSString *comment ;
/**图片URL列表*/
@property(strong,nonatomic) NSArray *images ;
/**匿名评论*/
@property(copy,nonatomic) NSNumber *isAnonymity ;
/**  能否修改*/
@property(copy,nonatomic) NSNumber *isCanModify ;

/**  */
@property(copy,nonatomic) NSString *star ;
/** 创建时间 */
@property(copy,nonatomic) NSString *createTimeText ;
@end




@interface XYOrderReCommentDetail : NSObject

/** 审核状态 */
@property(copy,nonatomic) NSString *certifyState ;

/**评论内容*/
@property(copy,nonatomic) NSString *comment ;
/** 评论图片 */
@property(strong,nonatomic) NSArray *images ;

/**追加评论的标题*/
@property(copy,nonatomic) NSString *timeDifference ;

@end



