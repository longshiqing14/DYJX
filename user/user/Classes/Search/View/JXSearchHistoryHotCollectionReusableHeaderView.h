//
//  JXSearchHistoryHotCollectionReusableHeaderView.h
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXSearchHistoryHotCollectionReusableHeaderView : UICollectionReusableView

@property (strong,nonatomic) UILabel* textLabel;

@property (strong,nonatomic) UIImageView *imageView;


- (void) setText:(NSString*)text;

- (void) setImage:(NSString *)image;
@end
