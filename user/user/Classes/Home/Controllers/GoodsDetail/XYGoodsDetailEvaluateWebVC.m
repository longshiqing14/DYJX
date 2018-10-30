//
//  XYGoodsDetailEvaluateWebVC.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsDetailEvaluateWebVC.h"

@interface XYGoodsDetailEvaluateWebVC ()

@end

@implementation XYGoodsDetailEvaluateWebVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // 商品详情  评论
    self.view.backgroundColor = XYGlobalBg;
    
    
    self.webURLstr = [NSString stringWithFormat:@"%@choice/comment_list.html?product_id=%@",BEST_H5_URL,self.productId];
    
    [self loadRequestUrl];
    

}

#pragma mark - 继承 父类

- (void)webViewLoadingEnd
{
    if (self.productId != nil) {
        
        [self.myWebView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
