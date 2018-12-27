//
//  DYLocationTableViewCell.m
//  user
//
//  Created by longshiqing on 2018/12/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYLocationTableViewCell.h"

@implementation DYLocationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.subTitle];
        [self.contentView addSubview:self.rightImageView];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf;
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(14, 15, 0, 15));
        make.height.mas_equalTo(15);
    }];

    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.title.mas_bottom).offset(14);
        make.left.right.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(0, 15, 0, 40));
        make.height.mas_equalTo(14);
    }];

    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView).offset(-15);
        make.centerY.equalTo(weakSelf.contentView);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
}


-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor colorWithHexString:@"333333"];
        _title.font = [UIFont systemFontOfSize:15];
    }
    return _title;
}

-(UILabel *)subTitle {
    if (!_subTitle) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor colorWithHexString:@"555555"];
        _title.font = [UIFont systemFontOfSize:14];
    }
    return _subTitle;
}

-(UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}

@end
