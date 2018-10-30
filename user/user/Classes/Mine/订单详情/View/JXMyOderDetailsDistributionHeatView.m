//
//  JXMyOderDetailsPayHeatView.m
//  user
//
//  Created by liu_yakai on 2018/4/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDetailsDistributionHeatView.h"

@implementation JXMyOderDetailsDistributionHeatView

-(void)distribution_init:(NSString *)distribution{
    self.distributionLable.text=[NSString stringWithFormat:@"配送方式：%@",distribution];
}

@end
