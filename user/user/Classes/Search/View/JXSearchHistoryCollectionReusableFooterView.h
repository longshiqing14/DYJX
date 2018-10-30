//
//  JXSearchHistoryCollectionReusableFooterView.h
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EABASearchCollectionReusableFooterView;

@protocol UICollectionReusableViewButtonDelegate <NSObject>

- (void)delectData:(EABASearchCollectionReusableFooterView *)view;

@end


@interface JXSearchHistoryCollectionReusableFooterView : UICollectionReusableView

@property (strong,nonatomic) UIButton *delectButton;

@property (weak, nonatomic) id<UICollectionReusableViewButtonDelegate> delectDelegate;

- (void) setText:(NSString*)text;

- (void) setImage:(NSString *)image;

@end
