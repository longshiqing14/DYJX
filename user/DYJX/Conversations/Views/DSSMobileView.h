//
//  DSSMobileView.h
//  user
//
//  Created by longshiqing on 2019/5/5.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MobileType) {
    MobileTypeAll,
    MobileTypeClear,
    MobileTypeFriend,
    MobileTypeNormal,
    MobileTypeBlack,
    MobileTypeDelete,
};

NS_ASSUME_NONNULL_BEGIN

typedef void(^MobileTypeBlcak)(NSInteger);

@interface DSSMobileView  : UIView

@property (weak, nonatomic) IBOutlet UIButton *allSelectBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIButton *friendBTN;
@property (weak, nonatomic) IBOutlet UIButton *NormalBTN;
@property (weak, nonatomic) IBOutlet UIButton *BlackBTN;
@property (weak, nonatomic) IBOutlet UIButton *deleteBTN;
@property (nonatomic, copy) MobileTypeBlcak block;


@end

NS_ASSUME_NONNULL_END
