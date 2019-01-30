//
//  SubcompanyBottomView.h
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SendConversationBlock)();

@interface SubcompanyBottomView : UIView
@property (nonatomic, copy)SendConversationBlock block;
@end
