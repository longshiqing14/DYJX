//
//  JXSearchHistoryCollectionReusableHeaderView.h
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXSearchHistoryCollectionReusableHeaderView;

@protocol UICollectionReusableHeaderViewButtonDelegate <NSObject>

- (void)delectData:(JXSearchHistoryCollectionReusableHeaderView *)view;

@end

@interface JXSearchHistoryCollectionReusableHeaderView : UICollectionReusableView

@property (weak, nonatomic) id<UICollectionReusableHeaderViewButtonDelegate> delectDelegate;
@property (strong,nonatomic) UILabel* textLabel;

@property (strong,nonatomic) UIImageView *imageView;

@property (strong,nonatomic) UIButton *delectButton;

- (void) setText:(NSString*)text;

- (void) setImage:(NSString *)image;
@end
