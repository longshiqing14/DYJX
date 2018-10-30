//
//  ActionDefine.h
//  EA_CloudStoreBuyer
//
//  Created by Chapter Zhang on 15/10/14.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#ifndef ActionDefine_h
#define ActionDefine_h

typedef NSInteger YWDListViewActionName;
static YWDListViewActionName const kYWDListViewActionNone = 0;

#define YWDListViewActionMaker(actionName) static YWDListViewActionName const kYWDListViewAction##actionName = kYWDListViewActionNone + __COUNTER__
#define YWDActionDefine(actionName) static YWDListViewActionName const kYWDAction##actionName = kYWDListViewActionNone + __COUNTER__
typedef BOOL(^YWDCommonActionHandlerBlock)(YWDListViewActionName actionName,NSDictionary *userInfo);

@protocol YWDActionSender <NSObject>

-(void)setActionHandler:(YWDCommonActionHandlerBlock)actionHandler;

@end
#endif /* ActionDefine_h */
