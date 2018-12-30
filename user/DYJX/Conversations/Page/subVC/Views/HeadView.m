//
//  HeadView.m
//  user
//
//  Created by longshiqing on 2018/12/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(((kScreenWidth - 20)/3.0 - 25)/2.0, 10, 25, 50);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 65, (kScreenWidth - 20)/3.0, 15);
}


@end
