//
//  DXZMobileContactsPage.h
//  user
//
//  Created by longshiqing on 2019/4/27.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PageMobileType) {
    PageMobileTypeAll,
    PageMobileTypeClear,
    PageMobileTypeFriend,
    PageMobileTypeNormal,
    PageMobileTypeBlack,
    PageMobileTypeDelete,
};

NS_ASSUME_NONNULL_BEGIN

@interface DXZMobileContactsPage : UIViewController

@property (nonatomic, assign)PageMobileType pageType;

@end

NS_ASSUME_NONNULL_END
