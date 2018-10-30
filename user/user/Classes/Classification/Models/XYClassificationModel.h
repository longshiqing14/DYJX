//
//  XYClassificationModel.h
//  user
//
//  Created by xingyun on 2017/11/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYClassificationModel : NSObject

/** 分类 id */
@property (nonatomic, copy) NSString * columnId;
/** 分类 层级 */
@property (nonatomic, copy) NSString * currentLevel;
/**  */
@property (nonatomic, copy) NSString * custom;
/** 分类 名 */
@property (nonatomic, copy) NSString * name;
/**  */
@property (nonatomic, copy) NSString * sameLine;
/**  */
@property (nonatomic, copy) NSString * selected;
/**  */
@property (nonatomic, copy) NSString * url;

/** 图 */
@property (nonatomic, copy) NSString * icon;

@property (nonatomic, strong) NSMutableArray * children;


@end
