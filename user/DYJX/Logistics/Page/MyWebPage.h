//
//  MyWebPage.h
//  user
//
//  Created by longshiqing on 2019/1/29.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWebPage : UIViewController

@property (nonatomic, copy)NSString *url;

-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
