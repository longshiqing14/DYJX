//
//  DYJXAddMemberTopView.h
//  user
//
//  Created by 岩  熊 on 2018/12/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^OperatorBlock)(OperatorMember);

@interface DYJXAddMemberTopView : UIView
@property (nonatomic, copy) OperatorBlock block;
@end
