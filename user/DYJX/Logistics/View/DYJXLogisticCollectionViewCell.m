//
//  DYJXLogisticCollectionViewCell.m
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLogisticCollectionViewCell.h"

@implementation DYJXLogisticCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end
