//
//  XYOrderCommentDetailWebVC.m
//  user
//
//  Created by xingyun on 2017/9/30.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentDetailWebVC.h"

@interface XYOrderCommentDetailWebVC ()

@end

@implementation XYOrderCommentDetailWebVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.webURLstr = [NSString stringWithFormat:@"%@choice/comment.html?=%@=%@",BEST_H5_URL,self.apprId,self.productId];
    [self loadRequestUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
#pragma mark - 继承 父类

- (void)webViewLoadingEnd
{
    if (self.apprId != nil) {
        
        [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
    }
}



@end
