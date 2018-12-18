//
//  DYJXLasterListCell.m
//  user
//
//  Created by longshiqing on 2018/11/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLasterListCell.h"

@implementation DYJXLasterListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.porityImage];
        [self addSubview:self.timeLabel];
        [self addSubview:self.title];
        [self addSubview:self.content];
        [self addSubview:self.dotLabel];
        [self addSubview:self.line];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf
    [self.porityImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakSelf).insets(UIEdgeInsetsMake(10, 10, 10, 0));
        make.width.mas_equalTo(40);
    }];

    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(10.5, 0, 0, 10));
        make.height.equalTo(@14);
    }];

    [self.dotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 10, 10));
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];

    [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.timeLabel.mas_left).offset(-10);
        make.left.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(10, 60, 0, 0));
        make.height.mas_equalTo(15);
    }];

    [self.content mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.dotLabel.mas_left).offset(-10);
        make.left.equalTo(weakSelf).offset(60);
        make.top.equalTo(weakSelf.title.mas_bottom).offset(10);
        make.height.equalTo(@14);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@0.5);
    }];
}

-(void)setCircle:(BOOL)isCircle {
    if (isCircle) {
        self.porityImage.layer.masksToBounds = YES;
        self.porityImage.layer.cornerRadius = 20;
    }
    else {
        self.porityImage.layer.masksToBounds = YES;
        self.porityImage.layer.cornerRadius = 2;
    }
}

-(void)setNumber:(NSInteger)number {
    if (number && number > 0) {
        [self.dotLabel setHidden:false];
        if (number > 99) {
            self.dotLabel.text = @"99";
        }
        else {
            self.dotLabel.text = [NSString stringWithFormat:@"%ld",(long)number];
        }
    }
    else {
        [self.dotLabel setHidden:true];
    }
}

#pragma mark - UI
-(UILabel *)line {
    if (!_line) {
        _line = [[UILabel alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}
-(UIImageView *)porityImage {
    if (!_porityImage) {
        _porityImage = [[UIImageView alloc] init];
    }
    return _porityImage;
}
-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor colorWithHexString:@"#333333"];
        _title.font = [UIFont systemFontOfSize:15];
    }
    return _title;
}
-(UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] init];
        _content.textColor = [UIColor colorWithHexString:@"#888888"];
        _content.font = [UIFont systemFontOfSize:14];
    }
    return _content;
}
-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#888888"];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}
-(UILabel *)dotLabel {
    if (!_dotLabel) {
        _dotLabel = [[UILabel alloc]init];
        _dotLabel.backgroundColor = [UIColor colorWithRed:219/255.0 green:55/255.0 blue:48/255.0 alpha:1];
        _dotLabel.textAlignment = NSTextAlignmentCenter;
        _dotLabel.font = [UIFont systemFontOfSize:12];
        _dotLabel.textColor = [UIColor whiteColor];
        _dotLabel.layer.masksToBounds = true;
        _dotLabel.layer.cornerRadius = 8;
        [_dotLabel setHidden:true];
        _dotLabel.text = @"1";
    }
    return _dotLabel;
}

@end
