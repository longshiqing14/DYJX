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
    self.backgroundColor = [UIColor colorWithHexString:@"#6595F2"];
//    self.layer.borderColor = [UIColor blackColor].CGColor;
//    self.layer.borderWidth = 2;
//    self.layer.cornerRadius = 5;
//    self.layer.masksToBounds = YES;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}


- (void)layoutSubviews {
    WeakSelf
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.height.equalTo(weakSelf.imageView.mas_width);
//        make.center.equalTo(weakSelf);
    }];
    
    [self.content1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imageView.mas_bottom);
        make.left.right.bottom.equalTo(weakSelf);
    }];
}

@end
