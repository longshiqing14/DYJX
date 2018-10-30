//
//  XYUMSocialShareItemCVC.h
//  user
//
//  Created by xingyun on 2017/9/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XYUMSocialShareItemCVCDelegate <NSObject>

@optional

/** 点击的 item  */
- (void)XYUMSocialShareItemSelect:(NSString*)type;

@end

@interface XYUMSocialShareItemCVC : UICollectionViewController

@property (nonatomic, weak) id<XYUMSocialShareItemCVCDelegate> delegate;

@end
