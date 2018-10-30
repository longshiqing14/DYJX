//
//  XYTableViewFooterIntervalView.m
//  user
//
//  Created by xingyun on 2017/10/31.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYTableViewFooterIntervalView.h"

@implementation XYTableViewFooterIntervalView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = XYGlobalBg;
        
    }
    return self;
}


#pragma mark -  headerView init

+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYTableViewFooterIntervalView";
    XYTableViewFooterIntervalView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[XYTableViewFooterIntervalView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}

@end
