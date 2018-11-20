//
//  SampleButtonTableViewCell.m
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "SampleButtonTableViewCell.h"

@implementation SampleButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.sampleButton];
    }
    return self;
}

#pragma mark - Action
-(void)btnClick:(UIButton *)sender {
    if (self.callBack) {
        self.callBack(nil, 1); // 数据自己定义
    }
}

-(void)setModel:(id)model {

}

-(void)layoutSubviews {
    WeakSelf
    [self.sampleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(5, 30, 5, 30));
    }];
}

#pragma mark - UI
-(UIButton *)sampleButton {
    if (!_sampleButton) {
        _sampleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sampleButton setTitle:@"sample" forState:UIControlStateNormal];
        [_sampleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sampleButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _sampleButton.layer.masksToBounds = YES;
        _sampleButton.layer.borderWidth = 1.0;
        _sampleButton.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _sampleButton;
}


@end
