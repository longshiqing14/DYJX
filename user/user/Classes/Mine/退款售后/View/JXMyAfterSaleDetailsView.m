//
//  JXMyAfterSaleDetailsView.m
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailsView.h"

@implementation JXMyAfterSaleDetailsView

-(void)myAfterSaleDetails:(NSString *)returnState{
    self.returnStateLable.text= [NSString stringWithFormat:@"申请进度：%@",returnState];
}

@end
