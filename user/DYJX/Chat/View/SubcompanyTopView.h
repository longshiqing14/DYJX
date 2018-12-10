//
//  SubcompanyTopView.h
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ContacterType) {
    ContacterTypeFriend,
    ContacterTypeNormal,
    ContacterTypeBlack,
    ContacterTypeDelete,
};

typedef void(^ContacterTypeBlcak)(NSInteger);

@interface SubcompanyTopView : UIView
@property (weak, nonatomic) IBOutlet UIButton *friendBTN;
@property (weak, nonatomic) IBOutlet UIButton *NormalBTN;
@property (weak, nonatomic) IBOutlet UIButton *BlackBTN;
@property (weak, nonatomic) IBOutlet UIButton *deleteBTN;
@property (nonatomic, copy) ContacterTypeBlcak block;
@end
