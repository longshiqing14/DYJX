//
//  DYJXAddMemberTopView.h
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, OperatorMember) {
    OperatorMemberAdd,//添加成员
    OperatorMemberDelete,//删除成员
    OperatorMemberAccessAdmin,//授予管理员
    OperatorMemberFireAdmin,//解除管理员
};

typedef void(^OperatorBlock)(NSInteger);

@interface DYJXAddMemberTopView : UIView
@property (nonatomic, copy) OperatorBlock block;
@end
